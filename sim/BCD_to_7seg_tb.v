`timescale 1ns / 1ps

module BCD_to_7seg_tb;

reg [3:0] BCD;
wire [6:0] seg;

integer i;

BCD_to_7seg DUT (
    .BCD(BCD),
    .seg(seg)
);

initial begin

    $display("BCD seg");
    $display("----------");

    for (i = 0; i < 16; i = i + 1) begin
        BCD = i;
        #10;
        $display("%d %b", BCD, seg);
    end

    $stop;

end

endmodule
