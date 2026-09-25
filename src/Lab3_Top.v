module Lab3_Top #(
    parameter USE_CLA = 0,
    parameter REFRESH_BIT = 15
)(
    input clk,
    input [3:0] A,
    input [3:0] B,
    input CI,
    output [6:0] seg,
    output reg [3:0] an,
    output dp
);

wire [3:0] SUM;
wire CO;

generate

    if (USE_CLA == 1) begin : CLA_SELECT

        CLA_4bit CLA (
            .A(A),
            .B(B),
            .CI(CI),
            .SUM(SUM),
            .CO(CO)
        );

    end

    else begin : RCA_SELECT

        RCA_4bit RCA (
            .A(A),
            .B(B),
            .CI(CI),
            .SUM(SUM),
            .CO(CO)
        );

    end

endgenerate

wire [3:0] ones;
wire [3:0] tens;

assign tens = (SUM >= 4'd10) ?
              4'd1 :
              4'd0;

assign ones = (SUM >= 4'd10) ?
              (SUM - 4'd10) :
              SUM;

reg [REFRESH_BIT:0] refresh_counter = 0;

always @(posedge clk) begin
    refresh_counter <= refresh_counter + 1'b1;
end

wire select_digit;

assign select_digit = refresh_counter[REFRESH_BIT];

wire [3:0] selected_BCD;

Mux2to1_4bit MUX (
    .I0(ones),
    .I1(tens),
    .S(select_digit),
    .Y(selected_BCD)
);

BCD_to_7seg DECODER (
    .BCD(selected_BCD),
    .seg(seg)
);

always @(*) begin

    if (select_digit == 1'b0) begin
        an = 4'b1110;
    end

    else begin

        if (tens != 4'd0)
            an = 4'b1101;
        else
            an = 4'b1111;

    end

end

assign dp = 1'b1;

endmodule
