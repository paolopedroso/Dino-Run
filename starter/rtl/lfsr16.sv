// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module lfsr16 (
    input  logic       clk_i,
    input  logic       rst_ni,

    input  logic       next_i,
    output logic [15:0] rand_o
);

logic [15:0] rand_q, rand_d;

always_comb begin
    rand_d = rand_q;
    rand_d = {rand_d[15:1], rand_q[15] ^ rand_q[14] ^ rand_q[12] ^ rand_q[3]};
end

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        rand_q <= 16'b0000000000000001;
    end else if (next_i) begin
        rand_q <= rand_d;
    end
end

assign rand_o = rand_q[15:0];

endmodule
