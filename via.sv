`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 02:38:23 PM
// Design Name: 
// Module Name: via
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


module via(
    input [7:0] input_a,
    input [7:0] input_b,
    output [7:0] output_a,  // assigned
    output [7:0] output_b,  // assigned
    
    output logic [7:0] write_data,  // to data bus
    input [7:0] read_data,  // from data bus
    input [1:0] addr,  // 2 bit address
    
    input logic clk,  // assigned
    input logic write_en,  // assigned
    input logic out_en,
    input logic ce,
    
    input reset
);

    
    logic [7:0] dir_a;
    logic [7:0] dir_b;
    
    logic [7:0] internal_a;
    logic [7:0] internal_b;
    
    wire [7:0] write_data_a;
    wire [7:0] write_data_b;
    
    
    always_ff @ (posedge clk or posedge reset)
    begin
        if (reset)
        begin
            dir_a <= 8'b0;
            dir_b <= 8'b0;
            internal_a <= 8'b0;
            internal_b <= 8'b0;
        end
        else if (write_en & ce)
            if (addr == 2'd0)  // output reg B
                internal_b <= read_data;
            else if (addr == 2'd1)  // output reg A
                internal_a <= read_data;
            else if (addr == 2'd2)  // direction B
                dir_b <= read_data;
            else  // direction A
                dir_a <= read_data;
    end
    
    
    // to physical ports
    // write = high, read = low
    assign output_a[0] = dir_a[0] ? internal_a[0] : 1'bz;
    assign output_a[1] = dir_a[1] ? internal_a[1] : 1'bz;
    assign output_a[2] = dir_a[2] ? internal_a[2] : 1'bz;
    assign output_a[3] = dir_a[3] ? internal_a[3] : 1'bz;
    assign output_a[4] = dir_a[4] ? internal_a[4] : 1'bz;
    assign output_a[5] = dir_a[5] ? internal_a[5] : 1'bz;
    assign output_a[6] = dir_a[6] ? internal_a[6] : 1'bz;
    assign output_a[7] = dir_a[7] ? internal_a[7] : 1'bz;
    
    assign output_b[0] = dir_b[0] ? internal_b[0] : 1'bz;
    assign output_b[1] = dir_b[1] ? internal_b[1] : 1'bz;
    assign output_b[2] = dir_b[2] ? internal_b[2] : 1'bz;
    assign output_b[3] = dir_b[3] ? internal_b[3] : 1'bz;
    assign output_b[4] = dir_b[4] ? internal_b[4] : 1'bz;
    assign output_b[5] = dir_b[5] ? internal_b[5] : 1'bz;
    assign output_b[6] = dir_b[6] ? internal_b[6] : 1'bz;
    assign output_b[7] = dir_b[7] ? internal_b[7] : 1'bz;
    
    // reading
    assign write_data_a[0] = dir_a[0] ? internal_a[0] : input_a[0];
    assign write_data_a[1] = dir_a[1] ? internal_a[1] : input_a[1];
    assign write_data_a[2] = dir_a[2] ? internal_a[2] : input_a[2];
    assign write_data_a[3] = dir_a[3] ? internal_a[3] : input_a[3];
    assign write_data_a[4] = dir_a[4] ? internal_a[4] : input_a[4];
    assign write_data_a[5] = dir_a[5] ? internal_a[5] : input_a[5];
    assign write_data_a[6] = dir_a[6] ? internal_a[6] : input_a[6];
    assign write_data_a[7] = dir_a[7] ? internal_a[7] : input_a[7];
    
    assign write_data_b[0] = dir_b[0] ? internal_b[0] : input_b[0];
    assign write_data_b[1] = dir_b[1] ? internal_b[1] : input_b[1];
    assign write_data_b[2] = dir_b[2] ? internal_b[2] : input_b[2];
    assign write_data_b[3] = dir_b[3] ? internal_b[3] : input_b[3];
    assign write_data_b[4] = dir_b[4] ? internal_b[4] : input_b[4];
    assign write_data_b[5] = dir_b[5] ? internal_b[5] : input_b[5];
    assign write_data_b[6] = dir_b[6] ? internal_b[6] : input_b[6];
    assign write_data_b[7] = dir_b[7] ? internal_b[7] : input_b[7];
    

    always_comb
    begin
        if (out_en & ce)
            if (addr == 2'd0)  // output reg B
                write_data = write_data_b;
            else if (addr == 2'd1)  // output reg A
                write_data = write_data_a;
            else if (addr == 2'd2)  // direction B
                write_data = dir_b;
            else  // direction A
                write_data = dir_a;
        else
            write_data = 'bz;
    end
    

endmodule
