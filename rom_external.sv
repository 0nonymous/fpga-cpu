`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2026 12:22:03 AM
// Design Name: 
// Module Name: rom
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


module rom_external #(
    parameter int ADDR_WIDTH = 11,
    parameter int DATA_WIDTH = 8,
    parameter string ROM_FILE = "rom_data.mem"
) (
    input  logic [ADDR_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] data,
    input  logic out_en,
    input  logic ce
);

    logic [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];
    logic [DATA_WIDTH-1:0] raw_data;

    initial begin
        $readmemb(ROM_FILE, mem);
    end

    assign raw_data = mem[addr];
    assign data = (out_en & ce) ? raw_data : 'bz;

endmodule
