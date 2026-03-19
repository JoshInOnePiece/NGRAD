# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Thu Mar 19 01:53:45 EDT 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design ibex_top

create_clock -name "MAIN_CLK" -period 32.0 -waveform {0.0 16.0} [get_ports i_clk]
create_generated_clock -name "CLK_RAND" -divide_by 1     -source [get_ports i_clk]   [get_pins u_clkgen/o_clk] 
create_generated_clock -name "CLK_GATED" -divide_by 1     -source [get_pins u_clkgen/o_clk]   [get_pins u_ibex_core/clk_i] 
set_max_delay 32 -from [list \
  [get_ports i_clk]  \
  [get_ports rst_ni]  \
  [get_ports test_en_i]  \
  [get_ports {ram_cfg_i[rf_cfg][cfg][3]}]  \
  [get_ports {ram_cfg_i[rf_cfg][cfg][2]}]  \
  [get_ports {ram_cfg_i[rf_cfg][cfg][1]}]  \
  [get_ports {ram_cfg_i[rf_cfg][cfg][0]}]  \
  [get_ports {ram_cfg_i[rf_cfg][cfg_en]}]  \
  [get_ports {ram_cfg_i[ram_cfg][cfg][3]}]  \
  [get_ports {ram_cfg_i[ram_cfg][cfg][2]}]  \
  [get_ports {ram_cfg_i[ram_cfg][cfg][1]}]  \
  [get_ports {ram_cfg_i[ram_cfg][cfg][0]}]  \
  [get_ports {ram_cfg_i[ram_cfg][cfg_en]}]  \
  [get_ports {hart_id_i[31]}]  \
  [get_ports {hart_id_i[30]}]  \
  [get_ports {hart_id_i[29]}]  \
  [get_ports {hart_id_i[28]}]  \
  [get_ports {hart_id_i[27]}]  \
  [get_ports {hart_id_i[26]}]  \
  [get_ports {hart_id_i[25]}]  \
  [get_ports {hart_id_i[24]}]  \
  [get_ports {hart_id_i[23]}]  \
  [get_ports {hart_id_i[22]}]  \
  [get_ports {hart_id_i[21]}]  \
  [get_ports {hart_id_i[20]}]  \
  [get_ports {hart_id_i[19]}]  \
  [get_ports {hart_id_i[18]}]  \
  [get_ports {hart_id_i[17]}]  \
  [get_ports {hart_id_i[16]}]  \
  [get_ports {hart_id_i[15]}]  \
  [get_ports {hart_id_i[14]}]  \
  [get_ports {hart_id_i[13]}]  \
  [get_ports {hart_id_i[12]}]  \
  [get_ports {hart_id_i[11]}]  \
  [get_ports {hart_id_i[10]}]  \
  [get_ports {hart_id_i[9]}]  \
  [get_ports {hart_id_i[8]}]  \
  [get_ports {hart_id_i[7]}]  \
  [get_ports {hart_id_i[6]}]  \
  [get_ports {hart_id_i[5]}]  \
  [get_ports {hart_id_i[4]}]  \
  [get_ports {hart_id_i[3]}]  \
  [get_ports {hart_id_i[2]}]  \
  [get_ports {hart_id_i[1]}]  \
  [get_ports {hart_id_i[0]}]  \
  [get_ports {boot_addr_i[31]}]  \
  [get_ports {boot_addr_i[30]}]  \
  [get_ports {boot_addr_i[29]}]  \
  [get_ports {boot_addr_i[28]}]  \
  [get_ports {boot_addr_i[27]}]  \
  [get_ports {boot_addr_i[26]}]  \
  [get_ports {boot_addr_i[25]}]  \
  [get_ports {boot_addr_i[24]}]  \
  [get_ports {boot_addr_i[23]}]  \
  [get_ports {boot_addr_i[22]}]  \
  [get_ports {boot_addr_i[21]}]  \
  [get_ports {boot_addr_i[20]}]  \
  [get_ports {boot_addr_i[19]}]  \
  [get_ports {boot_addr_i[18]}]  \
  [get_ports {boot_addr_i[17]}]  \
  [get_ports {boot_addr_i[16]}]  \
  [get_ports {boot_addr_i[15]}]  \
  [get_ports {boot_addr_i[14]}]  \
  [get_ports {boot_addr_i[13]}]  \
  [get_ports {boot_addr_i[12]}]  \
  [get_ports {boot_addr_i[11]}]  \
  [get_ports {boot_addr_i[10]}]  \
  [get_ports {boot_addr_i[9]}]  \
  [get_ports {boot_addr_i[8]}]  \
  [get_ports {boot_addr_i[7]}]  \
  [get_ports {boot_addr_i[6]}]  \
  [get_ports {boot_addr_i[5]}]  \
  [get_ports {boot_addr_i[4]}]  \
  [get_ports {boot_addr_i[3]}]  \
  [get_ports {boot_addr_i[2]}]  \
  [get_ports {boot_addr_i[1]}]  \
  [get_ports {boot_addr_i[0]}]  \
  [get_ports instr_gnt_i]  \
  [get_ports instr_rvalid_i]  \
  [get_ports {instr_rdata_i[31]}]  \
  [get_ports {instr_rdata_i[30]}]  \
  [get_ports {instr_rdata_i[29]}]  \
  [get_ports {instr_rdata_i[28]}]  \
  [get_ports {instr_rdata_i[27]}]  \
  [get_ports {instr_rdata_i[26]}]  \
  [get_ports {instr_rdata_i[25]}]  \
  [get_ports {instr_rdata_i[24]}]  \
  [get_ports {instr_rdata_i[23]}]  \
  [get_ports {instr_rdata_i[22]}]  \
  [get_ports {instr_rdata_i[21]}]  \
  [get_ports {instr_rdata_i[20]}]  \
  [get_ports {instr_rdata_i[19]}]  \
  [get_ports {instr_rdata_i[18]}]  \
  [get_ports {instr_rdata_i[17]}]  \
  [get_ports {instr_rdata_i[16]}]  \
  [get_ports {instr_rdata_i[15]}]  \
  [get_ports {instr_rdata_i[14]}]  \
  [get_ports {instr_rdata_i[13]}]  \
  [get_ports {instr_rdata_i[12]}]  \
  [get_ports {instr_rdata_i[11]}]  \
  [get_ports {instr_rdata_i[10]}]  \
  [get_ports {instr_rdata_i[9]}]  \
  [get_ports {instr_rdata_i[8]}]  \
  [get_ports {instr_rdata_i[7]}]  \
  [get_ports {instr_rdata_i[6]}]  \
  [get_ports {instr_rdata_i[5]}]  \
  [get_ports {instr_rdata_i[4]}]  \
  [get_ports {instr_rdata_i[3]}]  \
  [get_ports {instr_rdata_i[2]}]  \
  [get_ports {instr_rdata_i[1]}]  \
  [get_ports {instr_rdata_i[0]}]  \
  [get_ports {instr_rdata_intg_i[6]}]  \
  [get_ports {instr_rdata_intg_i[5]}]  \
  [get_ports {instr_rdata_intg_i[4]}]  \
  [get_ports {instr_rdata_intg_i[3]}]  \
  [get_ports {instr_rdata_intg_i[2]}]  \
  [get_ports {instr_rdata_intg_i[1]}]  \
  [get_ports {instr_rdata_intg_i[0]}]  \
  [get_ports instr_err_i]  \
  [get_ports data_gnt_i]  \
  [get_ports data_rvalid_i]  \
  [get_ports {data_rdata_i[31]}]  \
  [get_ports {data_rdata_i[30]}]  \
  [get_ports {data_rdata_i[29]}]  \
  [get_ports {data_rdata_i[28]}]  \
  [get_ports {data_rdata_i[27]}]  \
  [get_ports {data_rdata_i[26]}]  \
  [get_ports {data_rdata_i[25]}]  \
  [get_ports {data_rdata_i[24]}]  \
  [get_ports {data_rdata_i[23]}]  \
  [get_ports {data_rdata_i[22]}]  \
  [get_ports {data_rdata_i[21]}]  \
  [get_ports {data_rdata_i[20]}]  \
  [get_ports {data_rdata_i[19]}]  \
  [get_ports {data_rdata_i[18]}]  \
  [get_ports {data_rdata_i[17]}]  \
  [get_ports {data_rdata_i[16]}]  \
  [get_ports {data_rdata_i[15]}]  \
  [get_ports {data_rdata_i[14]}]  \
  [get_ports {data_rdata_i[13]}]  \
  [get_ports {data_rdata_i[12]}]  \
  [get_ports {data_rdata_i[11]}]  \
  [get_ports {data_rdata_i[10]}]  \
  [get_ports {data_rdata_i[9]}]  \
  [get_ports {data_rdata_i[8]}]  \
  [get_ports {data_rdata_i[7]}]  \
  [get_ports {data_rdata_i[6]}]  \
  [get_ports {data_rdata_i[5]}]  \
  [get_ports {data_rdata_i[4]}]  \
  [get_ports {data_rdata_i[3]}]  \
  [get_ports {data_rdata_i[2]}]  \
  [get_ports {data_rdata_i[1]}]  \
  [get_ports {data_rdata_i[0]}]  \
  [get_ports {data_rdata_intg_i[6]}]  \
  [get_ports {data_rdata_intg_i[5]}]  \
  [get_ports {data_rdata_intg_i[4]}]  \
  [get_ports {data_rdata_intg_i[3]}]  \
  [get_ports {data_rdata_intg_i[2]}]  \
  [get_ports {data_rdata_intg_i[1]}]  \
  [get_ports {data_rdata_intg_i[0]}]  \
  [get_ports data_err_i]  \
  [get_ports irq_software_i]  \
  [get_ports irq_timer_i]  \
  [get_ports irq_external_i]  \
  [get_ports {irq_fast_i[14]}]  \
  [get_ports {irq_fast_i[13]}]  \
  [get_ports {irq_fast_i[12]}]  \
  [get_ports {irq_fast_i[11]}]  \
  [get_ports {irq_fast_i[10]}]  \
  [get_ports {irq_fast_i[9]}]  \
  [get_ports {irq_fast_i[8]}]  \
  [get_ports {irq_fast_i[7]}]  \
  [get_ports {irq_fast_i[6]}]  \
  [get_ports {irq_fast_i[5]}]  \
  [get_ports {irq_fast_i[4]}]  \
  [get_ports {irq_fast_i[3]}]  \
  [get_ports {irq_fast_i[2]}]  \
  [get_ports {irq_fast_i[1]}]  \
  [get_ports {irq_fast_i[0]}]  \
  [get_ports irq_nm_i]  \
  [get_ports scramble_key_valid_i]  \
  [get_ports {scramble_key_i[127]}]  \
  [get_ports {scramble_key_i[126]}]  \
  [get_ports {scramble_key_i[125]}]  \
  [get_ports {scramble_key_i[124]}]  \
  [get_ports {scramble_key_i[123]}]  \
  [get_ports {scramble_key_i[122]}]  \
  [get_ports {scramble_key_i[121]}]  \
  [get_ports {scramble_key_i[120]}]  \
  [get_ports {scramble_key_i[119]}]  \
  [get_ports {scramble_key_i[118]}]  \
  [get_ports {scramble_key_i[117]}]  \
  [get_ports {scramble_key_i[116]}]  \
  [get_ports {scramble_key_i[115]}]  \
  [get_ports {scramble_key_i[114]}]  \
  [get_ports {scramble_key_i[113]}]  \
  [get_ports {scramble_key_i[112]}]  \
  [get_ports {scramble_key_i[111]}]  \
  [get_ports {scramble_key_i[110]}]  \
  [get_ports {scramble_key_i[109]}]  \
  [get_ports {scramble_key_i[108]}]  \
  [get_ports {scramble_key_i[107]}]  \
  [get_ports {scramble_key_i[106]}]  \
  [get_ports {scramble_key_i[105]}]  \
  [get_ports {scramble_key_i[104]}]  \
  [get_ports {scramble_key_i[103]}]  \
  [get_ports {scramble_key_i[102]}]  \
  [get_ports {scramble_key_i[101]}]  \
  [get_ports {scramble_key_i[100]}]  \
  [get_ports {scramble_key_i[99]}]  \
  [get_ports {scramble_key_i[98]}]  \
  [get_ports {scramble_key_i[97]}]  \
  [get_ports {scramble_key_i[96]}]  \
  [get_ports {scramble_key_i[95]}]  \
  [get_ports {scramble_key_i[94]}]  \
  [get_ports {scramble_key_i[93]}]  \
  [get_ports {scramble_key_i[92]}]  \
  [get_ports {scramble_key_i[91]}]  \
  [get_ports {scramble_key_i[90]}]  \
  [get_ports {scramble_key_i[89]}]  \
  [get_ports {scramble_key_i[88]}]  \
  [get_ports {scramble_key_i[87]}]  \
  [get_ports {scramble_key_i[86]}]  \
  [get_ports {scramble_key_i[85]}]  \
  [get_ports {scramble_key_i[84]}]  \
  [get_ports {scramble_key_i[83]}]  \
  [get_ports {scramble_key_i[82]}]  \
  [get_ports {scramble_key_i[81]}]  \
  [get_ports {scramble_key_i[80]}]  \
  [get_ports {scramble_key_i[79]}]  \
  [get_ports {scramble_key_i[78]}]  \
  [get_ports {scramble_key_i[77]}]  \
  [get_ports {scramble_key_i[76]}]  \
  [get_ports {scramble_key_i[75]}]  \
  [get_ports {scramble_key_i[74]}]  \
  [get_ports {scramble_key_i[73]}]  \
  [get_ports {scramble_key_i[72]}]  \
  [get_ports {scramble_key_i[71]}]  \
  [get_ports {scramble_key_i[70]}]  \
  [get_ports {scramble_key_i[69]}]  \
  [get_ports {scramble_key_i[68]}]  \
  [get_ports {scramble_key_i[67]}]  \
  [get_ports {scramble_key_i[66]}]  \
  [get_ports {scramble_key_i[65]}]  \
  [get_ports {scramble_key_i[64]}]  \
  [get_ports {scramble_key_i[63]}]  \
  [get_ports {scramble_key_i[62]}]  \
  [get_ports {scramble_key_i[61]}]  \
  [get_ports {scramble_key_i[60]}]  \
  [get_ports {scramble_key_i[59]}]  \
  [get_ports {scramble_key_i[58]}]  \
  [get_ports {scramble_key_i[57]}]  \
  [get_ports {scramble_key_i[56]}]  \
  [get_ports {scramble_key_i[55]}]  \
  [get_ports {scramble_key_i[54]}]  \
  [get_ports {scramble_key_i[53]}]  \
  [get_ports {scramble_key_i[52]}]  \
  [get_ports {scramble_key_i[51]}]  \
  [get_ports {scramble_key_i[50]}]  \
  [get_ports {scramble_key_i[49]}]  \
  [get_ports {scramble_key_i[48]}]  \
  [get_ports {scramble_key_i[47]}]  \
  [get_ports {scramble_key_i[46]}]  \
  [get_ports {scramble_key_i[45]}]  \
  [get_ports {scramble_key_i[44]}]  \
  [get_ports {scramble_key_i[43]}]  \
  [get_ports {scramble_key_i[42]}]  \
  [get_ports {scramble_key_i[41]}]  \
  [get_ports {scramble_key_i[40]}]  \
  [get_ports {scramble_key_i[39]}]  \
  [get_ports {scramble_key_i[38]}]  \
  [get_ports {scramble_key_i[37]}]  \
  [get_ports {scramble_key_i[36]}]  \
  [get_ports {scramble_key_i[35]}]  \
  [get_ports {scramble_key_i[34]}]  \
  [get_ports {scramble_key_i[33]}]  \
  [get_ports {scramble_key_i[32]}]  \
  [get_ports {scramble_key_i[31]}]  \
  [get_ports {scramble_key_i[30]}]  \
  [get_ports {scramble_key_i[29]}]  \
  [get_ports {scramble_key_i[28]}]  \
  [get_ports {scramble_key_i[27]}]  \
  [get_ports {scramble_key_i[26]}]  \
  [get_ports {scramble_key_i[25]}]  \
  [get_ports {scramble_key_i[24]}]  \
  [get_ports {scramble_key_i[23]}]  \
  [get_ports {scramble_key_i[22]}]  \
  [get_ports {scramble_key_i[21]}]  \
  [get_ports {scramble_key_i[20]}]  \
  [get_ports {scramble_key_i[19]}]  \
  [get_ports {scramble_key_i[18]}]  \
  [get_ports {scramble_key_i[17]}]  \
  [get_ports {scramble_key_i[16]}]  \
  [get_ports {scramble_key_i[15]}]  \
  [get_ports {scramble_key_i[14]}]  \
  [get_ports {scramble_key_i[13]}]  \
  [get_ports {scramble_key_i[12]}]  \
  [get_ports {scramble_key_i[11]}]  \
  [get_ports {scramble_key_i[10]}]  \
  [get_ports {scramble_key_i[9]}]  \
  [get_ports {scramble_key_i[8]}]  \
  [get_ports {scramble_key_i[7]}]  \
  [get_ports {scramble_key_i[6]}]  \
  [get_ports {scramble_key_i[5]}]  \
  [get_ports {scramble_key_i[4]}]  \
  [get_ports {scramble_key_i[3]}]  \
  [get_ports {scramble_key_i[2]}]  \
  [get_ports {scramble_key_i[1]}]  \
  [get_ports {scramble_key_i[0]}]  \
  [get_ports {scramble_nonce_i[63]}]  \
  [get_ports {scramble_nonce_i[62]}]  \
  [get_ports {scramble_nonce_i[61]}]  \
  [get_ports {scramble_nonce_i[60]}]  \
  [get_ports {scramble_nonce_i[59]}]  \
  [get_ports {scramble_nonce_i[58]}]  \
  [get_ports {scramble_nonce_i[57]}]  \
  [get_ports {scramble_nonce_i[56]}]  \
  [get_ports {scramble_nonce_i[55]}]  \
  [get_ports {scramble_nonce_i[54]}]  \
  [get_ports {scramble_nonce_i[53]}]  \
  [get_ports {scramble_nonce_i[52]}]  \
  [get_ports {scramble_nonce_i[51]}]  \
  [get_ports {scramble_nonce_i[50]}]  \
  [get_ports {scramble_nonce_i[49]}]  \
  [get_ports {scramble_nonce_i[48]}]  \
  [get_ports {scramble_nonce_i[47]}]  \
  [get_ports {scramble_nonce_i[46]}]  \
  [get_ports {scramble_nonce_i[45]}]  \
  [get_ports {scramble_nonce_i[44]}]  \
  [get_ports {scramble_nonce_i[43]}]  \
  [get_ports {scramble_nonce_i[42]}]  \
  [get_ports {scramble_nonce_i[41]}]  \
  [get_ports {scramble_nonce_i[40]}]  \
  [get_ports {scramble_nonce_i[39]}]  \
  [get_ports {scramble_nonce_i[38]}]  \
  [get_ports {scramble_nonce_i[37]}]  \
  [get_ports {scramble_nonce_i[36]}]  \
  [get_ports {scramble_nonce_i[35]}]  \
  [get_ports {scramble_nonce_i[34]}]  \
  [get_ports {scramble_nonce_i[33]}]  \
  [get_ports {scramble_nonce_i[32]}]  \
  [get_ports {scramble_nonce_i[31]}]  \
  [get_ports {scramble_nonce_i[30]}]  \
  [get_ports {scramble_nonce_i[29]}]  \
  [get_ports {scramble_nonce_i[28]}]  \
  [get_ports {scramble_nonce_i[27]}]  \
  [get_ports {scramble_nonce_i[26]}]  \
  [get_ports {scramble_nonce_i[25]}]  \
  [get_ports {scramble_nonce_i[24]}]  \
  [get_ports {scramble_nonce_i[23]}]  \
  [get_ports {scramble_nonce_i[22]}]  \
  [get_ports {scramble_nonce_i[21]}]  \
  [get_ports {scramble_nonce_i[20]}]  \
  [get_ports {scramble_nonce_i[19]}]  \
  [get_ports {scramble_nonce_i[18]}]  \
  [get_ports {scramble_nonce_i[17]}]  \
  [get_ports {scramble_nonce_i[16]}]  \
  [get_ports {scramble_nonce_i[15]}]  \
  [get_ports {scramble_nonce_i[14]}]  \
  [get_ports {scramble_nonce_i[13]}]  \
  [get_ports {scramble_nonce_i[12]}]  \
  [get_ports {scramble_nonce_i[11]}]  \
  [get_ports {scramble_nonce_i[10]}]  \
  [get_ports {scramble_nonce_i[9]}]  \
  [get_ports {scramble_nonce_i[8]}]  \
  [get_ports {scramble_nonce_i[7]}]  \
  [get_ports {scramble_nonce_i[6]}]  \
  [get_ports {scramble_nonce_i[5]}]  \
  [get_ports {scramble_nonce_i[4]}]  \
  [get_ports {scramble_nonce_i[3]}]  \
  [get_ports {scramble_nonce_i[2]}]  \
  [get_ports {scramble_nonce_i[1]}]  \
  [get_ports {scramble_nonce_i[0]}]  \
  [get_ports debug_req_i]  \
  [get_ports {fetch_enable_i[3]}]  \
  [get_ports {fetch_enable_i[2]}]  \
  [get_ports {fetch_enable_i[1]}]  \
  [get_ports {fetch_enable_i[0]}]  \
  [get_ports scan_rst_ni]  \
  [get_ports {randbits[15]}]  \
  [get_ports {randbits[14]}]  \
  [get_ports {randbits[13]}]  \
  [get_ports {randbits[12]}]  \
  [get_ports {randbits[11]}]  \
  [get_ports {randbits[10]}]  \
  [get_ports {randbits[9]}]  \
  [get_ports {randbits[8]}]  \
  [get_ports {randbits[7]}]  \
  [get_ports {randbits[6]}]  \
  [get_ports {randbits[5]}]  \
  [get_ports {randbits[4]}]  \
  [get_ports {randbits[3]}]  \
  [get_ports {randbits[2]}]  \
  [get_ports {randbits[1]}]  \
  [get_ports {randbits[0]}] ] -to [list \
  [get_ports instr_req_o]  \
  [get_ports {instr_addr_o[31]}]  \
  [get_ports {instr_addr_o[30]}]  \
  [get_ports {instr_addr_o[29]}]  \
  [get_ports {instr_addr_o[28]}]  \
  [get_ports {instr_addr_o[27]}]  \
  [get_ports {instr_addr_o[26]}]  \
  [get_ports {instr_addr_o[25]}]  \
  [get_ports {instr_addr_o[24]}]  \
  [get_ports {instr_addr_o[23]}]  \
  [get_ports {instr_addr_o[22]}]  \
  [get_ports {instr_addr_o[21]}]  \
  [get_ports {instr_addr_o[20]}]  \
  [get_ports {instr_addr_o[19]}]  \
  [get_ports {instr_addr_o[18]}]  \
  [get_ports {instr_addr_o[17]}]  \
  [get_ports {instr_addr_o[16]}]  \
  [get_ports {instr_addr_o[15]}]  \
  [get_ports {instr_addr_o[14]}]  \
  [get_ports {instr_addr_o[13]}]  \
  [get_ports {instr_addr_o[12]}]  \
  [get_ports {instr_addr_o[11]}]  \
  [get_ports {instr_addr_o[10]}]  \
  [get_ports {instr_addr_o[9]}]  \
  [get_ports {instr_addr_o[8]}]  \
  [get_ports {instr_addr_o[7]}]  \
  [get_ports {instr_addr_o[6]}]  \
  [get_ports {instr_addr_o[5]}]  \
  [get_ports {instr_addr_o[4]}]  \
  [get_ports {instr_addr_o[3]}]  \
  [get_ports {instr_addr_o[2]}]  \
  [get_ports {instr_addr_o[1]}]  \
  [get_ports {instr_addr_o[0]}]  \
  [get_ports data_req_o]  \
  [get_ports data_we_o]  \
  [get_ports {data_be_o[3]}]  \
  [get_ports {data_be_o[2]}]  \
  [get_ports {data_be_o[1]}]  \
  [get_ports {data_be_o[0]}]  \
  [get_ports {data_addr_o[31]}]  \
  [get_ports {data_addr_o[30]}]  \
  [get_ports {data_addr_o[29]}]  \
  [get_ports {data_addr_o[28]}]  \
  [get_ports {data_addr_o[27]}]  \
  [get_ports {data_addr_o[26]}]  \
  [get_ports {data_addr_o[25]}]  \
  [get_ports {data_addr_o[24]}]  \
  [get_ports {data_addr_o[23]}]  \
  [get_ports {data_addr_o[22]}]  \
  [get_ports {data_addr_o[21]}]  \
  [get_ports {data_addr_o[20]}]  \
  [get_ports {data_addr_o[19]}]  \
  [get_ports {data_addr_o[18]}]  \
  [get_ports {data_addr_o[17]}]  \
  [get_ports {data_addr_o[16]}]  \
  [get_ports {data_addr_o[15]}]  \
  [get_ports {data_addr_o[14]}]  \
  [get_ports {data_addr_o[13]}]  \
  [get_ports {data_addr_o[12]}]  \
  [get_ports {data_addr_o[11]}]  \
  [get_ports {data_addr_o[10]}]  \
  [get_ports {data_addr_o[9]}]  \
  [get_ports {data_addr_o[8]}]  \
  [get_ports {data_addr_o[7]}]  \
  [get_ports {data_addr_o[6]}]  \
  [get_ports {data_addr_o[5]}]  \
  [get_ports {data_addr_o[4]}]  \
  [get_ports {data_addr_o[3]}]  \
  [get_ports {data_addr_o[2]}]  \
  [get_ports {data_addr_o[1]}]  \
  [get_ports {data_addr_o[0]}]  \
  [get_ports {data_wdata_o[31]}]  \
  [get_ports {data_wdata_o[30]}]  \
  [get_ports {data_wdata_o[29]}]  \
  [get_ports {data_wdata_o[28]}]  \
  [get_ports {data_wdata_o[27]}]  \
  [get_ports {data_wdata_o[26]}]  \
  [get_ports {data_wdata_o[25]}]  \
  [get_ports {data_wdata_o[24]}]  \
  [get_ports {data_wdata_o[23]}]  \
  [get_ports {data_wdata_o[22]}]  \
  [get_ports {data_wdata_o[21]}]  \
  [get_ports {data_wdata_o[20]}]  \
  [get_ports {data_wdata_o[19]}]  \
  [get_ports {data_wdata_o[18]}]  \
  [get_ports {data_wdata_o[17]}]  \
  [get_ports {data_wdata_o[16]}]  \
  [get_ports {data_wdata_o[15]}]  \
  [get_ports {data_wdata_o[14]}]  \
  [get_ports {data_wdata_o[13]}]  \
  [get_ports {data_wdata_o[12]}]  \
  [get_ports {data_wdata_o[11]}]  \
  [get_ports {data_wdata_o[10]}]  \
  [get_ports {data_wdata_o[9]}]  \
  [get_ports {data_wdata_o[8]}]  \
  [get_ports {data_wdata_o[7]}]  \
  [get_ports {data_wdata_o[6]}]  \
  [get_ports {data_wdata_o[5]}]  \
  [get_ports {data_wdata_o[4]}]  \
  [get_ports {data_wdata_o[3]}]  \
  [get_ports {data_wdata_o[2]}]  \
  [get_ports {data_wdata_o[1]}]  \
  [get_ports {data_wdata_o[0]}]  \
  [get_ports {data_wdata_intg_o[6]}]  \
  [get_ports {data_wdata_intg_o[5]}]  \
  [get_ports {data_wdata_intg_o[4]}]  \
  [get_ports {data_wdata_intg_o[3]}]  \
  [get_ports {data_wdata_intg_o[2]}]  \
  [get_ports {data_wdata_intg_o[1]}]  \
  [get_ports {data_wdata_intg_o[0]}]  \
  [get_ports scramble_req_o]  \
  [get_ports {crash_dump_o[exception_addr][31]}]  \
  [get_ports {crash_dump_o[exception_addr][30]}]  \
  [get_ports {crash_dump_o[exception_addr][29]}]  \
  [get_ports {crash_dump_o[exception_addr][28]}]  \
  [get_ports {crash_dump_o[exception_addr][27]}]  \
  [get_ports {crash_dump_o[exception_addr][26]}]  \
  [get_ports {crash_dump_o[exception_addr][25]}]  \
  [get_ports {crash_dump_o[exception_addr][24]}]  \
  [get_ports {crash_dump_o[exception_addr][23]}]  \
  [get_ports {crash_dump_o[exception_addr][22]}]  \
  [get_ports {crash_dump_o[exception_addr][21]}]  \
  [get_ports {crash_dump_o[exception_addr][20]}]  \
  [get_ports {crash_dump_o[exception_addr][19]}]  \
  [get_ports {crash_dump_o[exception_addr][18]}]  \
  [get_ports {crash_dump_o[exception_addr][17]}]  \
  [get_ports {crash_dump_o[exception_addr][16]}]  \
  [get_ports {crash_dump_o[exception_addr][15]}]  \
  [get_ports {crash_dump_o[exception_addr][14]}]  \
  [get_ports {crash_dump_o[exception_addr][13]}]  \
  [get_ports {crash_dump_o[exception_addr][12]}]  \
  [get_ports {crash_dump_o[exception_addr][11]}]  \
  [get_ports {crash_dump_o[exception_addr][10]}]  \
  [get_ports {crash_dump_o[exception_addr][9]}]  \
  [get_ports {crash_dump_o[exception_addr][8]}]  \
  [get_ports {crash_dump_o[exception_addr][7]}]  \
  [get_ports {crash_dump_o[exception_addr][6]}]  \
  [get_ports {crash_dump_o[exception_addr][5]}]  \
  [get_ports {crash_dump_o[exception_addr][4]}]  \
  [get_ports {crash_dump_o[exception_addr][3]}]  \
  [get_ports {crash_dump_o[exception_addr][2]}]  \
  [get_ports {crash_dump_o[exception_addr][1]}]  \
  [get_ports {crash_dump_o[exception_addr][0]}]  \
  [get_ports {crash_dump_o[exception_pc][31]}]  \
  [get_ports {crash_dump_o[exception_pc][30]}]  \
  [get_ports {crash_dump_o[exception_pc][29]}]  \
  [get_ports {crash_dump_o[exception_pc][28]}]  \
  [get_ports {crash_dump_o[exception_pc][27]}]  \
  [get_ports {crash_dump_o[exception_pc][26]}]  \
  [get_ports {crash_dump_o[exception_pc][25]}]  \
  [get_ports {crash_dump_o[exception_pc][24]}]  \
  [get_ports {crash_dump_o[exception_pc][23]}]  \
  [get_ports {crash_dump_o[exception_pc][22]}]  \
  [get_ports {crash_dump_o[exception_pc][21]}]  \
  [get_ports {crash_dump_o[exception_pc][20]}]  \
  [get_ports {crash_dump_o[exception_pc][19]}]  \
  [get_ports {crash_dump_o[exception_pc][18]}]  \
  [get_ports {crash_dump_o[exception_pc][17]}]  \
  [get_ports {crash_dump_o[exception_pc][16]}]  \
  [get_ports {crash_dump_o[exception_pc][15]}]  \
  [get_ports {crash_dump_o[exception_pc][14]}]  \
  [get_ports {crash_dump_o[exception_pc][13]}]  \
  [get_ports {crash_dump_o[exception_pc][12]}]  \
  [get_ports {crash_dump_o[exception_pc][11]}]  \
  [get_ports {crash_dump_o[exception_pc][10]}]  \
  [get_ports {crash_dump_o[exception_pc][9]}]  \
  [get_ports {crash_dump_o[exception_pc][8]}]  \
  [get_ports {crash_dump_o[exception_pc][7]}]  \
  [get_ports {crash_dump_o[exception_pc][6]}]  \
  [get_ports {crash_dump_o[exception_pc][5]}]  \
  [get_ports {crash_dump_o[exception_pc][4]}]  \
  [get_ports {crash_dump_o[exception_pc][3]}]  \
  [get_ports {crash_dump_o[exception_pc][2]}]  \
  [get_ports {crash_dump_o[exception_pc][1]}]  \
  [get_ports {crash_dump_o[exception_pc][0]}]  \
  [get_ports {crash_dump_o[last_data_addr][31]}]  \
  [get_ports {crash_dump_o[last_data_addr][30]}]  \
  [get_ports {crash_dump_o[last_data_addr][29]}]  \
  [get_ports {crash_dump_o[last_data_addr][28]}]  \
  [get_ports {crash_dump_o[last_data_addr][27]}]  \
  [get_ports {crash_dump_o[last_data_addr][26]}]  \
  [get_ports {crash_dump_o[last_data_addr][25]}]  \
  [get_ports {crash_dump_o[last_data_addr][24]}]  \
  [get_ports {crash_dump_o[last_data_addr][23]}]  \
  [get_ports {crash_dump_o[last_data_addr][22]}]  \
  [get_ports {crash_dump_o[last_data_addr][21]}]  \
  [get_ports {crash_dump_o[last_data_addr][20]}]  \
  [get_ports {crash_dump_o[last_data_addr][19]}]  \
  [get_ports {crash_dump_o[last_data_addr][18]}]  \
  [get_ports {crash_dump_o[last_data_addr][17]}]  \
  [get_ports {crash_dump_o[last_data_addr][16]}]  \
  [get_ports {crash_dump_o[last_data_addr][15]}]  \
  [get_ports {crash_dump_o[last_data_addr][14]}]  \
  [get_ports {crash_dump_o[last_data_addr][13]}]  \
  [get_ports {crash_dump_o[last_data_addr][12]}]  \
  [get_ports {crash_dump_o[last_data_addr][11]}]  \
  [get_ports {crash_dump_o[last_data_addr][10]}]  \
  [get_ports {crash_dump_o[last_data_addr][9]}]  \
  [get_ports {crash_dump_o[last_data_addr][8]}]  \
  [get_ports {crash_dump_o[last_data_addr][7]}]  \
  [get_ports {crash_dump_o[last_data_addr][6]}]  \
  [get_ports {crash_dump_o[last_data_addr][5]}]  \
  [get_ports {crash_dump_o[last_data_addr][4]}]  \
  [get_ports {crash_dump_o[last_data_addr][3]}]  \
  [get_ports {crash_dump_o[last_data_addr][2]}]  \
  [get_ports {crash_dump_o[last_data_addr][1]}]  \
  [get_ports {crash_dump_o[last_data_addr][0]}]  \
  [get_ports {crash_dump_o[next_pc][31]}]  \
  [get_ports {crash_dump_o[next_pc][30]}]  \
  [get_ports {crash_dump_o[next_pc][29]}]  \
  [get_ports {crash_dump_o[next_pc][28]}]  \
  [get_ports {crash_dump_o[next_pc][27]}]  \
  [get_ports {crash_dump_o[next_pc][26]}]  \
  [get_ports {crash_dump_o[next_pc][25]}]  \
  [get_ports {crash_dump_o[next_pc][24]}]  \
  [get_ports {crash_dump_o[next_pc][23]}]  \
  [get_ports {crash_dump_o[next_pc][22]}]  \
  [get_ports {crash_dump_o[next_pc][21]}]  \
  [get_ports {crash_dump_o[next_pc][20]}]  \
  [get_ports {crash_dump_o[next_pc][19]}]  \
  [get_ports {crash_dump_o[next_pc][18]}]  \
  [get_ports {crash_dump_o[next_pc][17]}]  \
  [get_ports {crash_dump_o[next_pc][16]}]  \
  [get_ports {crash_dump_o[next_pc][15]}]  \
  [get_ports {crash_dump_o[next_pc][14]}]  \
  [get_ports {crash_dump_o[next_pc][13]}]  \
  [get_ports {crash_dump_o[next_pc][12]}]  \
  [get_ports {crash_dump_o[next_pc][11]}]  \
  [get_ports {crash_dump_o[next_pc][10]}]  \
  [get_ports {crash_dump_o[next_pc][9]}]  \
  [get_ports {crash_dump_o[next_pc][8]}]  \
  [get_ports {crash_dump_o[next_pc][7]}]  \
  [get_ports {crash_dump_o[next_pc][6]}]  \
  [get_ports {crash_dump_o[next_pc][5]}]  \
  [get_ports {crash_dump_o[next_pc][4]}]  \
  [get_ports {crash_dump_o[next_pc][3]}]  \
  [get_ports {crash_dump_o[next_pc][2]}]  \
  [get_ports {crash_dump_o[next_pc][1]}]  \
  [get_ports {crash_dump_o[next_pc][0]}]  \
  [get_ports {crash_dump_o[current_pc][31]}]  \
  [get_ports {crash_dump_o[current_pc][30]}]  \
  [get_ports {crash_dump_o[current_pc][29]}]  \
  [get_ports {crash_dump_o[current_pc][28]}]  \
  [get_ports {crash_dump_o[current_pc][27]}]  \
  [get_ports {crash_dump_o[current_pc][26]}]  \
  [get_ports {crash_dump_o[current_pc][25]}]  \
  [get_ports {crash_dump_o[current_pc][24]}]  \
  [get_ports {crash_dump_o[current_pc][23]}]  \
  [get_ports {crash_dump_o[current_pc][22]}]  \
  [get_ports {crash_dump_o[current_pc][21]}]  \
  [get_ports {crash_dump_o[current_pc][20]}]  \
  [get_ports {crash_dump_o[current_pc][19]}]  \
  [get_ports {crash_dump_o[current_pc][18]}]  \
  [get_ports {crash_dump_o[current_pc][17]}]  \
  [get_ports {crash_dump_o[current_pc][16]}]  \
  [get_ports {crash_dump_o[current_pc][15]}]  \
  [get_ports {crash_dump_o[current_pc][14]}]  \
  [get_ports {crash_dump_o[current_pc][13]}]  \
  [get_ports {crash_dump_o[current_pc][12]}]  \
  [get_ports {crash_dump_o[current_pc][11]}]  \
  [get_ports {crash_dump_o[current_pc][10]}]  \
  [get_ports {crash_dump_o[current_pc][9]}]  \
  [get_ports {crash_dump_o[current_pc][8]}]  \
  [get_ports {crash_dump_o[current_pc][7]}]  \
  [get_ports {crash_dump_o[current_pc][6]}]  \
  [get_ports {crash_dump_o[current_pc][5]}]  \
  [get_ports {crash_dump_o[current_pc][4]}]  \
  [get_ports {crash_dump_o[current_pc][3]}]  \
  [get_ports {crash_dump_o[current_pc][2]}]  \
  [get_ports {crash_dump_o[current_pc][1]}]  \
  [get_ports {crash_dump_o[current_pc][0]}]  \
  [get_ports double_fault_seen_o]  \
  [get_ports alert_minor_o]  \
  [get_ports alert_major_internal_o]  \
  [get_ports alert_major_bus_o]  \
  [get_ports core_sleep_o] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports rst_ni]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports test_en_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[rf_cfg][cfg][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[rf_cfg][cfg][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[rf_cfg][cfg][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[rf_cfg][cfg][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[rf_cfg][cfg_en]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[ram_cfg][cfg][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[ram_cfg][cfg][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[ram_cfg][cfg][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[ram_cfg][cfg][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ram_cfg_i[ram_cfg][cfg_en]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_gnt_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_rvalid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_intg_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_err_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_gnt_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_rvalid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_intg_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_err_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_software_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_timer_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_external_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_nm_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports scramble_key_valid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[127]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[126]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[125]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[124]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[123]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[122]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[121]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[120]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[119]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[118]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[117]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[116]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[115]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[114]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[113]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[112]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[111]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[110]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[109]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[108]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[107]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[106]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[105]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[104]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[103]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[102]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[101]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[100]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[99]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[98]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[97]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[96]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[95]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[94]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[93]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[92]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[91]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[90]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[89]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[88]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[87]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[86]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[85]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[84]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[83]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[82]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[81]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[80]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[79]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[78]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[77]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[76]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[75]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[74]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[73]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[72]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[71]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[70]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[69]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[68]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[67]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[66]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[65]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[64]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[63]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[62]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[61]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[60]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[59]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[58]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[57]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[56]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[55]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[54]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[53]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[52]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[51]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[50]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[49]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[48]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[47]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[46]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[45]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[44]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[43]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[42]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[41]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[40]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[39]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[38]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[37]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[36]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[35]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[34]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[33]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[32]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_key_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[63]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[62]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[61]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[60]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[59]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[58]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[57]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[56]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[55]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[54]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[53]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[52]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[51]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[50]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[49]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[48]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[47]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[46]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[45]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[44]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[43]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[42]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[41]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[40]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[39]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[38]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[37]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[36]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[35]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[34]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[33]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[32]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {scramble_nonce_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports debug_req_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports scan_rst_ni]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {randbits[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_we_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_intg_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports scramble_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports double_fault_seen_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_minor_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_major_internal_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_major_bus_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports core_sleep_o]
set_ideal_network [get_ports i_clk]
set_ideal_network [get_ports rst_ni]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.5 [get_clocks MAIN_CLK]
set_clock_uncertainty -hold 0.5 [get_clocks MAIN_CLK]
