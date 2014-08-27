// Copyright (C) 1991-2004 Altera Corporation
// Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
// support information,  device programming or simulation file,  and any other
// associated  documentation or information  provided by  Altera  or a partner
// under  Altera's   Megafunction   Partnership   Program  may  be  used  only
// to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
// other  use  of such  megafunction  design,  netlist,  support  information,
// device programming or simulation file,  or any other  related documentation
// or information  is prohibited  for  any  other purpose,  including, but not
// limited to  modification,  reverse engineering,  de-compiling, or use  with
// any other  silicon devices,  unless such use is  explicitly  licensed under
// a separate agreement with  Altera  or a megafunction partner.  Title to the
// intellectual property,  including patents,  copyrights,  trademarks,  trade
// secrets,  or maskworks,  embodied in any such megafunction design, netlist,
// support  information,  device programming or simulation file,  or any other
// related documentation or information provided by  Altera  or a megafunction
// partner, remains with Altera, the megafunction partner, or their respective
// licensors. No other licenses, including any licenses needed under any third
// party's intellectual property, are provided herein.

module main(
	Clock,
	SW2,
	SW1,
	SW0,
	F_in,
	over_alarm,
	dp,
	disp_data,
	disp_select
);

input	Clock;
input	SW2;
input	SW1;
input	SW0;
input	F_in;
output	over_alarm;
output	dp;
output	[6:0] disp_data;
output	[5:0] disp_select;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_32;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	[3:0] SYNTHESIZED_WIRE_34;
wire	[3:0] SYNTHESIZED_WIRE_35;
wire	[3:0] SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[3:0] SYNTHESIZED_WIRE_16;
wire	[2:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_24;
wire	[3:0] SYNTHESIZED_WIRE_25;
wire	[3:0] SYNTHESIZED_WIRE_26;
wire	[3:0] SYNTHESIZED_WIRE_27;
wire	[3:0] SYNTHESIZED_WIRE_28;
wire	[3:0] SYNTHESIZED_WIRE_29;
wire	[3:0] SYNTHESIZED_WIRE_30;

assign	over_alarm = SYNTHESIZED_WIRE_15;




counter	b2v_inst(.EN(SYNTHESIZED_WIRE_0),
.CLR(SYNTHESIZED_WIRE_1),.F_IN(F_in),.F_OUT(SYNTHESIZED_WIRE_15),.Q0(SYNTHESIZED_WIRE_32),.Q1(SYNTHESIZED_WIRE_33),.Q2(SYNTHESIZED_WIRE_34),.Q3(SYNTHESIZED_WIRE_35),.Q4(SYNTHESIZED_WIRE_36),.Q5(SYNTHESIZED_WIRE_37));

fdiv	b2v_inst1(.clk(Clock),
.f1hz(SYNTHESIZED_WIRE_9),.f10hz(SYNTHESIZED_WIRE_10),.f100hz(SYNTHESIZED_WIRE_11),.f1khz(SYNTHESIZED_WIRE_24));

flip_latch	b2v_inst2(.clk(SYNTHESIZED_WIRE_2),
.A0(SYNTHESIZED_WIRE_32),.A1(SYNTHESIZED_WIRE_33),.A2(SYNTHESIZED_WIRE_34),.A3(SYNTHESIZED_WIRE_35),.A4(SYNTHESIZED_WIRE_36),.A5(SYNTHESIZED_WIRE_37),.Q0(SYNTHESIZED_WIRE_25),.Q1(SYNTHESIZED_WIRE_26),.Q2(SYNTHESIZED_WIRE_27),.Q3(SYNTHESIZED_WIRE_28),.Q4(SYNTHESIZED_WIRE_29),.Q5(SYNTHESIZED_WIRE_30));

gate_control	b2v_inst3(.SW0(SW0),
.SW1(SW1),.SW2(SW2),.f1hz(SYNTHESIZED_WIRE_9),.f10hz(SYNTHESIZED_WIRE_10),.f100hz(SYNTHESIZED_WIRE_11),.Latch_EN(SYNTHESIZED_WIRE_2),.Counter_Clr(SYNTHESIZED_WIRE_1),.Counter_EN(SYNTHESIZED_WIRE_0),.dp_s1hz(SYNTHESIZED_WIRE_12),.dp_s10hz(SYNTHESIZED_WIRE_13),.dp_s100hz(SYNTHESIZED_WIRE_14));

dispdecoder	b2v_inst5(.dp_s1hz(SYNTHESIZED_WIRE_12),
.dp_s10hz(SYNTHESIZED_WIRE_13),.dp_s100hz(SYNTHESIZED_WIRE_14),.counter_out(SYNTHESIZED_WIRE_15),.data_in(SYNTHESIZED_WIRE_16),.disp_select(SYNTHESIZED_WIRE_38),.Q0(SYNTHESIZED_WIRE_32),.Q1(SYNTHESIZED_WIRE_33),.Q2(SYNTHESIZED_WIRE_34),.Q3(SYNTHESIZED_WIRE_35),.Q4(SYNTHESIZED_WIRE_36),.Q5(SYNTHESIZED_WIRE_37),.dp(dp),.data_out(disp_data));

dispselect	b2v_inst7(.clk(SYNTHESIZED_WIRE_24),
.disp_select(SYNTHESIZED_WIRE_38),.Q(disp_select));

data_mux	b2v_inst8(.A0(SYNTHESIZED_WIRE_25),
.A1(SYNTHESIZED_WIRE_26),.A2(SYNTHESIZED_WIRE_27),.A3(SYNTHESIZED_WIRE_28),.A4(SYNTHESIZED_WIRE_29),.A5(SYNTHESIZED_WIRE_30),.disp_select(SYNTHESIZED_WIRE_38),.Q(SYNTHESIZED_WIRE_16));


endmodule
