`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2026 05:20:13 PM
// Design Name: 
// Module Name: eight_bit_register
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


module eight_bit_register
(input [7:0] data_in, output [7:0] data_out, input clk, input rst, input load_enable, input output_enable);

  logic [7:0] internal_data;
  assign data_out = output_enable ? internal_data : 8'bz;

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 8'b0;
    else if (load_enable)
      internal_data <= data_in;

endmodule
