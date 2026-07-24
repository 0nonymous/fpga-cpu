`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 12:11:53 AM
// Design Name: 
// Module Name: cpu_debug_wrapper
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

// only test x reg
module cpu_debug_wrapper(
  /*
  input clk,  // mapped
  
  input x_set,  // mapped
  input x_out,  // mapped
  input x_inc,  // mapped
  input x_dec,  // mapped
  
// debug
  output [7:0] debug_data,  // mapped

  input user_e,  // mapped
  input [7:0] user_data  // mapped
  */
  //input rst,
  input clk,  // map
  //input a_set,  // map
  //input b_set,  // map
  //input add_e,  // map
  //input with_carry,  // mapped
  //input c_set,  // map
  //input sz_set,  // map
  //input f_set,  // map
  //input f_clr,  // map
  //input f_out,  // map

  //output [7:0] debug_data,  // mapped

  input user_e,  // mapped
  input [7:0] user_data,  // mapped
  
  output [15:0] address_bus,
  /*
  input sp_out,
  input sp_inc,
  input sp_dec,
  */
  /*
  input x_set,
  input x_off,
  input x_inc,
  input x_dec
  */
  
  input marl_load_enable,
  input marh_load_enable,
  input mar_out_enable,
  input mar_up
  
);
  wire rst        = 1'b0,
       a_set      = 1'b0,
       a_out      = 1'b0,
       b_set      = 1'b0,
       b_out      = 1'b0,
       and_e      = 1'b0,
       or_e       = 1'b0,
       shr_e      = 1'b0,
       add_e      = 1'b0,
       with_carry = 1'b0,
       sub        = 1'b0,
       carry_in   = 1'b0,
       x_off      = 1'b0,
       x_set      = 1'b0,
       x_out      = 1'b0,
       x_inc      = 1'b0,
       x_dec      = 1'b0,
       c_set      = 1'b0,  
       sz_set     = 1'b0,  
       f_set      = 1'b0,  
       f_clr      = 1'b0,  
       f_out      = 1'b0,
       sp_out     = 1'b0,
       sp_inc     = 1'b0,
       sp_dec     = 1'b0,
       pcl_out_enable = 1'b0,
       pch_out_enable = 1'b0,
       pcl_load_enable = 1'b0,
       pch_load_enable = 1'b0,
       pc_out_enable = 1'b0,
       pc_inc = 1'b0;

  wire c, s, z;
  tri [7:0] data_bus;
  /*
  cpu_datapath cpu(
    rst,
    clk,
    data_bus,

    a_set,
    a_out,
    b_set,
    b_out,

    x_set,
    x_out,
    x_inc,
    x_dec,
    x_off,
    
    and_e,
    or_e,
    shr_e,
    add_e,
    with_carry,
    sub,
    carry_in,
    carry_out
  );
  */
  
  
  cpu_datapath cpu (rst, clk, data_bus, a_set, a_out, b_set, b_out, x_set, x_out, x_inc, x_dec, x_off, and_e, or_e, shr_e, add_e, with_carry, sub, c_set, sz_set, f_set, f_clr, f_out, c, s, z, address_bus, sp_out, sp_inc, sp_dec, pcl_load_enable, pch_load_enable, pcl_out_enable, pch_out_enable, pc_out_enable, pc_inc, marl_load_enable, marh_load_enable, mar_out_enable, mar_up);
  // not part of the actual CPU
  assign debug_data = data_bus;
  assign data_bus = user_e ? user_data : 8'bz;

endmodule
