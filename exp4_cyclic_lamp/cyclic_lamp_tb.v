`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 22:25:47
// Design Name: 
// Module Name: cyclic_lamp_tb
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


module cyclic_lamp_tb();
reg clk;
wire [0:2]light;
cyclic_lamp DUT(clk,light);
initial begin
clk=1'b0;
end

always #20 clk=~clk;

initial begin
$monitor($time," RGY:%b",light);
end
endmodule
