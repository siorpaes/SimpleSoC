//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Jan 20 10:32:38 2022
//Host        : AGRCWD8123 running 64-bit major release  (build 9200)
//Command     : generate_target SimpleSoC_wrapper.bd
//Design      : SimpleSoC_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SimpleSoC_wrapper
   (reset,
    reset_0,
    sys_clock);
  input reset;
  input reset_0;
  input sys_clock;

  wire reset;
  wire reset_0;
  wire sys_clock;

  SimpleSoC SimpleSoC_i
       (.reset(reset),
        .reset_0(reset_0),
        .sys_clock(sys_clock));
endmodule
