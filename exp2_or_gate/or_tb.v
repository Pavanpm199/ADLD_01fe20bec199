module orgatetb();
reg a,b;
wire c;
orgate DUT(.a(a),.b(b),.c(c));
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
#20;

a=1;
b=1;
#20;
end 
endmodule