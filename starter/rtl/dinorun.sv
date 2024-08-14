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

logic [9:0] vga_x;
logic [9:0] vga_y;
logic vga_hsync_d;
logic vga_vsync_d;
logic visible;
vga_timer vga_timer_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .hsync_o(vga_hsync_d),
    .vsync_o(vga_vsync_d),
    .visible_o(visible),
    .position_x_o(vga_x),
    .position_y_o(vga_y)
);

logic edge_o;
edge_detector edge_detector_inst (
    .clk_i(clk_25_175_i),
    .data_i(vga_vsync_d),

    .edge_o(edge_o)
);

logic en_sc_i;
logic rst_sc_ni;
logic [3:0] digit0_d;
logic [3:0] digit1_d;
logic [3:0] digit2_d;
logic [3:0] digit3_d;
score_counter score_counter_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_sc_ni),
    .en_i(en_sc_i),
    .digit0_o(digit0_d),
    .digit1_o(digit1_d),
    .digit2_o(digit2_d),
    .digit3_o(digit3_d)
);

logic rst_obs;

logic next_frame_b_i;
logic spawn_b_i;
logic rand_b_i;
logic pixel_b_o;
bird bird_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_obs),
    .next_frame_i(next_frame_b_i),
    .spawn_i(spawn_b_i),
    .rand_i(rand_b_i),
    .pixel_x_i(vga_x),
    .pixel_y_i(vga_y),
    .pixel_o(pixel_b_o)
);

logic next_frame_c_i;
logic spawn_c_i;
logic rand_c_i;
logic pixel_c_o;
cactus cactus_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_obs),
    .next_frame_i(next_frame_c_i),
    .spawn_i(spawn_c_i),
    .rand_i(rand_c_i),
    .pixel_x_i(vga_x),
    .pixel_y_i(vga_y),
    .pixel_o(pixel_c_o)
);

logic next_frame_c1_i;
logic spawn_c1_i;
logic rand_c1_i;
logic pixel_c1_o;
cactus cactus1_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_obs),
    .next_frame_i(next_frame_c1_i),
    .spawn_i(spawn_c1_i),
    .rand_i(rand_c1_i),
    .pixel_x_i(vga_x),
    .pixel_y_i(vga_y),
    .pixel_o(pixel_c1_o)
);

logic next_frame_d_i;
logic pixel_d_o;
logic hit_i;
dino dino_inst (
    .clk_i(clk_25_175_i),
    .rst_ni(rst_ni),
    .next_frame_i(next_frame_d_i),
    .up_i(up_i),
    .down_i(down_i),
    .hit_i(hit_i),
    .pixel_x_i(vga_x),
    .pixel_y_i(vga_y),
    .pixel_o(pixel_d_o)
);

logic pixel_t_o;
title title_inst (
    .pixel_x_i(vga_x),
    .pixel_y_i(vga_y),
    .pixel_o(pixel_t_o)
);

state_t state_d, state_q;

// logic visible;
always_ff @(posedge clk_25_175_i) begin
    vga_hsync_o <= vga_hsync_d;
    vga_vsync_o <= vga_vsync_d;
    if (visible) begin
        if (pixel_t_o && state_q == TITLE) begin // title
            vga_red_o <= 4'b1010;
            vga_green_o <= 4'b0110;
            vga_blue_o <= 4'b0001;
            // && (state_q == RUNNING || state_q == HIT)
        end else if (pixel_c_o) begin // cactus
            vga_red_o <= 4'b0011;
            vga_green_o <= 4'b1001;
            vga_blue_o <= 4'b0010;
        end else if (pixel_c1_o) begin // cactus 2
            vga_red_o <= 4'b0011;
            vga_green_o <= 4'b1001;
            vga_blue_o <= 4'b0010;
        end else if (pixel_b_o) begin // bird
            vga_red_o <= 4'b0101;
            vga_green_o <= 4'b0011;
            vga_blue_o <= 4'b0001;
        end else if (pixel_d_o) begin // dino
            vga_red_o <= 4'b1001;
            vga_green_o <= 4'b1001;
            vga_blue_o <= 4'b1001;
        end else if (vga_y > Ground) begin // Ground
            vga_red_o <= 4'b1010;
            vga_green_o <= 4'b1010;
            vga_blue_o <= 4'b1010;
        end else begin // Sky
            vga_red_o <= 4'b1110;
            vga_green_o <= 4'b1110;
            vga_blue_o <= 4'b1110;
        end
    end else begin
        vga_red_o <= 4'b0000;
        vga_green_o <= 4'b0000;
        vga_blue_o <= 4'b0000;
    end
end

always_ff @(posedge clk_25_175_i) begin
    if (!rst_ni) begin
        state_q <= TITLE;
    end else begin
        state_q <= state_d;
    end
end

always_comb begin
    state_d = state_q;

    // Enable counter
    digit0_en_o = 1;
    digit1_en_o = 1;
    digit2_en_o = 1;
    digit3_en_o = 1;
    digit0_o = digit0_d;
    digit1_o = digit1_d;
    digit2_o = digit2_d;
    digit3_o = digit3_d;

    // Next frame
    next_frame_b_i = 0;
    next_frame_c_i = 0;
    next_frame_c1_i = 0;
    next_frame_d_i = 0;

    // Random spawns
    rand_b_i = 0;
    rand_c_i = 0;
    rand_c1_i = 0;

    spawn_b_i = 0;
    spawn_c_i = 0;
    spawn_c1_i = 0;

    // Set rst_obs to rst_ni
    rst_sc_ni = 1;
    rst_obs = 1;
    en_sc_i = 0;

    unique case (state_q)
        TITLE: begin
            rst_sc_ni = 0;
            rst_obs = 0;
            en_sc_i = 0;
            hit_i = 0;

            next_frame_b_i = 0;
            next_frame_c_i = 0;
            next_frame_c1_i = 0;
            next_frame_d_i = edge_o;

            if (start_i || up_i) begin
                state_d = RUNNING;
            end
        end
        RUNNING: begin
            // Score counter
            rst_sc_ni = 1;
            en_sc_i = edge_o;

            // Next frame
            next_frame_b_i  = edge_o;
            next_frame_c_i = edge_o;
            next_frame_c1_i = edge_o;
            next_frame_d_i = edge_o;

            // Digits
            digit0_o = digit0_d;
            digit1_o = digit1_d;
            digit2_o = digit2_d;
            digit3_o = digit3_d;

            // Generate next random number
            next_i = 1;

            // Spawn obstacles
            if (rand_o[4:0] == 5'b00000) begin
                spawn_b_i = 1;
                rand_b_i = rand_o[2:1];
            end else if (rand_o[4:0] == 5'b10011) begin
                spawn_c_i = 1;
                rand_c_i = rand_o[4:3];
            end else if (rand_o[4:0] == 5'b01001) begin
                spawn_c1_i = 1;
                rand_c1_i = rand_o[1:0];
            end
            // Transition to HIT state on collision
            if (pixel_d_o && (pixel_c_o || pixel_c1_o || pixel_b_o)) begin
                state_d = HIT;
            end else begin
                rand_b_i = 0;
                rand_c_i = 0;
                rand_c1_i = 0;
                state_d = RUNNING;
            end
        end

        HIT: begin
            hit_i = 1;
            en_sc_i = 0; // Stop score counting
            rst_obs = 1;

            // Freeze
            next_frame_b_i = 0;
            next_frame_c_i = 0;
            next_frame_c1_i = 0;

            // Reset the game on start signal
            if (start_i) begin
                rst_sc_ni = 0;
                rst_obs = 0; // rst obstacles
                state_d = TITLE;
            end
        end

        default: begin
            state_d = TITLE;
        end
    endcase
end

endmodule
