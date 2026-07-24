`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2026 12:29:44 AM
// Design Name: 
// Module Name: cpu
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


module cpu(
  input clk,
  input rst,
  inout tri [7:0] data_bus,
  output [15:0] address_bus,
  output write_en_out,
  output output_en_out,

  output [7:0] a_reg_debug,
  output [7:0] b_reg_debug,
  output [7:0] f_reg_debug,
  output [7:0] x_reg_debug,
  output [7:0] sp_reg_debug,
  output [7:0] pcl_reg_debug,
  output [7:0] pch_reg_debug,
  output [7:0] marl_reg_debug,
  output [7:0] marh_reg_debug,
  output [7:0] ir_reg_debug,
  output [7:0] step_reg_debug,
  
  output [7:0] dat0,
  output [7:0] dat1,
  output [7:0] dat2,
  output [7:0] dat3,
  output [7:0] dat4,
  output [7:0] dat5

);

  wire [2:0] step_reg_data;
  wire [2:0] step_reg_debug_i;
  
  assign step_reg_debug = {5'b0, step_reg_debug_i};
  
  step_register_type step_reg(step_reg_data, clk, rst, step_reg_debug_i);

  //wire [7:0] dat0;
  //wire [7:0] dat1;
  //wire [7:0] dat2;
  //wire [7:0] dat3;
  //wire [7:0] dat4;
  //wire [7:0] dat5;

  wire [10:0] adr;
  wire [7:0] ir_out;
  
  
  assign adr = {ir_out, step_reg_data};
  
  rom #(
    .ROM_FILE("rom0.mem")
  ) rom0 (
    .addr(adr),
    .data(dat0)
  );
  
  rom #(
    .ROM_FILE("rom1.mem")
  ) rom1 (
    .addr(adr),
    .data(dat1)
  );
  
  rom #(
    .ROM_FILE("rom2.mem")
  ) rom2 (
    .addr(adr),
    .data(dat2)
  );
  
  rom #(
    .ROM_FILE("rom3.mem")
  ) rom3 (
    .addr(adr),
    .data(dat3)
  );
  
  rom #(
    .ROM_FILE("rom4.mem")
  ) rom4 (
    .addr(adr),
    .data(dat4)
  );
  
  rom #(
    .ROM_FILE("rom5.mem")
  ) rom5 (
    .addr(adr),
    .data(dat5)
  );

  cpu_control_signals_wrapper cpu_main(
    dat0[0], dat0[1], dat0[2], dat0[3], dat0[4], dat0[5], dat0[6], dat0[7],
    dat1[0], dat1[1], dat1[2], dat1[3], dat1[4], dat1[5], dat1[6], dat1[7],
    dat2[0], dat2[1], dat2[2], dat2[3], dat2[4], dat2[5], dat2[6], dat2[7],
    dat3[0], dat3[1], dat3[2], dat3[3], dat3[4], dat3[5], dat3[6], dat3[7],
    dat4[0], dat4[1], dat4[2], dat4[3], dat4[4], dat4[5], dat4[6], dat4[7],
    dat5[0], dat5[1], dat5[2], dat5[3], dat5[4], dat5[5], dat5[6], dat5[7],
    rst,
    clk,
    data_bus,
    address_bus,
    ir_out,
    write_en_out,
    output_en_out,
    a_reg_debug,
    b_reg_debug,
    f_reg_debug,
    x_reg_debug,
    sp_reg_debug,
    pcl_reg_debug,
    pch_reg_debug,
    marl_reg_debug,
    marh_reg_debug,
    ir_reg_debug
  );

endmodule
