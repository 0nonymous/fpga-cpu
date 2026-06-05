`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2026 05:19:01 PM
// Design Name: 
// Module Name: alu
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


module alu
(
  input [7:0] operand_1, input [7:0] operand_2, 
  output [7:0] and_output, input and_output_control,
  output [7:0] or_output, input or_output_control,
  output [7:0] shr_output, input shr_output_control,
  output [7:0] add_output, input add_output_control,
  input sub_control, input with_carry,
  input carry_in,
  output carry_out
);
  wire shr_carry, add_carry;

  assign and_output = and_output_control ? (operand_1 & operand_2) : 8'bz;
  assign or_output = or_output_control ? (operand_1 | operand_2) : 8'bz;
  assign {shr_output, shr_carry} = shr_output_control ? ({(carry_in & with_carry), operand_1}) : 9'bz;
  assign {add_carry, add_output} = add_output_control ? ({1'b0, operand_1} + (sub_control ? {1'b0, ~operand_2} : {1'b0, operand_2}) + {8'b0, (with_carry ? carry_in : (sub_control ? 1'd1 : 1'd0))}) : 9'bz;
  assign carry_out = add_output_control ? add_carry : shr_carry;

endmodule
