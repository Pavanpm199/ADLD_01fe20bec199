module parity_generation (in, clk, z);
input in, clk;
output reg z;
reg parity;

parameter even=0, odd=1;
always @(posedge clk)
case (parity)	
even: begin
z <= in ? 1 : 0;	
parity <= in ? odd : even;
end
odd: begin
z <= in ? 0 : 1;
parity <= in ? even : odd;
end
default: parity <= even;
endcase
endmodule

