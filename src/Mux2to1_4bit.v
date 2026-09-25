module Mux2to1_4bit (
    input [3:0] I0,
    input [3:0] I1,
    input S,
    output [3:0] Y
);

assign Y = S ? I1 : I0;

endmodule
