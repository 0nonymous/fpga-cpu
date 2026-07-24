`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2026 11:32:42 PM
// Design Name: 
// Module Name: x_register_type
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


module x_register_type  // input data bus, output data bus, output address adder gated to pulldown  --  works for x register
(
  // normal register functions
  input [7:0] data_in,
  output [7:0] data_out,
  input clk,
  input rst,
  input load_enable,
  input output_enable,
  
  // normal incrementor functions
  input count_up,
  input count_down,

  // x register offset function
  output [15:0] data_out_adder,
  input output_adder_enable,
  
  output [7:0] debug_out
);

  logic [7:0] internal_data;
  assign debug_out = internal_data;
  assign data_out = output_enable ? internal_data : 8'bz;
  assign data_out_adder = output_adder_enable ? {8'b0, internal_data} : 16'b0;  // mimics the pulldowns

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 8'b0;
    else if (load_enable)
      internal_data <= data_in;
    else if (count_up)
      internal_data <= internal_data + 8'd1;
    else if (count_down)
      internal_data <= internal_data - 8'd1;

endmodule