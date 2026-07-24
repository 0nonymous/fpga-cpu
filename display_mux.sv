`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2026 09:28:31 AM
// Design Name: 
// Module Name: display_mux
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


module display_mux(
    input [15:0] data_in,
    input clk,
    input rst,
    
    output logic [6:0] display_out,
    output logic [3:0] digit_out
    );
    
    logic [3:0] dg_data;
    logic [15:0] clk_breaker;
    seven_segment svsg(dg_data, display_out);
    
    always_ff @ (posedge clk or posedge rst)
    begin
        if (rst)
        begin
            digit_out <= 4'b1110;
            clk_breaker <= 'b0;
        end
        else
        begin
            clk_breaker <= clk_breaker + 'd1;
            if (clk_breaker == 'b1)
                digit_out <= {digit_out[2:0], digit_out[3]};
        end
    end
    
    always_comb
    begin
        case (digit_out)
            4'b1110:dg_data = data_in[3:0];
            4'b1101:dg_data = data_in[7:4];
            4'b1011:dg_data = data_in[11:8];
            4'b0111:dg_data = data_in[15:12];
        endcase
    end
    
endmodule
