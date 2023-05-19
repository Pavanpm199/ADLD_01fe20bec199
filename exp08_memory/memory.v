`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 23:24:47
// Design Name: 
// Module Name: memory
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


module memory(input clk,wr,reset,
input [5:0]addr,
input [7:0]din,
output [7:0]dout
);
integer i;
reg [7:0] mem [63:0];
reg [7:0]temp;
always@(posedge clk)
begin
    if(reset)
    begin
        for(i=0;i<64;i=i+1)
        begin
            mem[i]<=8'h00;
        end
    end
    else 
    begin
        if(wr)
            mem[addr]<=din;
        else 
            temp<=mem[addr];
    end

end
assign dout=temp;
endmodule
