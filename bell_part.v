module bell_part(
	input setHrKey,
    input setMinKey,

    input CtrlBell,

    input clk_1kHz,
    input clk_500Hz,
    input clk_1Hz,


	input     [3:0]     h_cntH,
    input     [3:0]     h_cntL,
    input     [3:0]     m_cntH,
	input     [3:0]     m_cntL,
    input     [3:0]     s_cntH,
    input     [3:0]     s_cntL,


    output         alarm_clock,
    output    [7:0]     set_hr,
    output    [7:0]     set_min
);

supply1 Vdd;
wire HrH_EQU, HrL_EQU, MinH_EQU, MinL_EQU;
wire Time_EQU;

counter60  SU1(
    .clk(clk_1Hz),
    .enable(setHrKey),
    .rstn(Vdd),
    .cntH(set_hr[7:4]),
    .cntL(set_hr[3:0]),
);

counter24 SU2(
    .clk(clk_1Hz),
    .enable(setMinKey),
    .rstn(Vdd),
    .cntH(set_min[7:4]),
    .cntL(set_min[3:0])
);

N_bitcomparator C1(
    .equate(HrH_EQU),
    .A(set_hr[7:4]),
    .B(h_cntH)
);


N_bitcomparator C2(
    .equate(HrL_EQU),
    .A(set_hr[3:0]),
    .B(h_cntL)
);

N_bitcomparator C3(
    .equate(MinH_EQU),
    .A(set_min[7:4]),
    .B(m_cntH)
);

N_bitcomparator C4(
    .equate(MinL_EQU),
    .A(set_min[3:0]),
    .B(m_cntL)
);

assign Time_EQU = (HrH_EQU && HrL_EQU && MinH_EQU && MinL_EQU);
assign alarm_clock = CtrlBell ? (Time_EQU && (((s_cntL[0]==1'b1) && clk_500Hz) || ((s_cntL[0] == 1'b0) && clk_1kHz))) : 1'b1;

endmodule