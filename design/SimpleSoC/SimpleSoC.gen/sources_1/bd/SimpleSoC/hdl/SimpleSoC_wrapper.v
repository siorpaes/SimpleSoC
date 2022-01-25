//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Tue Jan 25 17:48:33 2022
//Host        : AGRCWD8123 running 64-bit major release  (build 9200)
//Command     : generate_target SimpleSoC_wrapper.bd
//Design      : SimpleSoC_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SimpleSoC_wrapper
   (CLKRESET,
    EXTRESET,
    HALTED,
    LOCKUP,
    RESET,
    SWDCLK,
    SWDIO,
    led_4bits_tri_io,
    sys_clock);
  input CLKRESET;
  input EXTRESET;
  output HALTED;
  output LOCKUP;
  input RESET;
  input SWDCLK;
  inout SWDIO;
  inout [3:0]led_4bits_tri_io;
  input sys_clock;

  wire CLKRESET;
  wire EXTRESET;
  wire HALTED;
  wire LOCKUP;
  wire RESET;
  wire SWDCLK;
  wire SWDIO;
  wire [0:0]led_4bits_tri_i_0;
  wire [1:1]led_4bits_tri_i_1;
  wire [2:2]led_4bits_tri_i_2;
  wire [3:3]led_4bits_tri_i_3;
  wire [0:0]led_4bits_tri_io_0;
  wire [1:1]led_4bits_tri_io_1;
  wire [2:2]led_4bits_tri_io_2;
  wire [3:3]led_4bits_tri_io_3;
  wire [0:0]led_4bits_tri_o_0;
  wire [1:1]led_4bits_tri_o_1;
  wire [2:2]led_4bits_tri_o_2;
  wire [3:3]led_4bits_tri_o_3;
  wire [0:0]led_4bits_tri_t_0;
  wire [1:1]led_4bits_tri_t_1;
  wire [2:2]led_4bits_tri_t_2;
  wire [3:3]led_4bits_tri_t_3;
  wire sys_clock;

  SimpleSoC SimpleSoC_i
       (.CLKRESET(CLKRESET),
        .EXTRESET(EXTRESET),
        .HALTED(HALTED),
        .LOCKUP(LOCKUP),
        .RESET(RESET),
        .SWDCLK(SWDCLK),
        .SWDIO(SWDIO),
        .led_4bits_tri_i({led_4bits_tri_i_3,led_4bits_tri_i_2,led_4bits_tri_i_1,led_4bits_tri_i_0}),
        .led_4bits_tri_o({led_4bits_tri_o_3,led_4bits_tri_o_2,led_4bits_tri_o_1,led_4bits_tri_o_0}),
        .led_4bits_tri_t({led_4bits_tri_t_3,led_4bits_tri_t_2,led_4bits_tri_t_1,led_4bits_tri_t_0}),
        .sys_clock(sys_clock));
  IOBUF led_4bits_tri_iobuf_0
       (.I(led_4bits_tri_o_0),
        .IO(led_4bits_tri_io[0]),
        .O(led_4bits_tri_i_0),
        .T(led_4bits_tri_t_0));
  IOBUF led_4bits_tri_iobuf_1
       (.I(led_4bits_tri_o_1),
        .IO(led_4bits_tri_io[1]),
        .O(led_4bits_tri_i_1),
        .T(led_4bits_tri_t_1));
  IOBUF led_4bits_tri_iobuf_2
       (.I(led_4bits_tri_o_2),
        .IO(led_4bits_tri_io[2]),
        .O(led_4bits_tri_i_2),
        .T(led_4bits_tri_t_2));
  IOBUF led_4bits_tri_iobuf_3
       (.I(led_4bits_tri_o_3),
        .IO(led_4bits_tri_io[3]),
        .O(led_4bits_tri_i_3),
        .T(led_4bits_tri_t_3));
endmodule
