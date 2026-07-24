`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 04:34:50 AM
// Design Name: 
// Module Name: flags_register_type
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


module flags_register_type(
  input [7:0] data_in,
  output [7:0] data_out,  // assigned
  input clk,  // assigned
  input rst,  // assigned

  input c_set,  // assigned
  input sz_set,  // assigned
  input f_set,  // assigned

  input f_clr,  // assigned
  input f_out,  // assigned
  
  input c_in,  // assigned
  output c,  // assigned
  output s,  // assigned
  output z,  // assigned
  
  output [7:0] debug_out  // assigned
);

  logic c_internal;
  logic s_internal;
  logic z_internal;
  
  assign c = c_internal;
  assign s = s_internal;
  assign z = z_internal;
  
  assign debug_out = {5'b0, z_internal, s_internal, c_internal};
  assign data_out = f_out ? {5'b0, z_internal, s_internal, c_internal} : 8'bz;
  
  always_ff @ (posedge clk or posedge rst)
    if (rst || f_clr)
      {z_internal, s_internal, c_internal} <= 3'b0;
    else if (f_set)
      {z_internal, s_internal, c_internal} <= data_in[2:0];
    else
    begin
      if (c_set)
        c_internal <= c_in;
      if (sz_set)
      begin
        s_internal <= data_in[7];
        z_internal <= ~|data_in;
      end
    end
        

endmodule
