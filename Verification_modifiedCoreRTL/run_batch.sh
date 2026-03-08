#!/bin/bash
# run_batch.sh — Batch comparison with deterministic seeds
#
# Usage: ./run_batch.sh

set -euo pipefail

export PKG_CONFIG_PATH=/home/net/al663069/SD2_ws/tools/spike-ibex/lib/pkgconfig:${PKG_CONFIG_PATH:-}

WS=/home/net/al663069/ws

# ── Define your seeds here ──
#SEEDS=(1000 2000 3000 4000 5000 6000 7000 8000)
SEEDS=(5000)

TESTS=(
    #"riscv_arithmetic_basic_test"
    #"riscv_rv32im_instr_test"
    #"riscv_machine_mode_rand_test"
    #"riscv_rand_instr_test"
    "riscv_rand_jump_test"
   # "riscv_jump_stress_test"
   # "riscv_loop_test"
   # "riscv_mmu_stress_test"
   # "riscv_unaligned_load_store_test"
   # "riscv_illegal_instr_test"
   # "riscv_hint_instr_test"
   # "riscv_ebreak_test"
   # "riscv_user_mode_rand_test"
   # "riscv_pmp_basic_test"
)

RESULTS_FILE=$WS/comparisons/batch_results.txt
SUMMARY_FILE=$WS/comparisons/batch_summary.txt
mkdir -p "$WS/comparisons"

echo "Batch comparison — $(date)" > "$RESULTS_FILE"
echo "Tests: ${#TESTS[@]}, Seeds: ${SEEDS[*]}" >> "$RESULTS_FILE"
echo "==========================================" >> "$RESULTS_FILE"

# Summary header
printf "%-50s %6s %s\n" "TEST" "SEED" "RESULT" > "$SUMMARY_FILE"
printf "%-50s %6s %s\n" "----" "----" "------" >> "$SUMMARY_FILE"

PASS=0
FAIL=0
TOTAL=0

for TEST in "${TESTS[@]}"; do
    for SEED in "${SEEDS[@]}"; do
        TOTAL=$((TOTAL + 1))
        echo ""
        echo "===== [$TOTAL] $TEST  seed=$SEED ====="

        COMPARE_DIR=$WS/comparisons/${TEST}.${SEED}

        if "$WS/run_comparison.sh" "$TEST" "$SEED" 2>&1 | tee -a "$RESULTS_FILE"; then
            RESULT_FILE=$COMPARE_DIR/result.txt
            if [ -f "$RESULT_FILE" ] && grep -q "PASS" "$RESULT_FILE"; then
                PASS=$((PASS + 1))
                echo "  >> PASS" | tee -a "$RESULTS_FILE"
                printf "%-50s %6s %s\n" "$TEST" "$SEED" "PASS" >> "$SUMMARY_FILE"
            else
                FAIL=$((FAIL + 1))
                echo "  >> FAIL (trace mismatch)" | tee -a "$RESULTS_FILE"
                printf "%-50s %6s %s\n" "$TEST" "$SEED" "FAIL (mismatch)" >> "$SUMMARY_FILE"
            fi
        else
            FAIL=$((FAIL + 1))
            echo "  >> FAIL (run error)" | tee -a "$RESULTS_FILE"
            printf "%-50s %6s %s\n" "$TEST" "$SEED" "FAIL (run error)" >> "$SUMMARY_FILE"
        fi

        echo "" >> "$RESULTS_FILE"
    done
done

# Summary footer
echo "" >> "$SUMMARY_FILE"
echo "==========================================" >> "$SUMMARY_FILE"
echo " $PASS passed, $FAIL failed out of $TOTAL total" >> "$SUMMARY_FILE"
echo " Seeds: ${SEEDS[*]}" >> "$SUMMARY_FILE"
echo " $(date)" >> "$SUMMARY_FILE"

echo ""
echo "==========================================" | tee -a "$RESULTS_FILE"
echo " BATCH SUMMARY: $PASS passed, $FAIL failed out of $TOTAL total" | tee -a "$RESULTS_FILE"
echo " Seeds used: ${SEEDS[*]}" | tee -a "$RESULTS_FILE"
echo "==========================================" | tee -a "$RESULTS_FILE"
echo ""
echo "Summary written to: $SUMMARY_FILE"
cat "$SUMMARY_FILE"