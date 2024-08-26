
// build n bit adder subtractor 

module nbit_add_sub
#(parameter n=4)
(
input [n-1:0] x,y,
input control_bit,
output [n-1:0] s,
output cout,
output overflow
);
wire [n-1:0] y_in;
wire [n:0] c;
assign c[0]=control_bit;
assign cout=c[n];
generate
	genvar k; 
	for (k=0;k<n;k=k+1)
	begin
		assign y_in[k]=y[k]^control_bit;
/*
 way one
		full_adder FA(
			.x(x[k]),
			.y(y_in[k]),
			.z(c[k]),
			.s(s[k]),
			.c(c[k+1])
		);
*/
	end
endgenerate
/*
way two
or you can use nbit adder directly */
nbit_adder #(.n(n)) adder_sub(
.x(x),
.y(y_in),
.s(s),
.cin(control_bit),
.cout(cout)
);
// over flow happen if we add two positive number and the result is negative 
//if most segnificant bit is 1 in both x and y is equal to 1 and 0 in result it is over flow 
//and the same for negative number 
assign overflow = (~x[n-1] & ~y_in[n-1] & s[n-1])|(x[n-1] & y_in[n-1] & ~s[n-1]);

endmodule
