`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2023 23:16:47
// Design Name: 
// Module Name: pipelined_alu
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


module pipelined_alu(
input clk,
input [3:0]rs1,rs2,rd,func,
input [7:0]addr,
output [15:0]z
);

reg [15:0]regbank [15:0];
reg [15:0]mem [255:0];

reg [15:0]a,b;
reg [7:0]l12_addr;
reg [3:0]l12_func,l12_rd;

reg [15:0]l23_z;
reg [7:0]l23_addr;
reg [3:0]l23_rd;

reg [15:0]l34_z;
reg [7:0]l34_addr;

always@(posedge clk)
begin
  a    <= regbank[rs1];
  b    <= regbank[rs2];

l12_func  <= func;
l12_rd    <= rd;
l12_addr  <= addr;


end


always@(posedge clk)
begin
case(l12_func)
4'b0000:l23_z  <=  a+b;
4'b0001:l23_z  <=  a-b;
4'b0010:l23_z  <=  a*b;
4'b0011:l23_z  <=  a;
4'b0100:l23_z  <=  b;
4'b0101:l23_z  <=  ~a;
4'b0110:l23_z  <=  ~b;
4'b0111:l23_z  <=  a<<1;
4'b1001:l23_z  <=  a>>1;
4'b1010:l23_z  <=  b<<1;
default :l23_z <=  16'h0000;
endcase

l23_addr <= l12_addr;
l23_rd   <= l12_rd;
end

always@(posedge clk)
begin

regbank[l23_rd]  <= l23_z;

l34_z    <=  l23_z;
l34_addr <=  l23_addr;  
end

always@(posedge clk)
begin
mem[l34_addr] <=  l34_z;  
end



assign z=l34_z;
endmodule
