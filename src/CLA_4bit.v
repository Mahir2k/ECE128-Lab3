module CLA_4bit (
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [3:0] SUM,
    output CO
);

wire [3:0] P;
wire [3:0] G;
wire c1, c2, c3, c4;

assign P = A ^ B;
assign G = A & B;

assign c1 = G[0] |
            (P[0] & CI);

assign c2 = G[1] |
            (P[1] & G[0]) |
            (P[1] & P[0] & CI);

assign c3 = G[2] |
            (P[2] & G[1]) |
            (P[2] & P[1] & G[0]) |
            (P[2] & P[1] & P[0] & CI);

assign c4 = G[3] |
            (P[3] & G[2]) |
            (P[3] & P[2] & G[1]) |
            (P[3] & P[2] & P[1] & G[0]) |
            (P[3] & P[2] & P[1] & P[0] & CI);

assign SUM[0] = P[0] ^ CI;
assign SUM[1] = P[1] ^ c1;
assign SUM[2] = P[2] ^ c2;
assign SUM[3] = P[3] ^ c3;

assign CO = c4;

endmodule
