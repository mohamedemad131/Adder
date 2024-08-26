
// building 4 bit binary adder with 4 stage of full adder

module binary_adder(
inout [3:0] x,y,
input cin,
output [3:0] s,
output cout
);

wire [3:1] c;
 full_adder FA0(
.x(x[0]),
.y(y[0]),
.z(cin),
.c(c[1]),
.s(s[0])
);

full_adder FA1( x[1],y[1],c[1],s[1],c[2]);

full_adder FA2(
.x(x[2]),
.y(y[2]),
.z(c[2]),
.c(c[3]),
.s(s[2])
);

full_adder FA3( x[3],y[3],c[3],s[3],cout);

endmodule