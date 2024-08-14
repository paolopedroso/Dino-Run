// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

// https://vesa.org/vesa-standards/
// http://tinyvga.com/vga-timing
module vga_timer (
    input  logic       clk_i,
    input  logic       rst_ni,
    output logic       hsync_o,
    output logic       vsync_o,
    output logic       visible_o,
    output logic [9:0] position_x_o,
    output logic [9:0] position_y_o
);

integer maxVisX = 640;
integer maxX = 800;
integer maxVisY = 480;
integer maxY = 525;

logic [9:0] v_counter;
logic [9:0] h_counter;

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        h_counter <= 0;
    end else if (h_counter == maxX - 1) begin
        h_counter <= 0;
    end else begin
        h_counter <= h_counter + 1;
    end
end

logic [9:0] v_counter_d;

always_comb begin
    v_counter_d = v_counter;
    if ((v_counter == maxY - 1) && (h_counter == maxX - 1)) begin
        v_counter_d = 0;
    end else if (h_counter == maxX - 1) begin
        v_counter_d = v_counter + 1;
    end
end

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        v_counter <= 0;
    end else begin
        v_counter <= v_counter_d;
    end
end

assign position_x_o = h_counter;
assign position_y_o = v_counter;

assign hsync_o = ~(h_counter >= (maxVisX + 16) && h_counter < (maxVisX + 16 + 96));
assign vsync_o = ~(v_counter >= (maxVisY + 10) && v_counter < (maxVisY + 10 + 2));
assign visible_o = (h_counter < maxVisX && v_counter < maxVisY);

endmodule
