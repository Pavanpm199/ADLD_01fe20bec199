`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2022 23:44:56
// Design Name: 
// Module Name: ripple_4bit_tb
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


module ripple_4bit_tb();
    
reg [3:0]a;
reg [3:0]b;
reg cin;

wire [3:0]s;
wire cout;

ripple_4bit DUT(cout,s,a,b,cin);

initial begin
a=4'd8;
b=4'd9;
cin=1'b0;
#10;

a=4'd8;
b=4'd1;
cin=1'b0;
#10;
a=4'd8;
b=4'd7;
cin=1'b1;
#10;
end 
endmodule
