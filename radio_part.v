module radio_part(
    input               clk_1kHz,
    input               clk_500Hz,
    input     [3:0]     m_cntH,
	input     [3:0]     m_cntL,
    input     [3:0]     s_cntH,
    input     [3:0]     s_cntL,
    output    reg       alarm
);

wire    [7:0]     mintue;
wire    [7:0]     second;


assign mintue = {m_cntH, m_cntL};
assign second = {s_cntH, s_cntL};


always @(mintue or second) begin
    if(mintue == 8'h59) begin
        case(second)
        8'h51:
            alarm = clk_500Hz;
        8'h53:
            alarm = clk_500Hz;
        8'h55:
            alarm = clk_500Hz;
        8'h57:
            alarm = clk_1kHz;
        default:
            alarm = 1'b0;
        endcase
    end
    else
        alarm = 1'b0;
end


endmodule
