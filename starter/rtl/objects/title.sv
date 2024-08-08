module title(pixel_x_i, pixel_y_i, pixel_o);
  wire [31:0] _00_;
  wire [31:0] _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire [46:0] _06_;
  wire _07_;
  wire [31:0] _08_;
  wire [31:0] _09_;
  wire _sv2v_0;
  wire pixel_in_range;
  output pixel_o;
  wire pixel_o;
  input [9:0] pixel_x_i;
  wire [9:0] pixel_x_i;
  wire pixel_x_in_range;
  input [9:0] pixel_y_i;
  wire [9:0] pixel_y_i;
  wire pixel_y_in_range;
  wire [9:0] rom_x;
  wire [9:0] rom_y;
  reg [46:0] TITLE [6:0];
  initial begin
    TITLE[0] = 47'h78cf1f078c9e;
    TITLE[1] = 47'h64cc99064c99;
    TITLE[2] = 47'h64cc99064c99;
    TITLE[3] = 47'h64cc99078c99;
    TITLE[4] = 47'h64cc99064c99;
    TITLE[5] = 47'h64cc99064c99;
    TITLE[6] = 47'h78cc9f064f19;
  end
  assign _06_ = TITLE[rom_y[2:0]];
  \$div  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd32),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd4),
    .Y_WIDTH(32'd32)
  ) _10_ (
    .A({ _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[9:0] }),
    .B(4'hd),
    .Y(_00_)
  );
  \$div  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd32),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd4),
    .Y_WIDTH(32'd32)
  ) _11_ (
    .A({ _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[9:0] }),
    .B(4'hd),
    .Y({ _01_[31:10], rom_y })
  );
  \$ge  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd4),
    .Y_WIDTH(32'd1)
  ) _12_ (
    .A(pixel_x_i),
    .B(4'he),
    .Y(_02_)
  );
  \$ge  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd7),
    .Y_WIDTH(32'd1)
  ) _13_ (
    .A(pixel_y_i),
    .B(7'h46),
    .Y(_03_)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _14_ (
    .A(_02_),
    .B(_04_),
    .Y(pixel_x_in_range)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _15_ (
    .A(_03_),
    .B(_05_),
    .Y(pixel_y_in_range)
  );
  \$logic_and  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd1),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd1),
    .Y_WIDTH(32'd1)
  ) _16_ (
    .A(pixel_x_in_range),
    .B(pixel_y_in_range),
    .Y(pixel_in_range)
  );
  \$lt  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _17_ (
    .A(pixel_x_i),
    .B(10'h271),
    .Y(_04_)
  );
  \$lt  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd8),
    .Y_WIDTH(32'd1)
  ) _18_ (
    .A(pixel_y_i),
    .B(8'ha1),
    .Y(_05_)
  );
  \$mux  #(
    .WIDTH(32'd1)
  ) _19_ (
    .A(1'h0),
    .B(_07_),
    .S(pixel_in_range),
    .Y(pixel_o)
  );
  \$shiftx  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd47),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd1)
  ) _20_ (
    .A(_06_),
    .B(rom_x),
    .Y(_07_)
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd4),
    .Y_WIDTH(32'd11)
  ) _21_ (
    .A(pixel_x_i),
    .B(4'he),
    .Y({ _08_[31], _08_[9:0] })
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd6),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd10),
    .Y_WIDTH(32'd10)
  ) _22_ (
    .A(6'h2e),
    .B(_00_[9:0]),
    .Y(rom_x)
  );
  \$sub  #(
    .A_SIGNED(32'd0),
    .A_WIDTH(32'd10),
    .B_SIGNED(32'd0),
    .B_WIDTH(32'd7),
    .Y_WIDTH(32'd11)
  ) _23_ (
    .A(pixel_y_i),
    .B(7'h46),
    .Y({ _09_[31], _09_[9:0] })
  );
  assign _01_[9:0] = rom_y;
  assign _08_[30:10] = { _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31], _08_[31] };
  assign _09_[30:10] = { _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31], _09_[31] };
  assign _sv2v_0 = 1'h0;
endmodule
