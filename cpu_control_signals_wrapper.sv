`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 07:29:24 PM
// Design Name: 
// Module Name: cpu_control_signals_wrapper
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


module cpu_control_signals_wrapper(
  input a_out,  // assigned
  input b_out,  // assigned
  input x_out,  // assigned
  input f_out,  // assigned
  input pch_out,  // assigned
  input pcl_out,  // assigned
  input add_out,  // assigned
  input shr_out,  // incorrectly labeled as shl_out assigned
  
  input or_out,  // assigned
  input and_out,  // assigned
  input pc_out,  // assigned
  input mar_out,  // assigned
  input b_set,  // assigned
  input a_set,  // assigned
  input x_set,  // assigned
  input c_set,  // assigned
  
  input sz_set,  // assigned
  input f_set,  // assigned
  input empty1,
  input empty2,
  input empty3,
  input f_clr,  // assigned
  input write_en,  // assigned
  input output_en,  // assigned
  
  input marl_set,  // assigned
  input marh_set,  // assigned
  input ir_set,  // assigned
  input x_down,  // assigned
  input x_up,  // assigned
  input sp_down,  // assigned
  input sp_up,  // assigned
  input sp_out,  // assigned
  
  input pc_up,  // assigned
  input mar_up,  // assigned
  input sub,  // assigned
  input with_carry,  // assigned
  input z_jump,  // assigned
  input s_jump,  // assigned
  input c_jump,  // assigned
  input u_jump,  // assigned
  
  input n_jump,  // assigned
  input pcl_set,  // assigned
  input pch_set,  // assigned
  input x_off,  // assigned
  input empty4,
  input empty5,
  input empty6,
  input empty7,
  
  // non control signals
  input rst,  // assigned
  input clk,  // assigned
  inout tri[7:0] data_bus,  // assigned
  output tri[15:0] address_bus,  // assigned
  output [7:0] ir_out,  // assigned
  
  output write_en_out,  // assigned
  output output_en_out,  // assigned
  
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
  
  assign write_en_out = write_en;
  assign output_en_out = output_en;
  
  // conditionals
  wire pcl_set_internal;
  wire pch_set_internal;
  wire c;
  wire s;
  wire z;
  
  assign pcl_set_internal = pcl_set & ((u_jump) | (c_jump & c & (~n_jump)) | (s_jump & s & (~n_jump)) | (z_jump & z & (~n_jump)) | (n_jump & c_jump & (~c)) | (n_jump & s_jump & (~s)) | (n_jump & z_jump & (~z)));
  assign pch_set_internal = pch_set & ((u_jump) | (c_jump & c & (~n_jump)) | (s_jump & s & (~n_jump)) | (z_jump & z & (~n_jump)) | (n_jump & c_jump & (~c)) | (n_jump & s_jump & (~s)) | (n_jump & z_jump & (~z)));
  
  cpu_datapath cpu(
    .rst(rst),
    .clk(clk),
    .data_bus(data_bus),
    
    .a_set(a_set),
    .a_out(a_out),
    .b_set(b_set),
    .b_out(b_out),
    
    .x_set(x_set),
    .x_out(x_out),
    .x_inc(x_up),
    .x_dec(x_down),
    .x_off(x_off),
    
    .and_e(and_out),
    .or_e(or_out),
    .shr_e(shr_out),
    .add_e(add_out),
    .with_carry(with_carry),
    .sub(sub),
    
    .c_set(c_set),
    .sz_set(sz_set),
    .f_set(f_set),
    .f_clr(f_clr),
    .f_out(f_out),
    
    .c(c),
    .s(s),
    .z(z),
    
    .address_bus(address_bus),
    
    .sp_out(sp_out),
    .sp_inc(sp_up),
    .sp_dec(sp_down),
    
    .pcl_load_enable(pcl_set_internal),
    .pch_load_enable(pch_set_internal),
    .pcl_out_enable(pcl_out),
    .pch_out_enable(pch_out),
    .pc_out_enable(pc_out),
    .pc_inc(pc_up),
  
    .marl_load_enable(marl_set),
    .marh_load_enable(marh_set),
    .mar_out_enable(mar_out),
    .mar_up(mar_up),
  
    .ir_out(ir_out),
    .ir_load_enable(ir_set),
    
    .a_reg_debug(a_reg_debug),
    .b_reg_debug(b_reg_debug),
    .f_reg_debug(f_reg_debug),
    .x_reg_debug(x_reg_debug),
    .sp_reg_debug(sp_reg_debug),
    .pcl_reg_debug(pcl_reg_debug),
    .pch_reg_debug(pch_reg_debug),
    .marl_reg_debug(marl_reg_debug),
    .marh_reg_debug(marh_reg_debug),
    .ir_reg_debug(ir_reg_debug)
  );

endmodule
