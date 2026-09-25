module RCA_4bit (
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [3:0] SUM,
    output CO
);

wire c1, c2, c3;

FA FA0 (
    .A(A[0]),
    .B(B[0]),
    .CI(CI),
    .SUM(SUM[0]),
    .CO(c1)
);

FA FA1 (
    .A(A[1]),
    .B(B[1]),
    .CI(c1),
    .SUM(SUM[1]),
    .CO(c2)
);

FA FA2 (
    .A(A[2]),
    .B(B[2]),
    .CI(c2),
    .SUM(SUM[2]),
    .CO(c3)
);

FA FA3 (
    .A(A[3]),
    .B(B[3]),
    .CI(c3),
    .SUM(SUM[3]),
    .CO(CO)
);

endmodule
