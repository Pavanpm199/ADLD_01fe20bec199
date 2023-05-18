module parity_tb;
reg clk, in;
wire z;
parity_generation dut(in, clk, z);
initial
begin

clk = 1'b0;
end
always #5 clk=~clk;
initial
begin
$monitor($time," in=%b z=%b",in,z);
#2  in = 0; #10 in = 1; #10 in = 1; #10 in = 1;
#10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0;
#10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0;

#10 $finish;
end
endmodule



