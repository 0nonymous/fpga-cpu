`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2026 09:15:28 PM
// Design Name: 
// Module Name: sp_register_type
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


module sp_register_type(
  output [15:0] data_out,
  input clk,
  input rst,
  input output_enable,
  input count_up,
  input count_down,
  output [7:0] debug_out
);

  logic [7:0] internal_data;
  assign debug_out = internal_data;
  assign data_out = output_enable ? {{8{1'b1}}, internal_data} : 16'bz;

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= {8{1'b1}};
    else if (count_up)
      internal_data <= internal_data + 8'd1;
    else if (count_down)
      internal_data <= internal_data - 8'd1;

endmodule
