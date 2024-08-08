module cactus(clk_i, rst_ni, next_frame_i, spawn_i, rand_i, pixel_x_i, pixel_y_i, pixel_o);
  wire [10:0] _00_;
  wire _01_;
  wire [10:0] _02_;
  wire [11:0] _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire [31:0] _07_;
  wire [31:0] _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire [14:0] _13_;
  wire [14:0] _14_;
  wire [14:0] _15_;
  wire [14:0] _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire [31:0] _25_;
  wire [31:0] _26_;
  wire _sv2v_0;
  wire [1:0] cactus_image_q;
  wire [10:0] cactus_x_q;
  input clk_i;
  wire clk_i;
  input next_frame_i;
  wire next_frame_i;
  wire off_screen;
  wire pixel_in_range;
  output pixel_o;
  wire pixel_o;
  input [9:0] pixel_x_i;
  wire [9:0] pixel_x_i;
  wire pixel_x_in_range;
  input [9:0] pixel_y_i;
  wire [9:0] pixel_y_i;
  wire pixel_y_in_range;
  input [1:0] rand_i;
  wire [1:0] rand_i;
  wire [9:0] rom_x;
  wire [9:0] rom_y;
  input rst_ni;
  wire rst_ni;
  input spawn_i;
  wire spawn_i;
  reg [14:0] CACTUS0 [32:0];
  initial begin
    CACTUS0[0] = 15'h01c0;
    CACTUS0[1] = 15'h03e0;
    CACTUS0[2] = 15'h03e0;
    CACTUS0[3] = 15'h23e0;
    CACTUS0[4] = 15'h73e2;
    CACTUS0[5] = 15'h73e7;
    CACTUS0[6] = 15'h73e7;
    CACTUS0[7] = 15'h73e7;
    CACTUS0[8] = 15'h73e7;
    CACTUS0[9] = 15'h73e7;
    CACTUS0[10] = 15'h73e7;
    CACTUS0[11] = 15'h73e7;
    CACTUS0[12] = 15'h73e7;
    CACTUS0[13] = 15'h73e7;
    CACTUS0[14] = 15'h73e7;
    CACTUS0[15] = 15'h7fe7;
    CACTUS0[16] = 15'h3fe7;
    CACTUS0[17] = 15'h1fff;
    CACTUS0[18] = 15'h03fe;
    CACTUS0[19] = 15'h03fc;
    CACTUS0[20] = 15'h03e0;
    CACTUS0[21] = 15'h03e0;
    CACTUS0[22] = 15'h03e0;
    CACTUS0[23] = 15'h03e0;
    CACTUS0[24] = 15'h03e0;
    CACTUS0[25] = 15'h03e0;
    CACTUS0[26] = 15'h03e0;
    CACTUS0[27] = 15'h03e0;
    CACTUS0[28] = 15'h03e0;
    CACTUS0[29] = 15'h03e0;
    CACTUS0[30] = 15'h03e0;
    CACTUS0[31] = 15'h03e0;
    CACTUS0[32] = 15'h03e0;
  end
  assign _13_ = CACTUS0[rom_y[5:0]];
  reg [14:0] CACTUS1 [32:0];
  initial begin
    CACTUS1[0] = 15'h01c0;
    CACTUS1[1] = 15'h03e0;
    CACTUS1[2] = 15'h03e0;
    CACTUS1[3] = 15'h23e0;
    CACTUS1[4] = 15'h73e0;
    CACTUS1[5] = 15'h73e0;
    CACTUS1[6] = 15'h73e0;
    CACTUS1[7] = 15'h73e2;
    CACTUS1[8] = 15'h73e7;
    CACTUS1[9] = 15'h73e7;
    CACTUS1[10] = 15'h73e7;
    CACTUS1[11] = 15'h73e7;
    CACTUS1[12] = 15'h73e7;
    CACTUS1[13] = 15'h73e7;
    CACTUS1[14] = 15'h73e7;
    CACTUS1[15] = 15'h73e7;
    CACTUS1[16] = 15'h73e7;
    CACTUS1[17] = 15'h73e7;
    CACTUS1[18] = 15'h73e7;
    CACTUS1[19] = 15'h73e7;
    CACTUS1[20] = 15'h3fe7;
    CACTUS1[21] = 15'h1fe7;
    CACTUS1[22] = 15'h0fff;
    CACTUS1[23] = 15'h03fe;
    CACTUS1[24] = 15'h03fc;
    CACTUS1[25] = 15'h03e0;
    CACTUS1[26] = 15'h03e0;
    CACTUS1[27] = 15'h03e0;
    CACTUS1[28] = 15'h03e0;
    CACTUS1[29] = 15'h03e0;
    CACTUS1[30] = 15'h03e0;
    CACTUS1[31] = 15'h03e0;
    CACTUS1[32] = 15'h03e0;
  end
  assign _14_ = CACTUS1[rom_y[5:0]];
  reg [14:0] CACTUS2 [32:0];
  initial begin
    CACTUS2[0] = 15'h01c0;
    CACTUS2[1] = 15'h03e0;
    CACTUS2[2] = 15'h03e0;
    CACTUS2[3] = 15'h03e0;
    CACTUS2[4] = 15'h03e2;
    CACTUS2[5] = 15'h03e7;
    CACTUS2[6] = 15'h03e7;
    CACTUS2[7] = 15'h03e7;
    CACTUS2[8] = 15'h23e7;
    CACTUS2[9] = 15'h73e7;
    CACTUS2[10] = 15'h73e7;
    CACTUS2[11] = 15'h73e7;
    CACTUS2[12] = 15'h73e7;
    CACTUS2[13] = 15'h73e7;
    CACTUS2[14] = 15'h73e7;
    CACTUS2[15] = 15'h73ff;
    CACTUS2[16] = 15'h73fe;
    CACTUS2[17] = 15'h73fc;
    CACTUS2[18] = 15'h73e0;
    CACTUS2[19] = 15'h7fe0;
    CACTUS2[20] = 15'h3fe0;
    CACTUS2[21] = 15'h1fe0;
    CACTUS2[22] = 15'h03e0;
    CACTUS2[23] = 15'h03e0;
    CACTUS2[24] = 15'h03e0;
    CACTUS2[25] = 15'h03e0;
    CACTUS2[26] = 15'h03e0;
    CACTUS2[27] = 15'h03e0;
    CACTUS2[28] = 15'h03e0;
    CACTUS2[29] = 15'h03e0;
    CACTUS2[30] = 15'h03e0;
    CACTUS2[31] = 15'h03e0;
    CACTUS2[32] = 15'h03e0;
  end
  assign _15_ = CACTUS2[rom_y[5:0]];
  reg [14:0] CACTUS3 [32:0];
  initial begin
    CACTUS3[0] = 15'h01c0;
    CACTUS3[1] = 15'h03e0;
    CACTUS3[2] = 15'h03e0;
    CACTUS3[3] = 15'h03e0;
    CACTUS3[4] = 15'h33e2;
    CACTUS3[5] = 15'h7be7;
    CACTUS3[6] = 15'h7be7;
    CACTUS3[7] = 15'h7be7;
    CACTUS3[8] = 15'h7be7;
    CACTUS3[9] = 15'h7be7;
    CACTUS3[10] = 15'h7be7;
    CACTUS3[11] = 15'h7be7;
    CACTUS3[12] = 15'h7fe7;
    CACTUS3[13] = 15'h7fe7;
    CACTUS3[14] = 15'h3fe7;
    CACTUS3[15] = 15'h1fe7;
    CACTUS3[16] = 15'h03e7;
    CACTUS3[17] = 15'h03ff;
    CACTUS3[18] = 15'h03fe;
    CACTUS3[19] = 15'h03fc;
    CACTUS3[20] = 15'h03e0;
    CACTUS3[21] = 15'h03e0;
    CACTUS3[22] = 15'h03e0;
    CACTUS3[23] = 15'h03e0;
    CACTUS3[24] = 15'h03e0;
    CACTUS3[25] = 15'h03e0;
    CACTUS3[26] = 15'h03e0;
    CACTUS3[27] = 15'h03e0;
    CACTUS3[28] = 15'h03e0;
    CACTUS3[29] = 15'h03e0;
    CACTUS3[30] = 15'h03e0;
    CACTUS3[31] = 15'h03e0;
    CACTUS3[32] = 15'h03e0;
  end
  assign _16_ = CACTUS3[rom_y[5:0]];
  \$add  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd11),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd5),
    .Y_WIDTH(32'd12)
  ) _27_ (
    .A(cactus_x_q),
    .B(5'h1e),
    .Y(_03_)
  );
  \$sdffe  #(
    .CLK_POLARITY(32'd1),
    .EN_POLARITY(32'd1),
    .SRST_POLARITY(32'd0),
    .SRST_VALUE(2'h0),
    .WIDTH(32'd2)
  ) _28_ (
    .CLK(clk_i),
    .D(rand_i),
    .EN(_05_),
    .Q(cactus_image_q),
    .SRST(rst_ni)
  );
  \$sdffe  #(
    .CLK_POLARITY(32'd1),
    .EN_POLARITY(32'd1),
    .SRST_POLARITY(32'd0),
    .SRST_VALUE(11'h7e2),
    .WIDTH(32'd11)
  ) _29_ (
    .CLK(clk_i),
    .D(_00_),
    .EN(_06_),
    .Q(cactus_x_q),
    .SRST(rst_ni)
  );
  \$ne  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd2),
    .Y_WIDTH(32'd1)
  ) _30_ (
    .A({ off_screen, spawn_i }),
    .B(2'h2),
    .Y(_04_)
  );
  \$reduce_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd3),
    .Y_WIDTH(32'd1)
  ) _31_ (
    .A({ off_screen, spawn_i, next_frame_i }),
    .Y(_05_)
  );
  \$reduce_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .Y_WIDTH(32'd1)
  ) _32_ (
    .A({ _04_, next_frame_i }),
    .Y(_06_)
  );
  \$ge  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd11),
    .Y_WIDTH(32'd1)
  ) _33_ (
    .A(pixel_x_i),
    .B(cactus_x_q),
    .Y(_09_)
  );
  \$ge  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd9),
    .Y_WIDTH(32'd1)
  ) _34_ (
    .A(pixel_y_i),
    .B(9'h14e),
    .Y(_10_)
  );
  \$le  #(
    .A_SIGNED(32'd1),
    .A_WIDTH(32'd11),
    .B_SIGNED(32'd1),
    .B_WIDTH(32'd6),
    .Y_WIDTH(32'd1)
  ) _35_ (
    .A(cactus_x_q),
    .B(6'h22),
    .Y(off_screen)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _36_ (
    .A(_09_),
    .B(_11_),
    .Y(pixel_x_in_range)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _37_ (
    .A(_10_),
    .B(_12_),
    .Y(pixel_y_in_range)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _38_ (
    .A(pixel_x_in_range),
    .B(pixel_y_in_range),
    .Y(pixel_in_range)
  );
  \$lt  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd12),
    .Y_WIDTH(32'd1)
  ) _39_ (
    .A(pixel_x_i),
    .B(_03_),
    .Y(_11_)
  );
  \$lt  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd9),
    .Y_WIDTH(32'd1)
  ) _40_ (
    .A(pixel_y_i),
    .B(9'h190),
    .Y(_12_)
  );
  \$pmux  #(
    .S_WIDTH(32'd4),
    .WIDTH(32'd1)
  ) _41_ (
    .A(1'hx),
    .B({ _21_, _22_, _23_, _24_ }),
    .S({ _20_, _19_, _18_, _17_ }),
    .Y(_01_)
  );
  \$eq  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd2),
    .Y_WIDTH(32'd1)
  ) _42_ (
    .A(cactus_image_q),
    .B(2'h3),
    .Y(_17_)
  );
  \$eq  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd2),
    .Y_WIDTH(32'd1)
  ) _43_ (
    .A(cactus_image_q),
    .B(2'h2),
    .Y(_18_)
  );
  \$eq  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _44_ (
    .A(cactus_image_q),
    .B(1'h1),
    .Y(_19_)
  );
  \$logic_not  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd2),
    .Y_WIDTH(32'd1)
  ) _45_ (
    .A(cactus_image_q),
    .Y(_20_)
  );
  \$mux  #(
    .WIDTH(32'd1)
  ) _46_ (
    .A(1'h0),
    .B(_01_),
    .S(pixel_in_range),
    .Y(pixel_o)
  );
  \$mux  #(
    .WIDTH(32'd11)
  ) _47_ (
    .A(11'hxxx),
    .B(11'h280),
    .S(spawn_i),
    .Y(_02_)
  );
  \$mux  #(
    .WIDTH(32'd11)
  ) _48_ (
    .A(_07_[10:0]),
    .B(_02_),
    .S(off_screen),
    .Y(_00_)
  );
  \$shiftx  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd15),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _49_ (
    .A(_13_),
    .B(rom_x),
    .Y(_21_)
  );
  \$shiftx  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd15),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _50_ (
    .A(_14_),
    .B(rom_x),
    .Y(_22_)
  );
  \$shiftx  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd15),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _51_ (
    .A(_15_),
    .B(rom_x),
    .Y(_23_)
  );
  \$shiftx  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd15),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _52_ (
    .A(_16_),
    .B(rom_x),
    .Y(_24_)
  );
  \$sub  #(
    .A_SIGNED(32'd1),
    .A_WIDTH(32'd11),
    .B_SIGNED(32'd1),
    .B_WIDTH(32'd5),
    .Y_WIDTH(32'd11)
  ) _53_ (
    .A(cactus_x_q),
    .B(5'h08),
    .Y(_07_[10:0])
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd11),
    .Y_WIDTH(32'd12)
  ) _54_ (
    .A(pixel_x_i),
    .B(cactus_x_q),
    .Y({ _08_[30], _08_[9:0], _25_[0] })
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd4),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd10)
  ) _55_ (
    .A(4'he),
    .B(_08_[9:0]),
    .Y(rom_x)
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd9),
    .Y_WIDTH(32'd11)
  ) _56_ (
    .A(pixel_y_i),
    .B(9'h14e),
    .Y({ rom_y, _26_[0] })
  );
  assign _08_[29:10] = { _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30] };
  assign _08_[31] = 1'h0;
  assign _25_[31:1] = { _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[30], _08_[9:0] };
  assign _26_[31:1] = { rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y[9], rom_y };
  assign _sv2v_0 = 1'h0;
endmodule
