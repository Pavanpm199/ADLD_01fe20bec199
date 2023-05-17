module andgate_tb();
reg a,b;
wire c;
andgate DUT(a,b,c);
initial begin 
$monitor("a=%b b=%b c=%b",a,b,c);
a=0;
b=0;
#20;

a=0;
b=1;
#20;

a=1;
b=0;
#10;

a=1;
b=1;
end 
endmodule
