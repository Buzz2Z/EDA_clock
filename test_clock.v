// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
// CREATED		"Wed Dec 06 19:51:58 2023"

module test_clock(
	clk,
	setHrKey,
	setMinKey,
	CtrlBell,
	rstn,
	AdjMinKey,
	AdjHrKey,
	mode,
	alarm,
	radio,
	dig,
	seg
);


input wire	clk;
input wire	setHrKey;
input wire	setMinKey;
input wire	CtrlBell;
input wire	rstn;
input wire	AdjMinKey;
input wire	AdjHrKey;
input wire	mode;
output wire	alarm;
output wire	radio;
output wire	[7:0] dig;
output wire	[7:0] seg;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	[3:0] SYNTHESIZED_WIRE_34;
wire	[3:0] SYNTHESIZED_WIRE_35;
wire	[3:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_37;
wire	[3:0] SYNTHESIZED_WIRE_38;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;





clock_part	b2v_inst(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_0),
	.rstn(SYNTHESIZED_WIRE_31),
	.AdjMinKey(AdjMinKey),
	.AdjHrKey(AdjHrKey),
	.clk_1Hz(SYNTHESIZED_WIRE_32),
	.h_cntH(SYNTHESIZED_WIRE_37),
	.h_cntL(SYNTHESIZED_WIRE_38),
	.m_cntH(SYNTHESIZED_WIRE_33),
	.m_cntL(SYNTHESIZED_WIRE_34),
	.s_cntH(SYNTHESIZED_WIRE_35),
	.s_cntL(SYNTHESIZED_WIRE_36));


clk_en_generator	b2v_inst1(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst1.N = 50000;
	defparam	b2v_inst1.W = 16;


clk_en_generator	b2v_inst10(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst10.N = 1000000;
	defparam	b2v_inst10.W = 23;


clk_en_generator	b2v_inst11(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst11.N = 50000;
	defparam	b2v_inst11.W = 16;


radio_part	b2v_inst2(
	
	
	.m_cntH(SYNTHESIZED_WIRE_33),
	.m_cntL(SYNTHESIZED_WIRE_34),
	.s_cntH(SYNTHESIZED_WIRE_35),
	.s_cntL(SYNTHESIZED_WIRE_36),
	.alarm(radio));


scan_dig	b2v_inst3(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_11),
	.mode(mode),
	.h_cntH(SYNTHESIZED_WIRE_37),
	.h_cntL(SYNTHESIZED_WIRE_38),
	.m_cntH(SYNTHESIZED_WIRE_33),
	.m_cntL(SYNTHESIZED_WIRE_34),
	.s_cntH(SYNTHESIZED_WIRE_35),
	.s_cntL(SYNTHESIZED_WIRE_36),
	.set_h(SYNTHESIZED_WIRE_18),
	.set_m(SYNTHESIZED_WIRE_19),
	.dig(dig),
	.seg(seg));

assign	SYNTHESIZED_WIRE_31 =  ~rstn;


bell_part	b2v_inst7(
	.setHrKey(setHrKey),
	.setMinKey(setMinKey),
	.CtrlBell(CtrlBell),
	.clk_1kHz(SYNTHESIZED_WIRE_20),
	.clk_500Hz(SYNTHESIZED_WIRE_21),
	.clk_1Hz(SYNTHESIZED_WIRE_32),
	.h_cntH(SYNTHESIZED_WIRE_37),
	.h_cntL(SYNTHESIZED_WIRE_38),
	.m_cntH(SYNTHESIZED_WIRE_33),
	.m_cntL(SYNTHESIZED_WIRE_34),
	.s_cntH(SYNTHESIZED_WIRE_35),
	.s_cntL(SYNTHESIZED_WIRE_36),
	.alarm_clock(alarm),
	.set_hr(SYNTHESIZED_WIRE_18),
	.set_min(SYNTHESIZED_WIRE_19));


clk_en_generator	b2v_inst8(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst8.N = 100000;
	defparam	b2v_inst8.W = 17;


clk_en_generator	b2v_inst9(
	.clk(clk),
	.rstn(SYNTHESIZED_WIRE_31),
	.enable(SYNTHESIZED_WIRE_32));
	defparam	b2v_inst9.N = 50000000;
	defparam	b2v_inst9.W = 26;


endmodule
