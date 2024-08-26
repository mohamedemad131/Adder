//build more general n bit adder

module nbit_adder
#(parameter n=4)
(
input [n-1:0] x,y,
input cin,
output [n-1:0] s,
output cout
);

wire [n:0] c;
assign c[0]=cin;
assign cout=c[n];
generate
	genvar k; 
	for(k=0;k<n;k=k+1)
	begin
		full_adder FA(
			.x(x[k]),
			.y(y[k]),
			.z(c[k]),
			.c(c[k+1]),
			.s(s[k])
		);
	end
endgenerate
endmodule
