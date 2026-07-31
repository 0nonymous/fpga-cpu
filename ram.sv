`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 11:57:45 AM
// Design Name: 
// Module Name: ram
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


module ram #(
    parameter int DATA_WIDTH = 8,
    parameter int ADDR_WIDTH = 16
) (
    input logic clk,
    input logic write_en,
    input logic out_en,
    input logic [ADDR_WIDTH-1:0] address,
    input logic [DATA_WIDTH-1:0] write_data,
    output logic [DATA_WIDTH-1:0] read_data,
    input logic ce
);

    logic [DATA_WIDTH-1:0] memory [0:(1 << ADDR_WIDTH)-1];
    
    always_ff @ (posedge clk) begin
        if (write_en & ce)
            memory[address] <= write_data;
    end
    
    assign read_data = (out_en & ce) ? memory[address] : 'bz;
     

endmodule
