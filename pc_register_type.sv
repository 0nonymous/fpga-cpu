`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2026 07:26:19 AM
// Design Name: 
// Module Name: pc_register_type
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


module pc_register_type(
  input [7:0] pcl_data_in,  // assigned
  input [7:0] pch_data_in,  // assigned
  output [7:0] pcl_data_out,  // assigned
  output [7:0] pch_data_out,  // assigned
  output [15:0] pc_data_out,  // assigned
  
  input clk,  // assigned
  input rst,  // assigned
  input pcl_load_enable,  // assigned
  input pch_load_enable,  // assigned
  input pcl_out_enable,  // assigned
  input pch_out_enable,  // assigned
  input pc_out_enable,  // assigned
  
  input count_up,  // assigned
  
  output [7:0] debug_out_pcl,  // assigned
  output [7:0] debug_out_pch  // assigned
);

  logic [15:0] internal_data;

  assign debug_out_pcl = internal_data[7:0];
  assign debug_out_pch = internal_data[15:8];

  assign pcl_data_out = pcl_out_enable ? internal_data[7:0] : 8'bz;
  assign pch_data_out = pch_out_enable ? internal_data[15:8] : 8'bz;
  assign pc_data_out = pc_out_enable ? internal_data : 16'bz;
  
  always_ff @ (posedge clk or posedge rst)
    if (rst)
      internal_data <= 16'b0;
    else if (pcl_load_enable)
      internal_data <= {internal_data[15:8], pcl_data_in};
    else if (pch_load_enable)
      internal_data <= {pch_data_in, internal_data[7:0]};
    else if (count_up)
      internal_data <= internal_data + 16'd1;

endmodule
