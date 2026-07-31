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


module computer(
  input clk,
  input rst,
  output [7:0] data_bus,


  input clk_dm,
  output logic [6:0] display_out,
  output logic [3:0] digit_out,
  
  output logic [7:0] debug,
  input [4:0] debug_sel,
  
  input clk_sel,
  
  inout [7:0] port_a,
  inout [7:0] port_b,
  
  inout [7:0] port_c,
  inout [7:0] port_d
);

  logic [7:0] clk_breaker;
  logic one_mhz_clock;  // 1/2 mhz
  always_ff @ (posedge clk_dm or posedge rst) begin
    if (rst)
    begin
      clk_breaker <= 8'b0;
      one_mhz_clock <= 1'b0;
    end
    else
      if (clk_breaker == 8'd199)
      begin
        clk_breaker <= 8'd0;
        one_mhz_clock <= ~one_mhz_clock;
      end
      else
        clk_breaker <= clk_breaker + 8'd1;
  end

  wire clk_internal = clk_sel ? one_mhz_clock : clk;


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


  cpu dut(clk_internal, rst, internal_db, internal_ad, write_en, output_en,
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
  
  logic ram_ce, rom_ce, via0_ce, via1_ce;
  
  always_comb
    if (internal_ad < 16'd2048)
    begin
        rom_ce = 1'b1;
        ram_ce = 1'b0;
        via0_ce = 1'b0;
        via1_ce = 1'b0;
    end
    // fef0, fef1, fef2, fef3
    // 11111110111100
    else if (internal_ad[15:2] == 14'b11111110111100)
    begin
        rom_ce = 1'b0;
        ram_ce = 1'b0;
        via0_ce = 1'b1;
        via1_ce = 1'b0;
    end
    else if (internal_ad[15:2] == 14'b11111110111000)
    begin
        rom_ce = 1'b0;
        ram_ce = 1'b0;
        via0_ce = 1'b0;
        via1_ce = 1'b1;
    end
    else
    begin
        rom_ce = 1'b0;
        ram_ce = 1'b1;
        via0_ce = 1'b0;
        via1_ce = 1'b0;
    end
  
  rom_external #(
    .ROM_FILE("snake.mem")
  )prog_rom(internal_ad[10:0], internal_db, output_en, rom_ce);
  ram ram(clk_internal, write_en, output_en, internal_ad, internal_db, internal_db, ram_ce);
  via via0(port_a, port_b, port_a, port_b, internal_db, internal_db, internal_ad[1:0], clk_internal, write_en, output_en, via0_ce, rst);
  via via1(port_c, port_d, port_c, port_d, internal_db, internal_db, internal_ad[1:0], clk_internal, write_en, output_en, via1_ce, rst);

endmodule
