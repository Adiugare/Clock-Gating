module top(
    input clk,
    input rst,
    input en,
    input d,
    output reg q
);

wire gated_clk;

clk_gating cg(
    .clk(clk),
    .en(en),
    .gated_clk(gated_clk)
);

always @(posedge gated_clk or posedge rst)
begin
    if(rst)
        q <= 0;
    else
        q <= d;
end

endmodule