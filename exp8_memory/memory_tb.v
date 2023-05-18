`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 23:34:35
// Design Name: 
// Module Name: memory_tb
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


module memory_tb(

    );
    
reg clk,reset;
reg wr;
reg [7:0]din;
reg [5:0]addr;
wire [7:0]dout;

memory m1(clk,wr,reset,addr,din,dout);
initial begin
clk=1'b0;
reset=1'b0;
wr=1'b0;
end

initial begin
#20 wr=1'b1;
addr=6'd24;
din=8'hC1;

#30 wr=1'b1;
addr=6'd25;
din=8'h11;

#40
reset=1'b1;

#50
reset=1'b0;
wr=1'b0;
addr=6'd24;

#60
wr=1'b0;
addr=6'd25;

end

initial begin
$monitor("time=%t  addr=%d wr=%b datain=%d  dataout=%d",$time,addr,wr,din,dout);
end

always #5 clk=~clk;
endmodule
