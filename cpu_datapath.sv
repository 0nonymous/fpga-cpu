`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 01:05:08 AM
// Design Name: 
// Module Name: cpu_datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu_datapath
(
  input rst,
  input clk,  // mapped
  inout tri[7:0] data_bus,

// control signals
  input a_set,  // mapped
  input a_out,  // mapped

  input b_set,  // mapped
  input b_out,  // mapped
  
  input x_set,
  input x_out,
  input x_inc,
  input x_dec,
  input x_off,
  
  input and_e,  // mapped
  input or_e,  // mapped
  input shr_e,  // mapped
  input add_e,  // mapped
  input with_carry,  // mapped
  input sub,  // mapped
  
  input c_set,
  input sz_set,
  input f_set,
  input f_clr,
  input f_out,
  
  output c,
  output s,
  output z,
  
  output tri[15:0] address_bus,
  
  input sp_out,
  input sp_inc,
  input sp_dec,
  
  input pcl_load_enable,
  input pch_load_enable,
  input pcl_out_enable,
  input pch_out_enable,
  input pc_out_enable,
  input pc_inc,
  
  input marl_load_enable,
  input marh_load_enable,
  input mar_out_enable,
  input mar_up,
  
  output [7:0] ir_out,
  input ir_load_enable,
  
  
  output [7:0] a_reg_debug,
  output [7:0] b_reg_debug,
  output [7:0] f_reg_debug,
  output [7:0] x_reg_debug,
  output [7:0] sp_reg_debug,
  output [7:0] pcl_reg_debug,
  output [7:0] pch_reg_debug,
  output [7:0] marl_reg_debug,
  output [7:0] marh_reg_debug,
  output [7:0] ir_reg_debug
);


  
  // part of actual CPU
  wire [7:0] a_reg_alu;
  //wire [7:0] a_reg_debug;
  alu_register_type a_reg(data_bus, data_bus, clk, rst, a_set, a_out, a_reg_alu, a_reg_debug);

  wire [7:0] b_reg_alu;
  //wire [7:0] b_reg_debug;
  alu_register_type b_reg(data_bus, data_bus, clk, rst, b_set, b_out, b_reg_alu, b_reg_debug);
  
  wire alu_c_out;
  wire alu_c_in;
  alu alu_unit(a_reg_alu, b_reg_alu, data_bus, and_e, data_bus, or_e, data_bus, shr_e, data_bus, add_e, sub, with_carry, alu_c_in, alu_c_out);
  
  //wire [7:0] f_reg_debug;
  flags_register_type f_reg(data_bus, data_bus, clk, rst, c_set, sz_set, f_set, f_clr, f_out, alu_c_out, c, s, z, f_reg_debug);
  assign alu_c_in = c;

  wire [15:0] x_reg_adder;
  //wire [7:0] x_reg_debug;
  x_register_type x_reg(data_bus, data_bus, clk, rst, x_set, x_out, x_inc, x_dec, x_reg_adder, x_off, x_reg_debug);


  wire [15:0] intermediate_address;
  //wire [7:0] sp_reg_debug;
  sp_register_type sp_reg(intermediate_address, clk, rst, sp_out, sp_inc, sp_dec, sp_reg_debug);
  
  assign address_bus = intermediate_address + x_reg_adder;
  
  //wire [7:0] pcl_reg_debug, pch_reg_debug;
  pc_register_type pc_reg(data_bus, data_bus, data_bus, data_bus, intermediate_address, clk, rst, pcl_load_enable, pch_load_enable, pcl_out_enable, pch_out_enable, pc_out_enable, pc_inc, pcl_reg_debug, pch_reg_debug);
  
  //wire [7:0] marl_reg_debug, marh_reg_debug;
  mar_register_type mar_reg(data_bus, data_bus, intermediate_address, clk, rst, marl_load_enable, marh_load_enable, mar_out_enable, mar_up, marl_reg_debug, marh_reg_debug);

  //wire [7:0] ir_reg_debug;
  ir_register_type ir_reg(data_bus, ir_out, clk, rst, ir_load_enable, ir_reg_debug);

endmodule
