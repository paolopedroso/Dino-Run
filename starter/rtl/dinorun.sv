// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module dinorun import dinorun_pkg::*; (
    input  logic       clk_25_175_i,
    input  logic       rst_ni,

    input  logic       start_i,
    input  logic       up_i,
    input  logic       down_i,

    output logic       digit0_en_o,
    output logic [3:0] digit0_o,
    output logic       digit1_en_o,
    output logic [3:0] digit1_o,
    output logic       digit2_en_o,
    output logic [3:0] digit2_o,
    output logic       digit3_en_o,
    output logic [3:0] digit3_o,

    output logic [3:0] vga_red_o,
    output logic [3:0] vga_green_o,
    output logic [3:0] vga_blue_o,
    output logic       vga_hsync_o,
    output logic       vga_vsync_o
);

logic [15:0] rand_o;
logic next_i;
lfsr16 lfsr16_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),

    .next_i(next_i),
    .rand_o(rand_o)
);

logic [8:0] position_x_o;
logic [7:0] position_y_o;
logic hsync_o;
logic vsync_o;
logic visible_o;
vga_timer vga_timer_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .hsync_o(hsync_o),
    .vsync_o(vsync_o),
    .visible_o(visible_o),
    .position_x_o(position_x_o),
    .position_y_o(position_y_o)
);

logic data_i;
logic edge_o;
edge_detector edge_detector_inst (
    .clk_i(clk_25_175_i),
    .data_i(data_i),

    .edge_o(edge_o),
);


logic [3:0] score0_o;
logic [3:0] score1_o;
logic [3:0] score2_o;
logic [3:0] score3_o;
logic en_sc_i;
logic rst_sc_ni;
score_counter score_counter_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_sc_ni),
    .en_i(en_sc_i),
    .digit0_o(score0_o),
    .digit1_o(score1_o),
    .digit2_o(score2_o),
    .digit3_o(score3_o)
);

logic next_frame_b_i;
logic spawn_b_i;
logic rand_b_i;
logic pixel_x_b_i;
logic pixel_y_b_i;
logic pixel_b_o;
bird bird_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .next_frame_i(next_frame_b_i),
    .spawn_i(spawn_b_i),
    .rand_i(rand_b_i),
    .pixel_x_i(pixel_x_b_i),
    .pixel_y_i(pixel_y_b_i),
    .pixel_o(pixel_b_o)
);

logic next_frame_c_i;
logic spawn_c_i;
logic rand_c_i;
logic pixel_x_c_i;
logic pixel_y_c_i;
logic pixel_c_o;
cactus cactus_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .next_frame_i(next_frame_c_i),
    .spawn_i(spawn_c_i),
    .rand_i(rand_c_i),
    .pixel_x_i(pixel_x_c_i),
    .pixel_y_i(pixel_y_c_i),
    .pixel_o(pixel_c_o)
);

logic next_frame_d_i;
logic rand_d_i;
logic pixel_x_d_i;
logic pixel_y_d_i;
logic pixel_d_o;
logic hit_i;
dino dino_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .next_frame_i(next_frame_d_i),
    .up_i(up_i),
    .down_i(down_i),
    .hit_i(hit_i),
    .rand_i(rand_d_i),
    .pixel_x_i(pixel_x_d_i),
    .pixel_y_i(pixel_y_d_i),
    .pixel_o(pixel_d_o)
);

state_t state_d, state_q;

always_ff @(posedge clk_25_175_i) begin
    if (!rst_ni) begin
        state_q <= TITLE;
    end else begin
        state_q <= state_d;
    end
end

always_comb begin
    en_sc_i = 0;
    hit_i = 0;
    rst_sc_ni = 1;

    unique case (state_q)
    TITLE: begin
        // Init board to 0
        digit0_en_o = 1;
        digit1_en_o = 1;
        digit2_en_o = 1;
        digit3_en_o = 1;
        digit0_o = score0_o;
        digit1_o = score1_o;
        digit2_o = score2_o;
        digit3_o = score3_o;
        // Init score counter to 0
        en_sc_i = 0;
        rst_sc_ni = 0;

        hit_i = 0;


        if(start_i == 1) begin
            state_d = RUNNING;
        end else begin
            state_d = TITLE;
        end
    end
    RUNNING: begin
        en_sc_i = 1; // Enable score counter
        rst_sc_ni = 1;
        digit0_en_o = 1;
        digit1_en_o = 1;
        digit2_en_o = 1;
        digit3_en_o = 1;
        digit0_o = score0_o;
        digit1_o = score1_o;
        digit2_o = score2_o;
        digit3_o = score3_o;
        // if hit
        // state_d = hit
        // else
        // running

    end
    HIT: begin
        en_sc_i = 0; // Freeze 
        digit0_en_o = 1;
        digit1_en_o = 1;
        digit2_en_o = 1;
        digit3_en_o = 1;
        digit0_o = score0_o;
        digit1_o = score1_o;
        digit2_o = score2_o;
        digit3_o = score3_o;
        if (start_i) begin
            rst_sc_ni = 0;
            state_d = RUNNING;
        end else begin
            state_d = HIT;
        end
    end
    default: begin
        state_d = TITLE;
    end
    endcase

end

endmodule
