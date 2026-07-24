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


module rom #(
    parameter int ADDR_WIDTH = 11,
    parameter int DATA_WIDTH = 8,
    parameter string ROM_FILE = "rom_data.mem"
) (
    input  logic [ADDR_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] data
);

    logic [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];
    logic [DATA_WIDTH-1:0] raw_data;

    initial begin
        $readmemb(ROM_FILE, mem);
    end

    assign raw_data = mem[addr];

    // Reverse bit order: bit 7 becomes bit 0, bit 6 becomes bit 1, etc.
    /*
    assign data = {
        raw_data[0],
        raw_data[1],
        raw_data[2],
        raw_data[3],
        raw_data[4],
        raw_data[5],
        raw_data[6],
        raw_data[7]
    };
    */
    // don't reverse
    assign data = raw_data;

endmodule
