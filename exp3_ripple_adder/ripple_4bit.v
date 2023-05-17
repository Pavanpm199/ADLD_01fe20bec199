`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2022 23:36:09
// Design Name: 
// Module Name: ripple_4bit
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


module ripple_4bit( output cout,[3:0]s,
input [3:0]a,input [3:0]b,
input cin
);
wire c0,c1,c2;

fa f1(c0,s[0],a[0],b[0],cin);
fa f2(c1,s[1],a[1],b[1],c0);
fa f3(c2,s[2],a[2],b[2],c1);
fa f4(cout,s[3],a[3],b[3],c2);
endmodule
