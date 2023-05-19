module assignment1_tb();

reg front;
reg back;
reg reset;
reg clk;
reg [3:0]password;


wire password_status;
wire [3:0] car_count;


assignment1 dut(front,back,reset,clk,password,password_status,car_count);


initial begin
front = 1'b0;
back  = 1'b0;
reset = 1'b1;
clk   = 1'b0;
password = 4'b0000;

#12
reset = 1'b0;

back = 1'b0;
front = 1'b1;
#10 password = 4'b1010;
#10 back = 1'b1;
front = 1'b0;

#10
back = 1'b0;
front = 1'b1;
#10 password = 4'b0000;
#10 password = 4'b1010;
#10 back = 1'b1;
front = 1'b0;
#10 back = 1'b0;

$display("%t %b %b %d %d",$time,clk,password_status,car_count,dut.state);
#100 $finish;

end


always #5 clk = ~clk;

endmodule
