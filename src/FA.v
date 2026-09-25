module FA (
    input A,
    input B,
    input CI,
    output SUM,
    output CO
);

assign SUM = A ^ B ^ CI;
assign CO = (A & B) | (A & CI) | (B & CI);

endmodule
