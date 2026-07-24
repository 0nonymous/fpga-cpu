`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 06:25:11 AM
// Design Name: 
// Module Name: ir_register_type
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


module ir_register_type(
  input [7:0] data_in,  
  output [7:0] data_out,
  
  input clk,
  input rst,
  input load_enable,
  
  output [7:0] debug_out
);

  logic [7:0] internal_data;
  assign data_out = internal_data;
  assign debug_out = internal_data;
  
  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 8'b0;
    else if (load_enable)
      internal_data <= data_in;

endmodule
