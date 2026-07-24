`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2026 08:17:48 PM
// Design Name: 
// Module Name: step_register_type
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


module step_register_type(
  output [2:0] data_out,
  input clk,
  input rst,
  output [2:0] debug_out
);

  logic [2:0] internal_data;
  assign debug_out = internal_data;
  assign data_out = internal_data;
  
  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 3'b0;
    else
      internal_data <= internal_data + 3'd1;

endmodule
