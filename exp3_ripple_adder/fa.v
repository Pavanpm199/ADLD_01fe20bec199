`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2022 23:07:39
// Design Name: 
// Module Name: fa
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


module fa(output cout,sum,
        input a,b,cin);
        
wire s1,c1,c2;

ha ha1(c1,s1,a,b);
ha ha2(c2,sum,s1,cin);
or or1(cout,c2,c1);
endmodule
