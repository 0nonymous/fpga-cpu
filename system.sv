`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2026 06:33:55 PM
// Design Name: 
// Module Name: system
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


module system(
    input [7:0] data_in,  // connected mapped
    input a_set,  // connected mapped
    input b_set,  // connected mapped
    input and_e,  // connected mapped
    input or_e,  // connected mapped
    input shr_e,  // conected mapped
    input add_e,  // conected mapped
    input with_carry,  // connected mapped
    input sub,  // connected mapped
    input carry_in,  // connected mapped
    output carry_out,  // connected mapped
    output tri [7:0] data_out,  // connected mapped
    input clk
    );
    
    logic [7:0] a_out;
    logic [7:0] b_out;
    
    eight_bit_register a_reg(
        data_in,
        a_out,
        clk,
        1'b0,
        a_set,
        1'b1
    );
    
    eight_bit_register b_reg(
        data_in,
        b_out,
        clk,
        1'b0,
        b_set,
        1'b1
    );
    
    alu alu_unit (
        a_out,
        b_out,
        data_out,
        and_e,
        data_out,
        or_e,
        data_out,
        shr_e,
        data_out,
        add_e,
        sub,
        with_carry,
        carry_in,
        carry_out
    );
    
endmodule
