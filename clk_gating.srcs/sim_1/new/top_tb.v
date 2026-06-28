module top_tb;

reg clk;
reg rst;
reg en;
reg d;

wire q;

top dut(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    en  = 0;
    d   = 0;

    #10 rst = 0;

    #10;
    en = 1;
    d  = 1;

    #20;
    d = 0;

    #20;
    en = 0;
    d = 1;

    #20;
    d = 0;

    #20;
    en = 1;
    d = 1;

    #20;
    $finish;

end

initial
$monitor("Time=%0t clk=%b en=%b rst=%b d=%b q=%b",
          $time, clk, en, rst, d, q);

endmodule