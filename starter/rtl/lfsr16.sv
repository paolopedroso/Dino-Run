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
    rand_d[15] = rand_q[14];
    rand_d[14] = rand_q[13];
    rand_d[13] = rand_q[12];
    rand_d[12] = rand_q[11];
    rand_d[11] = rand_q[10];
    rand_d[10] = rand_q[9];
    rand_d[9] = rand_q[8];
    rand_d[8] = rand_q[7];
    rand_d[7] = rand_q[6];
    rand_d[6] = rand_q[5];
    rand_d[5] = rand_q[4];
    rand_d[4] = rand_q[3];
    rand_d[3] = rand_q[2];
    rand_d[2] = rand_q[1];
    rand_d[1] = rand_q[0];
    rand_d[0] = rand_q[15] ^ rand_q[14] ^ rand_q[12] ^ rand_q[3];
    //rand_d = {rand_q[7:1], rand_q[7] ^ rand_q[5] ^ rand_q[4] ^ rand_q[3]};
end


always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        rand_q <= 16'b0000000000000001;
    end else if (next_i) begin
        rand_q <= rand_d;
    end
end

assign rand_o = rand_q;

endmodule