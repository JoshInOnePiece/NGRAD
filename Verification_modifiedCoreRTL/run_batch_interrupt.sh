#!/bin/bash
# run_batch_interrupt.sh — Batch interrupt latency measurement
#
# Generates test binaries via Ibex DV (for interrupt handler setup),
# then runs them on masked_core_tb_interrupt.sv with closed-loop interrupt
# injection enabled, collecting latency measurements.
#
# Usage: ./run_batch_interrupt.sh

set -euo pipefail

export PKG_CONFIG_PATH=/home/net/al663069/SD2_ws/tools/spike-ibex/lib/pkgconfig:${PKG_CONFIG_PATH:-}

WS=/home/net/al663069/ws
DV_DIR=$WS/ibex/dv/uvm/core_ibex
MOD_RTL=$WS/scaler_asic_design/modifiedCoreRTL

# ── Interrupt injection parameters ──
# Closed-loop TB semantics:
#   IRQ_FIRST_DELAY = cycles before first interrupt
#   IRQ_INTERVAL    = cooldown cycles after each measured interrupt
#   IRQ_MAX_COUNT   = number of interrupts to measure
#   IRQ_PULSE_WIDTH = parsed by TB for compatibility, but UNUSED in closed-loop mode
IRQ_INTERVAL=300
IRQ_FIRST_DELAY=500
IRQ_PULSE_WIDTH=10
IRQ_MAX_COUNT=500

# ── Seeds ──
SEEDS=(1000 2000 3000 4000 5000 6000 7000 8000 9000)

# ── Tests that have interrupt handlers (+enable_interrupt=1) ──
# These tests generate binaries with proper mtvec setup, mie, and mstatus.MIE
TESTS=(
    "riscv_single_interrupt_test"
    "riscv_multiple_interrupt_test"
    "riscv_interrupt_wfi_test"
    "riscv_nested_interrupt_test"
    "riscv_interrupt_csr_test"
)

# ── Output directories ──
OUT_DIR=$WS/irq_comparisons
RESULTS_FILE=$OUT_DIR/batch_results.txt
SUMMARY_FILE=$OUT_DIR/batch_summary.txt
LATENCY_SUMMARY=$OUT_DIR/latency_summary.txt
mkdir -p "$OUT_DIR"

echo "Interrupt Latency Batch — $(date)" > "$RESULTS_FILE"
echo "Tests: ${#TESTS[@]}, Seeds: ${SEEDS[*]}" >> "$RESULTS_FILE"
echo "IRQ params: interval=$IRQ_INTERVAL first_delay=$IRQ_FIRST_DELAY pulse=$IRQ_PULSE_WIDTH max=$IRQ_MAX_COUNT" >> "$RESULTS_FILE"
echo "==========================================" >> "$RESULTS_FILE"

# Summary header
printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
    "TEST" "SEED" "STATUS" "COUNT" "MIN" "MAX" "AVG" > "$SUMMARY_FILE"
printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
    "----" "----" "------" "-----" "---" "---" "---" >> "$SUMMARY_FILE"

# Latency data header (CSV for easy parsing/plotting)
echo "test,seed,irq_num,assert_cycle,handler_cycle,latency_cycles" > "$LATENCY_SUMMARY"

PASS=0
FAIL=0
TOTAL=0

for TEST in "${TESTS[@]}"; do
    for SEED in "${SEEDS[@]}"; do
        TOTAL=$((TOTAL + 1))
        TEST_DIR=$OUT_DIR/${TEST}.${SEED}
        mkdir -p "$TEST_DIR"

        echo "" | tee -a "$RESULTS_FILE"
        echo "===== [$TOTAL] $TEST  seed=$SEED =====" | tee -a "$RESULTS_FILE"

        # ─────────────────────────────────────────────
        # STEP 1: Generate test binary via DV
        # ─────────────────────────────────────────────
        echo ">>> Step 1: Generating test binary via Ibex DV ..." | tee -a "$RESULTS_FILE"

        cd "$DV_DIR"
        rm -rf out/metadata

        if make SIMULATOR=xlm \
             TEST="$TEST" \
             SEED="$SEED" \
             ITERATIONS=1 \
             COSIM=1 \
             WAVES=1 2>&1 | tee -a "$RESULTS_FILE"; then

            DV_TEST_DIR=$DV_DIR/out/run/tests/${TEST}.${SEED}

            if [ ! -f "$DV_TEST_DIR/test.bin" ]; then
                echo "  >> FAIL (no binary produced)" | tee -a "$RESULTS_FILE"
                FAIL=$((FAIL + 1))
                printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                    "$TEST" "$SEED" "NO_BIN" "-" "-" "-" "-" >> "$SUMMARY_FILE"
                continue
            fi

            cp "$DV_TEST_DIR/test.bin" "$TEST_DIR/"
            cp "$DV_TEST_DIR/test.S"  "$TEST_DIR/" 2>/dev/null || true
            cp "$DV_TEST_DIR/trr.yaml" "$TEST_DIR/" 2>/dev/null || true
            echo "    Binary copied to $TEST_DIR/" | tee -a "$RESULTS_FILE"
        else
            echo "  >> FAIL (DV run error)" | tee -a "$RESULTS_FILE"
            FAIL=$((FAIL + 1))
            printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                "$TEST" "$SEED" "DV_ERR" "-" "-" "-" "-" >> "$SUMMARY_FILE"
            continue
        fi

        # ─────────────────────────────────────────────
        # STEP 2: Run on modified TB with interrupt injection
        # ─────────────────────────────────────────────
        echo "" | tee -a "$RESULTS_FILE"
        echo ">>> Step 2: Running interrupt testbench ..." | tee -a "$RESULTS_FILE"

        cd "$WS"
        rm -rf xcelium.d

        XRUN_INPUT_FILE=${TEST_DIR}/xrun_cmds.tcl
        cat > "$XRUN_INPUT_FILE" <<EOF
source /home/net/cadence/installs/XCELIUM2309/tools/xcelium/files/xmsimrc
run
exit
EOF

        if xrun -64bit \
            -sv \
            -define RVFI \
            -define SYNTHESIS \
            -access rwc \
            -timescale 1ns/1ps \
            +incdir+${MOD_RTL} \
            ${MOD_RTL}/prim_assert.sv \
            ${MOD_RTL}/ibex_pkg.sv \
            ${MOD_RTL}/ibex_tracer_pkg.sv \
            ${MOD_RTL}/prim_ram_1p_pkg.sv \
            ${MOD_RTL}/prim_secded_pkg.sv \
            ${MOD_RTL}/prim_pkg.sv \
            ${MOD_RTL}/gng.v \
            ${MOD_RTL}/ibex_alu.sv \
            ${MOD_RTL}/ibex_compressed_decoder.sv \
            ${MOD_RTL}/ibex_controller.sv \
            ${MOD_RTL}/ibex_counter.sv \
            ${MOD_RTL}/ibex_csr.sv \
            ${MOD_RTL}/ibex_cs_registers.sv \
            ${MOD_RTL}/ibex_decoder.sv \
            ${MOD_RTL}/ibex_dummy_instr.sv \
            ${MOD_RTL}/ibex_ex_block.sv \
            ${MOD_RTL}/ibex_fetch_fifo.sv \
            ${MOD_RTL}/ibex_icache.sv \
            ${MOD_RTL}/ibex_id_stage.sv \
            ${MOD_RTL}/ibex_if_stage.sv \
            ${MOD_RTL}/ibex_load_store_unit.sv \
            ${MOD_RTL}/ibex_lockstep.sv \
            ${MOD_RTL}/ibex_multdiv_fast.sv \
            ${MOD_RTL}/ibex_multdiv_slow.sv \
            ${MOD_RTL}/ibex_prefetch_buffer.sv \
            ${MOD_RTL}/ibex_pmp.sv \
            ${MOD_RTL}/ibex_register_file_ff.sv \
            ${MOD_RTL}/ibex_wb_stage.sv \
            ${MOD_RTL}/ibex_branch_predict.sv \
            ${MOD_RTL}/ibex_core.sv \
            ${MOD_RTL}/ibex_top.sv \
            ${MOD_RTL}/ibex_top_tracing.sv \
            ${MOD_RTL}/ibex_tracer.sv \
            ${MOD_RTL}/prim_buf.sv \
            ${MOD_RTL}/prim_generic_buf.sv \
            ${MOD_RTL}/prim_clock_gating.sv \
            ${MOD_RTL}/prim_generic_clock_gating.sv \
            ${MOD_RTL}/prim_flop_macros.sv \
            masked_core_tb_interrupt.sv \
            +ibex_tracer_file_base=${TEST_DIR}/trace \
            +bin=${TEST_DIR}/test.bin \
            +signature_addr=8ffffffc \
            +irq_enable=1 \
            +irq_interval=${IRQ_INTERVAL} \
            +irq_first_delay=${IRQ_FIRST_DELAY} \
            +irq_pulse_width=${IRQ_PULSE_WIDTH} \
            +irq_max_count=${IRQ_MAX_COUNT} \
            +latency_log=${TEST_DIR}/irq_latency.log \
            -input ${XRUN_INPUT_FILE} \
            -l ${TEST_DIR}/sim.log 2>&1 | tee -a "$RESULTS_FILE"; then

            echo "    Simulation complete" | tee -a "$RESULTS_FILE"
        else
            echo "  >> FAIL (simulation error)" | tee -a "$RESULTS_FILE"
            FAIL=$((FAIL + 1))
            printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                "$TEST" "$SEED" "SIM_ERR" "-" "-" "-" "-" >> "$SUMMARY_FILE"
            continue
        fi

        # Optional: ensure the test actually reached PASS
        SIM_RESULT="UNKNOWN"
        if grep -q "\*\*\* TEST PASSED" "${TEST_DIR}/sim.log"; then
            SIM_RESULT="PASS"
        elif grep -q "\*\*\* TEST FAILED" "${TEST_DIR}/sim.log"; then
            SIM_RESULT="TEST_FAIL"
        fi

        # ─────────────────────────────────────────────
        # STEP 3: Parse latency results
        # ─────────────────────────────────────────────
        echo "" | tee -a "$RESULTS_FILE"
        echo ">>> Step 3: Parsing latency results ..." | tee -a "$RESULTS_FILE"

        LAT_FILE=${TEST_DIR}/irq_latency.log
        if [ -f "$LAT_FILE" ]; then
            LAT_COUNT=$(awk -F',' '
                $0 !~ /^#/ && NF >= 5 { count++ }
                END { print count + 0 }
            ' "$LAT_FILE")

            if [ "$LAT_COUNT" -gt 0 ]; then
                LAT_MIN=$(awk '/^# Min latency/ {print $(NF-1); exit}' "$LAT_FILE")
                LAT_MAX=$(awk '/^# Max latency/ {print $(NF-1); exit}' "$LAT_FILE")
                LAT_AVG=$(awk '/^# Avg latency/ {print $(NF-1); exit}' "$LAT_FILE")

                if [ "${SIM_RESULT}" = "PASS" ]; then
                    PASS=$((PASS + 1))
                    STATUS="PASS"
                else
                    FAIL=$((FAIL + 1))
                    STATUS="${SIM_RESULT}"
                fi

                echo "  >> ${STATUS} — $LAT_COUNT interrupts measured" | tee -a "$RESULTS_FILE"
                echo "     Min=$LAT_MIN  Max=$LAT_MAX  Avg=$LAT_AVG cycles" | tee -a "$RESULTS_FILE"

                printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                    "$TEST" "$SEED" "$STATUS" "$LAT_COUNT" "$LAT_MIN" "$LAT_MAX" "$LAT_AVG" >> "$SUMMARY_FILE"

                awk -F',' -v test="$TEST" -v seed="$SEED" '
                    $0 !~ /^#/ && NF >= 5 {
                        gsub(/^[ \t]+|[ \t]+$/, "", $1)
                        gsub(/^[ \t]+|[ \t]+$/, "", $2)
                        gsub(/^[ \t]+|[ \t]+$/, "", $3)
                        gsub(/^[ \t]+|[ \t]+$/, "", $4)
                        print test "," seed "," $1 "," $2 "," $3 "," $4
                    }
                ' "$LAT_FILE" >> "$LATENCY_SUMMARY"
            else
                FAIL=$((FAIL + 1))
                echo "  >> FAIL — no latency measurements recorded" | tee -a "$RESULTS_FILE"
                printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                    "$TEST" "$SEED" "NO_LAT" "0" "-" "-" "-" >> "$SUMMARY_FILE"
            fi
        else
            FAIL=$((FAIL + 1))
            echo "  >> FAIL — latency log not found" | tee -a "$RESULTS_FILE"
            printf "%-45s %6s %-10s %6s %6s %6s %6s\n" \
                "$TEST" "$SEED" "NO_LOG" "-" "-" "-" "-" >> "$SUMMARY_FILE"
        fi

        echo "" >> "$RESULTS_FILE"
    done
done

# ── Summary footer ──
echo "" >> "$SUMMARY_FILE"
echo "==========================================" >> "$SUMMARY_FILE"
echo " $PASS passed, $FAIL failed out of $TOTAL total" >> "$SUMMARY_FILE"
echo " Seeds: ${SEEDS[*]}" >> "$SUMMARY_FILE"
echo " IRQ: interval=$IRQ_INTERVAL first_delay=$IRQ_FIRST_DELAY pulse=$IRQ_PULSE_WIDTH max=$IRQ_MAX_COUNT" >> "$SUMMARY_FILE"
echo " $(date)" >> "$SUMMARY_FILE"

echo ""
echo "==========================================" | tee -a "$RESULTS_FILE"
echo " BATCH SUMMARY: $PASS passed, $FAIL failed out of $TOTAL total" | tee -a "$RESULTS_FILE"
echo " Seeds used: ${SEEDS[*]}" | tee -a "$RESULTS_FILE"
echo "==========================================" | tee -a "$RESULTS_FILE"
echo ""
echo "Summary:          $SUMMARY_FILE"
echo "Latency data CSV: $LATENCY_SUMMARY"
echo "Detailed log:     $RESULTS_FILE"
echo ""
cat "$SUMMARY_FILE"