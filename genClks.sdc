#ADD "set detailed_sdc_messages true" to tcl script for better error messages
# Note: this flow does not fix hold timing
set SETUP_CLOCK_UNCERTAINTY 0.5

# Main clock and reset ports
set MAIN_CLK_PIN i_clk
set MAIN_RST_PIN rst_ni

# Original: Clock period (8 ns) — 125 MHz: -17,000 slack
# First Run: Clock period (16 ns) — 62.5 MHz, -9000 slack
# Second Run: Clock period (32 ns) — 31.25 MHz, -2000 slack
set MAIN_TCK 32.0

# Typical I/O delays (adjust for your platform)
set IN_DEL  1.0
set OUT_DEL 1.0

# Delay budget for in-to-out paths
set DELAY ${MAIN_TCK}

#####################
# Clock definition  #
#####################

# Define the main clock
create_clock -name MAIN_CLK -period ${MAIN_TCK} [get_ports ${MAIN_CLK_PIN}]

# Apply setup uncertainty to the clock
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks MAIN_CLK]

# Mark clock and reset as ideal (no CTS in synthesis)
set_ideal_network [get_ports ${MAIN_CLK_PIN}]
set_ideal_network [get_ports ${MAIN_RST_PIN}]

#create_clock -name CLK_RAND  -period ${MAIN_TCK} [get_pins u_clkgen/o_clk]

#create_clock -name CORE_CLK  -period ${MAIN_TCK} [get_pins core_clock_gate_i/clk_o]

create_generated_clock -name CLK_RAND -source [get_ports ${MAIN_CLK_PIN}] -divide_by 1 [get_pins u_clkgen/o_clk]

create_generated_clock -name CLK_GATED -source [get_pins u_clkgen/o_clk] -divide_by 1 [get_pins u_ibex_core/clk_i]



# set_clock_gating_check -setup 0.2 -hold 0.1 [get_clocks CLK_GATED]
##########################
# Input/Output Constraints
##########################

# Maximum delay for timing closure between input/output paths
set_max_delay ${DELAY} -from [all_inputs] -to [all_outputs]

# Input and output delays (relative to the clock)
set_input_delay  ${IN_DEL}  -clock MAIN_CLK [remove_from_collection [all_inputs] [get_ports ${MAIN_CLK_PIN}]]
set_output_delay ${OUT_DEL} -clock MAIN_CLK [all_outputs]


#####################
# I/O drive/load    #
#####################

# Attach load and drivers to IOs to get a more realistic estimate.
# DRIVING_CELL, DRIVING_CELL_PIN, LOAD_CELL_LIB, LOAD_CELL, and
# LOAD_CELL_PIN must be defined in the synthesis script.
if {[info exists DRIVING_CELL]} {
  set_driving_cell -no_design_rule -lib_cell ${DRIVING_CELL} -pin ${DRIVING_CELL_PIN} [all_inputs]
}
if {[info exists LOAD_CELL_LIB] && [info exists LOAD_CELL]} {
  set_load [load_of ${LOAD_CELL_LIB}/${LOAD_CELL}/${LOAD_CELL_PIN}] [all_outputs]
}


# Set a nonzero critical range to be able to spot the violating paths better
# in the report. DUT must be defined in the synthesis script.
if {[info exists DUT]} {
  set_critical_range 0.5 ${DUT}
}

#####################
# Size Only Cells   #
#####################

#set_size_only -all_instances [get_cells -hierarchical *u_size_only*] true

# Commented out: no *u_size_only* cells exist in the masked wrapper design,
# and -all_instances is not valid in Genus (Synopsys DC only).
# set_size_only -all_instances [get_cells -hierarchical *u_size_only*] true                                                                                                                                                                                                                                      
