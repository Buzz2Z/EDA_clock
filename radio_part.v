module radio_part(
    input     clk_1kHz,
    input     clk_500Hz,
    input     [3:0]     m_cntH,
	 input     [3:0]     m_cntL,
    input     [3:0]     s_cntH,
    input     [3:0]     s_cntL,
    output    wire      alarm
);

wire    [7:0]     mintue;
wire    [7:0]     second;

reg     alarm_reg;

assign mintue = {m_cntH, m_cntL};
assign second = {s_cntH, s_cntL};
assign alarm = alarm_reg;

always @(mintue or second) begin
    if(mintue == 8'h59) begin
        case(second)
        8'h55,
        8'h56,
        8'h57,
        8'h58:
            alarm_reg = clk_500Hz;
        8'h59:
            alarm_reg = clk_1kHz;
        default:
            alarm_reg = 1'b0;
        endcase
    end
end

endmodule
