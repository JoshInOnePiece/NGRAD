# Set libs and rtl path
set_db init_lib_search_path ../lib/gpdk045_v_6_0/gsclib045/timing
set_db init_hdl_search_path ../rtl

# Read libs
read_libs slow_vdd1v0_basicCells.lib

set top_ex                "ibex_top/u_ibex_core/u_masked"

# How descriptive the logs should be
set_db information_level   9 

## Preserve hierarchies
set_db / .auto_ungroup {none}

# Read the design files
read_hdl -library coreLibCMO ./outputs/noisyCore_netlist.v
read_hdl clkgen.v
read_hdl ring_oscillator.v
read_hdl -sv  ibex_pkg.sv
read_hdl -sv  prim_pkg.sv
read_hdl -sv  prim_ram_1p_pkg.sv
read_hdl -sv  prim_secded_pkg.sv
read_hdl -sv  prim_assert.sv
read_hdl -sv  ibex_alu.sv
read_hdl -sv  ibex_branch_predict.sv
read_hdl -sv  ibex_compressed_decoder.sv
read_hdl -sv  ibex_controller.sv
read_hdl -sv  ibex_csr.sv
read_hdl -sv  ibex_cs_registers.sv
read_hdl -sv  ibex_counter.sv
read_hdl -sv  ibex_decoder.sv
read_hdl -sv  ibex_dummy_instr.sv
read_hdl -sv  ibex_ex_block.sv
read_hdl -sv  ibex_fetch_fifo.sv
read_hdl -sv  ibex_if_stage.sv
read_hdl -sv  ibex_load_store_unit.sv
read_hdl -sv  ibex_multdiv_fast.sv
read_hdl -sv  ibex_multdiv_slow.sv
read_hdl -sv  ibex_pmp.sv
read_hdl -sv  ibex_prefetch_buffer.sv
read_hdl -sv  ibex_register_file_ff.sv
read_hdl -sv  ibex_register_file_fpga.sv
read_hdl -sv  ibex_register_file_latch.sv
read_hdl -sv  ibex_wb_stage.sv
read_hdl -sv  prim_generic_buf.sv
read_hdl -sv  prim_buf.sv
read_hdl -sv  prim_generic_clock_gating.sv
read_hdl -sv  prim_clock_gating.sv
read_hdl -sv  ibex_core_wrapper.sv
read_hdl -sv  ibex_top.sv

# Elaborate top level
elaborate ibex_top

## Initialize the design
init_design

#Read constraints
read_sdc ../constraints/genClks.sdc

check_design -unresolved

set_db "hinst:$top_ex" .dont_touch size_ok

uniquify ibex_top -verbose

# Syntesize
set_db syn_generic_effort   high
set_db syn_map_effort       high 
set_db syn_opt_effort       high

syn_generic
syn_map
syn_opt

# Generate synthesis reports
# Split timing into the main functional clock domain and the generated clock domains
# so clock-gating latch paths do not hide the processor datapath critical path.
report_timing -max_paths 10 -group MAIN_CLK   > ./reports/noisyTop_report_timing_main_clk.rpt
report_timing -max_paths 10 -group CLK_RAND   > ./reports/noisyTop_report_timing_clk_rand.rpt
report_timing -max_paths 10 -group CLK_GATED  > ./reports/noisyTop_report_timing_clk_gated.rpt
report_timing -max_paths 10                  > ./reports/noisyTop_report_timing.rpt
report_power  > ./reports/noisyTop_report_power.rpt
report_area   > ./reports/noisyTop_report_area_3.rpt
report_qor    > ./reports/noisyTop_report_qor.rpt

# Write the synthesized netlist and other output files
write_hdl > ./outputs/noisyTop_netlist.v
write_sdc > ./outputs/noisyTop_sdc.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge -setuphold split > ./outputs/noisyCore_sdf.sdf

#ungroup -all -flatten
