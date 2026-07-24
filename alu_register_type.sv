`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 12:46:08 AM
// Design Name: 
// Module Name: alu_register_type
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


module alu_register_type  // input data bus, output data bus, output alu (ungated)  --  works for a and temp register
(
  input [7:0] data_in,  // one in, one out to bus
  output [7:0] data_out,

  input clk,
  input rst,
  input load_enable,
  input output_enable,

  output [7:0] data_out_alu,  // direct to alu
  
  output [7:0] debug_out  // 'LEDs'
);

  logic [7:0] internal_data;
  assign data_out = output_enable ? internal_data : 8'bz;
  assign data_out_alu = internal_data;
  assign debug_out = internal_data;

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 8'b0;
    else if (load_enable)
      internal_data <= data_in;

endmodule
