`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2026 10:29:06 PM
// Design Name: 
// Module Name: interface
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


module interface_(
  input clk,
  input rst,
  output [7:0] data_bus,
  input [7:0] user_data,



  input clk_dm,
  output logic [6:0] display_out,
  output logic [3:0] digit_out,
  
  output logic [7:0] debug,
  input [4:0] debug_sel
);
  tri [7:0] internal_db;
  wire [15:0] internal_ad;
  wire output_en, write_en;

  wire [7:0] a_reg_debug;
  wire [7:0] b_reg_debug;
  wire [7:0] f_reg_debug;
  wire [7:0] x_reg_debug;
  wire [7:0] sp_reg_debug;
  wire [7:0] pcl_reg_debug;
  wire [7:0] pch_reg_debug;
  wire [7:0] marl_reg_debug;
  wire [7:0] marh_reg_debug;
  wire [7:0] ir_reg_debug;
  wire [7:0] step_reg_debug;
  
  wire [7:0] dat0;
  wire [7:0] dat1;
  wire [7:0] dat2;
  wire [7:0] dat3;
  wire [7:0] dat4;
  wire [7:0] dat5;


  cpu dut(clk, rst, internal_db, internal_ad, write_en, output_en,
    a_reg_debug,
    b_reg_debug,
    f_reg_debug,
    x_reg_debug,
    sp_reg_debug,
    pcl_reg_debug,
    pch_reg_debug,
    marl_reg_debug,
    marh_reg_debug,
    ir_reg_debug,
    step_reg_debug,
    dat0,
    dat1,
    dat2,
    dat3,
    dat4,
    dat5
  );

  display_mux dm(internal_ad, clk_dm, rst, display_out, digit_out);
  
  
  always_comb
    case (debug_sel)
      5'd0:debug=a_reg_debug;
      5'd1:debug=b_reg_debug;
      5'd2:debug=f_reg_debug;
      5'd3:debug=x_reg_debug;
      
      5'd4:debug=sp_reg_debug;
      5'd5:debug=pcl_reg_debug;
      5'd6:debug=pch_reg_debug;
      5'd7:debug=marl_reg_debug;
      
      5'd8:debug=marh_reg_debug;
      5'd9:debug=ir_reg_debug;
      5'd10:debug=step_reg_debug;
      5'd11:debug=dat0;
      
      5'd12:debug=dat1;
      5'd13:debug=dat2;
      5'd14:debug=dat3;
      5'd15:debug=dat4;
      
      5'd16:debug=dat5;
      default:debug=a_reg_debug;
    endcase


  assign data_bus = internal_db;
  assign internal_db = output_en ? user_data : 8'bz;

endmodule
