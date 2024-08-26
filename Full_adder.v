
// building full adder using two half adder
module full_adder(x, y, z, s, c);
input x,y,z;
output s,c;
wire c0,c1,s0;
half_adder HA0(
.x(x),
.y(y),
.c(c0),
.s(s0)
);

half_adder HA1(
.x(s0),
.y(z),
.c(c1),
.s(s)
);

assign c=c0|c1;

endmodule
