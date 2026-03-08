`timescale 1ns/1ps
`include "prim_assert.sv"

module masked_core_tb;
  import ibex_pkg::*;

  // ===========================
  // Clock and Reset
  // ===========================
  logic clk, rst_n;
  initial begin clk = 0; forever #5 clk = ~clk; end  // 100 MHz
  initial begin
    rst_n = 0;
    repeat (100) @(posedge clk);
    rst_n = 1;
  end

  // ===========================
  // GNG for randbits
  // ===========================
  logic [15:0] randbits;
  logic        rng_valid;
  gng u_gng (
    .clk       (clk),
    .rstn      (rst_n),
    .ce        (1'b1),
    .valid_out (rng_valid),
    .data_out  (randbits)
  );

  // ===========================
  // Memory Interface Signals
  // ===========================
  logic        instr_req, instr_gnt, instr_rvalid;
  logic [31:0] instr_addr, instr_rdata;
  logic [6:0]  instr_rdata_intg;

  logic        data_req, data_gnt, data_rvalid, data_we;
  logic [3:0]  data_be;
  logic [31:0] data_addr, data_wdata, data_rdata;
  logic [6:0]  data_rdata_intg, data_wdata_intg;

  // ===========================
  // Interrupt Signals
  // ===========================
  logic irq_external, irq_timer;

  // ===========================
  // DUT: ibex_top_tracing
  // (includes ibex_tracer for automatic trace generation)
  // ===========================
  ibex_top_tracing #(
    .PMPEnable        (1'b1),
    .PMPGranularity   (0),
    .PMPNumRegions    (16),
    .MHPMCounterNum   (10),
    .MHPMCounterWidth (40),
    .RV32E            (1'b0),
    .RV32M            (ibex_pkg::RV32MFast),
    .RV32B            (ibex_pkg::RV32BNone),
    .RegFile          (ibex_pkg::RegFileFF),
    .BranchTargetALU  (1'b1),
    .WritebackStage   (1'b1),
    .ICache           (1'b0),
    .ICacheECC        (1'b0),
    .SecureIbex       (1'b0),
    .ICacheScramble   (1'b0),
    .BranchPredictor  (1'b0),
    .DbgTriggerEn     (1'b1),
    .DbgHwBreakNum    (1)
  ) u_dut (
    .clk_i                  (clk),
    .rst_ni                 (rst_n),

    .test_en_i              (1'b0),
    .scan_rst_ni            (1'b1),
    .ram_cfg_i              ('0),

    .hart_id_i              (32'b0),
    .boot_addr_i            (32'h80000000),

    .instr_req_o            (instr_req),
    .instr_gnt_i            (instr_gnt),
    .instr_rvalid_i         (instr_rvalid),
    .instr_addr_o           (instr_addr),
    .instr_rdata_i          (instr_rdata),
    .instr_rdata_intg_i     (7'b0),
    .instr_err_i            (1'b0),

    .data_req_o             (data_req),
    .data_gnt_i             (data_gnt),
    .data_rvalid_i          (data_rvalid),
    .data_we_o              (data_we),
    .data_be_o              (data_be),
    .data_addr_o            (data_addr),
    .data_wdata_o           (data_wdata),
    .data_wdata_intg_o      (data_wdata_intg),
    .data_rdata_i           (data_rdata),
    .data_rdata_intg_i      (7'b0),
    .data_err_i             (1'b0),

    .irq_software_i         (1'b0),
    .irq_timer_i            (irq_timer),
    .irq_external_i         (irq_external),
    .irq_fast_i             (15'b0),
    .irq_nm_i               (1'b0),

    .scramble_key_valid_i   (1'b0),
    .scramble_key_i         ('0),
    .scramble_nonce_i       ('0),
    .scramble_req_o         (),

    .debug_req_i            (1'b0),
    .crash_dump_o           (),
    .double_fault_seen_o    (),

    .fetch_enable_i         (ibex_pkg::IbexMuBiOn),
    .alert_minor_o          (),
    .alert_major_internal_o (),
    .alert_major_bus_o      (),
    .core_sleep_o           (),

    .randbits               (randbits)
  );


  // ===========================
  // Sparse Memory Model
  // ===========================
  logic [7:0] mem [logic [31:0]];  // Associative array = sparse memory

  // Load binary from plusarg or default
  initial begin
    automatic string bin_file;
    automatic int fd;
    automatic bit [7:0] r8;
    automatic bit [31:0] addr;

    if (!$value$plusargs("bin=%s", bin_file))
      bin_file = "test.bin";

    addr = 32'h80000000;
    fd = $fopen(bin_file, "rb");
    if (!fd) $fatal(1, "Cannot open binary file: %s", bin_file);

    while ($fread(r8, fd)) begin
      mem[addr] = r8;
      addr++;
    end
    $fclose(fd);
    $display("[TB] Loaded %0d bytes from %s at 0x80000000", addr - 32'h80000000, bin_file);
  end

  // Read 32-bit word from sparse memory (little-endian)
  function automatic logic [31:0] mem_rd32(input logic [31:0] a);
    logic [31:0] d;
    d[ 7: 0] = mem.exists(a)   ? mem[a]   : 8'h00;
    d[15: 8] = mem.exists(a+1) ? mem[a+1] : 8'h00;
    d[23:16] = mem.exists(a+2) ? mem[a+2] : 8'h00;
    d[31:24] = mem.exists(a+3) ? mem[a+3] : 8'h00;
    return d;
  endfunction

  // Write bytes to sparse memory with byte enables
  function automatic void mem_wr32(input logic [31:0] a, input logic [31:0] d, input logic [3:0] be);
    if (be[0]) mem[a]   = d[ 7: 0];
    if (be[1]) mem[a+1] = d[15: 8];
    if (be[2]) mem[a+2] = d[23:16];
    if (be[3]) mem[a+3] = d[31:24];
  endfunction

  // ===========================
  // Instruction Memory Responder
  // (Combinational grant, 1-cycle data response)
  // ===========================
  assign instr_gnt = instr_req;  // Grant IMMEDIATELY (combinational)

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      instr_rvalid <= 1'b0;
      instr_rdata  <= '0;
    end else begin
      instr_rvalid <= instr_req;  // Data valid 1 cycle after handshake
      if (instr_req)
        instr_rdata <= mem_rd32({instr_addr[31:2], 2'b00});
    end
  end

  // ===========================
  // Data Memory Responder
  // (Combinational grant, 1-cycle data response)
  // ===========================
  assign data_gnt = data_req;  // Grant IMMEDIATELY (combinational)

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_rvalid <= 1'b0;
      data_rdata  <= '0;
    end else begin
      data_rvalid <= data_req;
      if (data_req) begin
        if (data_we)
          mem_wr32({data_addr[31:2], 2'b00}, data_wdata, data_be);
        data_rdata <= data_we ? '0 : mem_rd32({data_addr[31:2], 2'b00});
      end
    end
  end

  // ===========================
  // Termination Detection
  // (Matches RISCV-DV test-end handshake protocol)
  // ===========================
  logic [31:0] sig_addr;
  logic [31:0] test_ctrl_addr;  // = sig_addr - 4

  initial begin
    if (!$value$plusargs("signature_addr=%h", sig_addr))
      sig_addr = 32'h8ffffffc;
    test_ctrl_addr = sig_addr - 32'h4;
  end

  always @(posedge clk) begin
    if (rst_n && data_req && data_we &&
        {data_addr[31:2], 2'b00} == test_ctrl_addr &&
        data_wdata[7:0] == 8'h01) begin
      if (data_wdata[8] == 1'b0) begin
        $display("[TB] *** TEST PASSED at %0t ***", $time);
      end else begin
        $display("[TB] *** TEST FAILED at %0t ***", $time);
      end
      repeat (10) @(posedge clk);
      $finish;
    end
  end

  // Timeout (safety net)
  initial begin
    automatic int timeout_cycles;
    if (!$value$plusargs("timeout_cycles=%d", timeout_cycles))
      timeout_cycles = 5_000_000;
    repeat (timeout_cycles) @(posedge clk);
    $display("[TB] *** TIMEOUT after %0d cycles ***", timeout_cycles);
    $finish;
  end

  // ===========================
  // Interrupt Injector + Latency Measurement (closed-loop)
  // ===========================
  //
  // This version injects ONE interrupt at a time:
  //   1) wait until scheduled inject point
  //   2) assert irq_external and remember assert cycle
  //   3) keep irq_external high until handler entry is observed via RVFI
  //   4) record latency for that ONE serviced interrupt
  //   5) deassert irq_external
  //   6) wait irq_interval cycles before next injection
  //
  // Plusargs:
  //   +irq_enable=1           -- enable interrupt injection
  //   +irq_interval=10000     -- cooldown cycles after each measured interrupt
  //   +irq_first_delay=5000   -- cycles after reset before first interrupt
  //   +irq_pulse_width=10     -- parsed for compatibility, UNUSED in closed-loop mode
  //   +irq_max_count=20       -- stop after N measured interrupts (0 = unlimited)
  //   +latency_log=<file>     -- output file (default: irq_latency.log)

  // Configuration
  int unsigned cfg_irq_interval, cfg_irq_first_delay, cfg_irq_pulse_width, cfg_irq_max_count;
  bit          cfg_irq_enable;

  initial begin
    cfg_irq_enable      = 0;
    cfg_irq_interval    = 10000;
    cfg_irq_first_delay = 5000;
    cfg_irq_pulse_width = 10;   // unused in closed-loop mode; kept for script compatibility
    cfg_irq_max_count   = 0;
    void'($value$plusargs("irq_enable=%d",      cfg_irq_enable));
    void'($value$plusargs("irq_interval=%d",    cfg_irq_interval));
    void'($value$plusargs("irq_first_delay=%d", cfg_irq_first_delay));
    void'($value$plusargs("irq_pulse_width=%d", cfg_irq_pulse_width));
    void'($value$plusargs("irq_max_count=%d",   cfg_irq_max_count));
  end

  // Cycle counter (free-running from reset release)
  int unsigned cycle_cnt;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) cycle_cnt <= 0;
    else        cycle_cnt <= cycle_cnt + 1;
  end

  // RVFI trap-handler entry detect
  logic rvfi_handler_entry;
  assign rvfi_handler_entry = u_dut.rvfi_valid && u_dut.rvfi_intr;

  // Injector state
  typedef enum logic [1:0] {
    IRQ_IDLE,
    IRQ_WAIT_TO_ASSERT,
    IRQ_WAIT_HANDLER,
    IRQ_DONE
  } irq_state_e;

  irq_state_e  irq_state;
  int unsigned irq_issue_count;
  int unsigned irq_assert_cycle;
  int unsigned irq_next_cycle;

  // Latency stats
  int unsigned lat_count;
  int unsigned lat_total;
  int unsigned lat_min;
  int unsigned lat_max;
  int          lat_fd;

  initial begin
    automatic string lat_file;
    if (!$value$plusargs("latency_log=%s", lat_file))
      lat_file = "irq_latency.log";
    lat_fd = $fopen(lat_file, "w");
    if (lat_fd) begin
      $fwrite(lat_fd, "# Interrupt Latency Measurements (closed-loop)\n");
      $fwrite(lat_fd, "# IRQ#, Assert_Cycle, Handler_Cycle, Latency_Cycles, Handler_PC\n");
    end
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      irq_external     <= 1'b0;
      irq_state        <= IRQ_IDLE;
      irq_issue_count  <= 0;
      irq_assert_cycle <= 0;
      irq_next_cycle   <= 0;

      lat_count        <= 0;
      lat_total        <= 0;
      lat_min          <= 32'hFFFF_FFFF;
      lat_max          <= 0;
    end else if (!cfg_irq_enable) begin
      irq_external <= 1'b0;
      irq_state    <= IRQ_IDLE;
    end else begin
      case (irq_state)

        IRQ_IDLE: begin
          irq_external   <= 1'b0;
          irq_next_cycle <= cfg_irq_first_delay;
          if (cfg_irq_max_count != 0 && lat_count >= cfg_irq_max_count)
            irq_state <= IRQ_DONE;
          else
            irq_state <= IRQ_WAIT_TO_ASSERT;
        end

        IRQ_WAIT_TO_ASSERT: begin
          irq_external <= 1'b0;
          if (cfg_irq_max_count != 0 && lat_count >= cfg_irq_max_count) begin
            irq_state <= IRQ_DONE;
          end else if (cycle_cnt >= irq_next_cycle) begin
            irq_external     <= 1'b1;
            irq_issue_count  <= irq_issue_count + 1;
            irq_assert_cycle <= cycle_cnt;
            irq_state        <= IRQ_WAIT_HANDLER;

            $display("[IRQ-INJ] #%0d: Assert irq_external at cycle %0d",
                     irq_issue_count + 1, cycle_cnt);
          end
        end

        IRQ_WAIT_HANDLER: begin
          irq_external <= 1'b1;

          if (rvfi_handler_entry) begin
            automatic int unsigned latency;
            automatic int unsigned next_count;
            automatic int unsigned next_total;
            automatic int unsigned next_min;
            automatic int unsigned next_max;

            latency    = cycle_cnt - irq_assert_cycle;
            next_count = lat_count + 1;
            next_total = lat_total + latency;
            next_min   = (latency < lat_min) ? latency : lat_min;
            next_max   = (latency > lat_max) ? latency : lat_max;

            lat_count  <= next_count;
            lat_total  <= next_total;
            lat_min    <= next_min;
            lat_max    <= next_max;

            $display("[IRQ-LAT] #%0d: Assert@%0d -> Handler@%0d  Latency = %0d cycles  PC=0x%08x",
                     next_count, irq_assert_cycle, cycle_cnt, latency, u_dut.rvfi_pc_rdata);

            if (lat_fd)
              $fwrite(lat_fd, "%0d, %0d, %0d, %0d, 0x%08x\n",
                      next_count, irq_assert_cycle, cycle_cnt, latency, u_dut.rvfi_pc_rdata);

            irq_external <= 1'b0;
            $display("[IRQ-INJ] #%0d: Deassert irq_external at cycle %0d",
                     irq_issue_count, cycle_cnt);

            if (cfg_irq_max_count != 0 && next_count >= cfg_irq_max_count) begin
              irq_state <= IRQ_DONE;
            end else begin
              irq_next_cycle <= cycle_cnt + cfg_irq_interval;
              irq_state      <= IRQ_WAIT_TO_ASSERT;
            end
          end
        end

        IRQ_DONE: begin
          irq_external <= 1'b0;
          irq_state    <= IRQ_DONE;
        end

        default: begin
          irq_external <= 1'b0;
          irq_state    <= IRQ_IDLE;
        end
      endcase
    end
  end

  assign irq_timer = 1'b0;

  // Print summary when simulation ends
  final begin
    if (cfg_irq_enable && lat_count > 0) begin
      $display("");
      $display("[IRQ-LAT] ============ LATENCY SUMMARY ============");
      $display("[IRQ-LAT]   Interrupts measured : %0d", lat_count);
      $display("[IRQ-LAT]   Min latency         : %0d cycles", lat_min);
      $display("[IRQ-LAT]   Max latency         : %0d cycles", lat_max);
      $display("[IRQ-LAT]   Avg latency         : %0d cycles", lat_total / lat_count);
      if (irq_state == IRQ_WAIT_HANDLER)
        $display("[IRQ-LAT]   NOTE: Simulation ended with one IRQ still pending service.");
      $display("[IRQ-LAT] ==========================================");

      if (lat_fd) begin
        $fwrite(lat_fd, "\n# ---- Summary ----\n");
        $fwrite(lat_fd, "# Measurements : %0d\n", lat_count);
        $fwrite(lat_fd, "# Min latency  : %0d cycles\n", lat_min);
        $fwrite(lat_fd, "# Max latency  : %0d cycles\n", lat_max);
        $fwrite(lat_fd, "# Avg latency  : %0d cycles\n", lat_total / lat_count);
        if (irq_state == IRQ_WAIT_HANDLER)
          $fwrite(lat_fd, "# NOTE: Simulation ended with one IRQ still pending service.\n");
        $fclose(lat_fd);
      end
    end else if (cfg_irq_enable && lat_count == 0) begin
      $display("[IRQ-LAT] WARNING: No interrupt handler entry was detected.");
      $display("[IRQ-LAT]   Ensure binary was built with +enable_interrupt=1");
      if (lat_fd) begin
        $fwrite(lat_fd, "# WARNING: No interrupt handler entry was detected.\n");
        $fclose(lat_fd);
      end
    end else begin
      if (lat_fd)
        $fclose(lat_fd);
    end
  end

endmodule