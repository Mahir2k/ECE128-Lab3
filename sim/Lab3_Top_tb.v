`timescale 1ns / 1ps

module Lab3_Top_tb;

reg clk;
reg [3:0] A;
reg [3:0] B;
reg CI;

wire [6:0] seg;
wire [3:0] an;
wire dp;

initial begin
    clk = 0;
end

always #5 clk = ~clk;

Lab3_Top #(
    .USE_CLA(0),
    .REFRESH_BIT(2)
) DUT (
    .clk(clk),
    .A(A),
    .B(B),
    .CI(CI),
    .seg(seg),
    .an(an),
    .dp(dp)
);

initial begin

    A = 4'd0;
    B = 4'd0;
    CI = 0;

    #100;

    A = 4'd3;
    B = 4'd4;
    CI = 0;

    #100;

    A = 4'd5;
    B = 4'd5;
    CI = 0;

    #100;

    A = 4'd7;
    B = 4'd6;
    CI = 0;

    #100;

    A = 4'd9;
    B = 4'd6;
    CI = 0;

    #100;

    A = 4'd15;
    B = 4'd1;
    CI = 0;

    #100;

    A = 4'd4;
    B = 4'd4;
    CI = 1;

    #100;

    $stop;

end

endmodule
