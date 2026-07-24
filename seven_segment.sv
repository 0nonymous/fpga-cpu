`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2026 07:55:24 AM
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
    input [3:0] data_in,
    output logic [6:0] display_out
    );
    logic [6:0] display_out_t;
    wire common_anode;
    assign common_anode = 1'b1;
    always_comb begin
        case (data_in)        // abcdefg
            0:  display_out_t = 7'b1111110;
            1:  display_out_t = 7'b0110000;
            2:  display_out_t = 7'b1101101;
            3:  display_out_t = 7'b1111001;
            4:  display_out_t = 7'b0110011;
            5:  display_out_t = 7'b1011011;
            6:  display_out_t = 7'b1011111;
            7:  display_out_t = 7'b1110000;
            8:  display_out_t = 7'b1111111;
            9:  display_out_t = 7'b1111011;
            10: display_out_t = 7'b1110111;
            11: display_out_t = 7'b0011111;
            12: display_out_t = 7'b1001110;
            13: display_out_t = 7'b0111101;
            14: display_out_t = 7'b1001111;
            15: display_out_t = 7'b1000111;
        endcase
        display_out = display_out_t ^ {7{common_anode}};
    end
endmodule
