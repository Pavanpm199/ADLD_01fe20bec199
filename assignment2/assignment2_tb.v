`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 21:53:33
// Design Name: 
// Module Name: assignment2_tb
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


module assignment2_tb(

    );
    
reg clk;
reg reset;
reg start;
reg coin5;
reg coin10;
reg [1:0]product;

wire issue_prod;
wire not_available;
wire [1:0]change5;
integer i;

assignment2 dut(clk,reset,start,coin5,coin10,product,issue_prod,not_available,change5);

initial begin
for(i=0;i<4;i=i+1) 
begin
 dut.prod_cost[i] = (i+1'b1)*5;
end

for(i=0;i<4;i=i+1) 
begin
 dut.prod_count[i] = 3'b010;
end


clk = 1'b0;
reset = 1'b1;
start = 1'b0;

#25;
reset = 1'b0;
start = 1'b1;
#20;
product = 2'b00;
#20;
coin5 = 1'b1;
coin10 = 1'b0;
#20;
start = 1'b0;
coin5 = 1'b0;
coin10 = 1'b1;
#20;
coin5 = 1'b0;
coin10 = 1'b1;
#20;
start = 1'b1;
#20;
product = 2'b11;
#20;
coin5 = 1'b1;
coin10 = 1'b0;
#20;
start = 1'b0;
coin5 = 1'b0;
coin10 = 1'b1;
#20;
coin5 = 1'b1;
coin10 = 1'b1;
#20;
coin5 = 1'b0;
coin10 = 1'b1;


end

always #10 clk = ~clk;
endmodule
