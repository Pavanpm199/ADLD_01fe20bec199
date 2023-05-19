module ram_1_tb();
reg [9:0]addr;
reg clk,rd,wr,cs;
reg [7:0]data;
wire [7:0]mem[1023:0];
wire [7:0]d_out;
integer k,myseed;

ram_1 RAM(addr,data,clk,rd,wr,cs);

initial begin
for(k=0;k<=1023;k=k+1)
begin
data=(k+k)%256;
rd=0;
wr=1;
cs=1;
#2
addr=k;
wr=0;
cs=0;
#2
addr=$random(myseed)%1024;
wr=0;
cs=1;
$display("Address:%5d,data:%4d",addr,data);
end
end
endmodule




