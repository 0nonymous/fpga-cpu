`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 05:21:10 AM
// Design Name: 
// Module Name: mar_register_type
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


module mar_register_type(
  input [7:0] marl_data_in,  // assigned
  input [7:0] marh_data_in,  // assigned
  output [15:0] mar_data_out,  // assigned
  
  input clk,  // assigned
  input rst,  // assigned
  input marl_load_enable, // assigned
  input marh_load_enable,  // assigned
  input mar_out_enable,  // assigned
  
  input count_up,  // assigned
  
  output [7:0] debug_out_marl,  // assigned
  output [7:0] debug_out_marh  // assigned
);

  logic [15:0] internal_data;

  assign debug_out_marl = internal_data[7:0];
  assign debug_out_marh = internal_data[15:8];
  assign mar_data_out = mar_out_enable ? internal_data : 16'bz;
  
  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 16'b0;
    else if (marl_load_enable)
      internal_data <= {internal_data[15:8], marl_data_in};
    else if (marh_load_enable)
      internal_data <= {marh_data_in, internal_data[7:0]};
    else if (count_up)
      internal_data <= internal_data + 16'd1;

endmodule
