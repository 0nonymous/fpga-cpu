# maps the user_data to 8 slide switches
set_property IOSTANDARD LVCMOS33 [get_ports {user_data[0]}]
set_property PACKAGE_PIN V17 [get_ports {user_data[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[1]}]
set_property PACKAGE_PIN V16 [get_ports {user_data[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[2]}]
set_property PACKAGE_PIN W16 [get_ports {user_data[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[3]}]
set_property PACKAGE_PIN W17 [get_ports {user_data[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[4]}]
set_property PACKAGE_PIN W15 [get_ports {user_data[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[5]}]
set_property PACKAGE_PIN V15 [get_ports {user_data[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[6]}]
set_property PACKAGE_PIN W14 [get_ports {user_data[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {user_data[7]}]
set_property PACKAGE_PIN W13 [get_ports {user_data[7]}]


# maps the data output to 8 LEDs
set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[0]}]
set_property PACKAGE_PIN U16 [get_ports {data_bus[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[1]}]
set_property PACKAGE_PIN E19 [get_ports {data_bus[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[2]}]
set_property PACKAGE_PIN U19 [get_ports {data_bus[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[3]}]
set_property PACKAGE_PIN V19 [get_ports {data_bus[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[4]}]
set_property PACKAGE_PIN W18 [get_ports {data_bus[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[5]}]
set_property PACKAGE_PIN U15 [get_ports {data_bus[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[6]}]
set_property PACKAGE_PIN U14 [get_ports {data_bus[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_bus[7]}]
set_property PACKAGE_PIN V14 [get_ports {data_bus[7]}]


# maps the carry overflow flag to LED
#set_property IOSTANDARD LVCMOS33 [get_ports carry_out]
#set_property PACKAGE_PIN L1 [get_ports carry_out]


# maps the clock
#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#set_property PACKAGE_PIN W5 [get_ports clk]
#create_clock -period 10.000 -name sys_clk [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN U18 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]


# maps the store enables
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN W19 [get_ports rst]

#set_property IOSTANDARD LVCMOS33 [get_ports b_set]
#set_property PACKAGE_PIN T17 [get_ports b_set]


# alu control
#set_property IOSTANDARD LVCMOS33 [get_ports and_e]
#set_property PACKAGE_PIN V2 [get_ports and_e]

#set_property IOSTANDARD LVCMOS33 [get_ports or_e]
#set_property PACKAGE_PIN T3 [get_ports or_e]

#set_property IOSTANDARD LVCMOS33 [get_ports shr_e]
#set_property PACKAGE_PIN T2 [get_ports shr_e]

#set_property IOSTANDARD LVCMOS33 [get_ports add_e]
#set_property PACKAGE_PIN R3 [get_ports add_e]


# alu inputs
#set_property IOSTANDARD LVCMOS33 [get_ports with_carry]
#set_property PACKAGE_PIN W2 [get_ports with_carry]

#set_property IOSTANDARD LVCMOS33 [get_ports sub]
#set_property PACKAGE_PIN U1 [get_ports sub]

#set_property IOSTANDARD LVCMOS33 [get_ports carry_in]
#set_property PACKAGE_PIN T1 [get_ports carry_in]


# user input enable
#set_property IOSTANDARD LVCMOS33 [get_ports user_e]
#set_property PACKAGE_PIN R2 [get_ports user_e]


# maps the out enables
#set_property IOSTANDARD LVCMOS33 [get_ports a_out]
#set_property PACKAGE_PIN T18 [get_ports a_out]

#set_property IOSTANDARD LVCMOS33 [get_ports b_out]
#set_property PACKAGE_PIN U17 [get_ports b_out]


# x register stuff
#set_property IOSTANDARD LVCMOS33 [get_ports x_off]
#set_property PACKAGE_PIN T18 [get_ports x_off]

#set_property IOSTANDARD LVCMOS33 [get_ports x_inc]
#set_property PACKAGE_PIN U17 [get_ports x_inc]

#set_property IOSTANDARD LVCMOS33 [get_ports x_set]
#set_property PACKAGE_PIN W19 [get_ports x_set]

#set_property IOSTANDARD LVCMOS33 [get_ports x_dec]
#set_property PACKAGE_PIN T17 [get_ports x_dec]


# flags register stuff
#set_property IOSTANDARD LVCMOS33 [get_ports f_out]
#set_property PACKAGE_PIN T18 [get_ports f_out]

#set_property IOSTANDARD LVCMOS33 [get_ports c_set]
#set_property PACKAGE_PIN V2 [get_ports c_set]

#set_property IOSTANDARD LVCMOS33 [get_ports sz_set]
#set_property PACKAGE_PIN T3 [get_ports sz_set]

#set_property IOSTANDARD LVCMOS33 [get_ports f_set]
#set_property PACKAGE_PIN T2 [get_ports f_set]

#set_property IOSTANDARD LVCMOS33 [get_ports f_clr]
#set_property PACKAGE_PIN U1 [get_ports f_clr]


# address
#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[0]}]
#set_property PACKAGE_PIN U16 [get_ports {address_bus[0]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[1]}]
#set_property PACKAGE_PIN E19 [get_ports {address_bus[1]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[2]}]
#set_property PACKAGE_PIN U19 [get_ports {address_bus[2]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[3]}]
#set_property PACKAGE_PIN V19 [get_ports {address_bus[3]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[4]}]
#set_property PACKAGE_PIN W18 [get_ports {address_bus[4]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[5]}]
#set_property PACKAGE_PIN U15 [get_ports {address_bus[5]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[6]}]
#set_property PACKAGE_PIN U14 [get_ports {address_bus[6]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[7]}]
#set_property PACKAGE_PIN V14 [get_ports {address_bus[7]}]


#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[0]}]
#set_property PACKAGE_PIN V13 [get_ports {address_bus[0]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[1]}]
#set_property PACKAGE_PIN V3 [get_ports {address_bus[1]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[2]}]
#set_property PACKAGE_PIN W3 [get_ports {address_bus[2]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[3]}]
#set_property PACKAGE_PIN U3 [get_ports {address_bus[3]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[4]}]
#set_property PACKAGE_PIN P3 [get_ports {address_bus[4]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[5]}]
#set_property PACKAGE_PIN N3 [get_ports {address_bus[5]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[6]}]
#set_property PACKAGE_PIN P1 [get_ports {address_bus[6]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {address_bus[7]}]
#set_property PACKAGE_PIN L1 [get_ports {address_bus[7]}]


# sp
#set_property IOSTANDARD LVCMOS33 [get_ports sp_out]
#set_property PACKAGE_PIN V2 [get_ports sp_out]

#set_property IOSTANDARD LVCMOS33 [get_ports sp_inc]
#set_property PACKAGE_PIN T3 [get_ports sp_inc]

#set_property IOSTANDARD LVCMOS33 [get_ports sp_dec]
#set_property PACKAGE_PIN T2 [get_ports sp_dec]

#set_property IOSTANDARD LVCMOS33 [get_ports rst]
#set_property PACKAGE_PIN R3 [get_ports rst]


# pc
#set_property IOSTANDARD LVCMOS33 [get_ports mar_out_enable]
#set_property PACKAGE_PIN V2 [get_ports mar_out_enable]

#set_property IOSTANDARD LVCMOS33 [get_ports mar_up]
#set_property PACKAGE_PIN T3 [get_ports mar_up]

#set_property IOSTANDARD LVCMOS33 [get_ports marl_load_enable]
#set_property PACKAGE_PIN T2 [get_ports marl_load_enable]

#set_property IOSTANDARD LVCMOS33 [get_ports marh_load_enable]
#set_property PACKAGE_PIN R3 [get_ports marh_load_enable]



# address bus
set_property IOSTANDARD LVCMOS33 [get_ports clk_dm]
set_property PACKAGE_PIN W5 [get_ports clk_dm]
create_clock -period 10.000 -name sys_clk [get_ports clk_dm]



set_property IOSTANDARD LVCMOS33 [get_ports {display_out[6]}]
set_property PACKAGE_PIN W7 [get_ports {display_out[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[5]}]
set_property PACKAGE_PIN W6 [get_ports {display_out[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[4]}]
set_property PACKAGE_PIN U8 [get_ports {display_out[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[3]}]
set_property PACKAGE_PIN V8 [get_ports {display_out[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[2]}]
set_property PACKAGE_PIN U5 [get_ports {display_out[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[1]}]
set_property PACKAGE_PIN V5 [get_ports {display_out[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {display_out[0]}]
set_property PACKAGE_PIN U7 [get_ports {display_out[0]}]



set_property IOSTANDARD LVCMOS33 [get_ports {digit_out[3]}]
set_property PACKAGE_PIN W4 [get_ports {digit_out[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {digit_out[2]}]
set_property PACKAGE_PIN V4 [get_ports {digit_out[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {digit_out[1]}]
set_property PACKAGE_PIN U4 [get_ports {digit_out[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {digit_out[0]}]
set_property PACKAGE_PIN U2 [get_ports {digit_out[0]}]



set_property IOSTANDARD LVCMOS33 [get_ports {debug[0]}]
set_property PACKAGE_PIN V13 [get_ports {debug[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[1]}]
set_property PACKAGE_PIN V3 [get_ports {debug[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[2]}]
set_property PACKAGE_PIN W3 [get_ports {debug[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[3]}]
set_property PACKAGE_PIN U3 [get_ports {debug[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[4]}]
set_property PACKAGE_PIN P3 [get_ports {debug[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[5]}]
set_property PACKAGE_PIN N3 [get_ports {debug[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[6]}]
set_property PACKAGE_PIN P1 [get_ports {debug[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {debug[7]}]
set_property PACKAGE_PIN L1 [get_ports {debug[7]}]




set_property IOSTANDARD LVCMOS33 [get_ports debug_sel[0]]
set_property PACKAGE_PIN V2 [get_ports debug_sel[0]]

set_property IOSTANDARD LVCMOS33 [get_ports debug_sel[1]]
set_property PACKAGE_PIN T3 [get_ports debug_sel[1]]

set_property IOSTANDARD LVCMOS33 [get_ports debug_sel[2]]
set_property PACKAGE_PIN T2 [get_ports debug_sel[2]]

set_property IOSTANDARD LVCMOS33 [get_ports debug_sel[3]]
set_property PACKAGE_PIN R3 [get_ports debug_sel[3]]

set_property IOSTANDARD LVCMOS33 [get_ports debug_sel[4]]
set_property PACKAGE_PIN W2 [get_ports debug_sel[4]]