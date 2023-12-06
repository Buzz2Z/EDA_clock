module clock_part(
    input   clk,
    input   enable,
    input   rstn,
    
    input   AdjMinKey,
    input   AdjHrKey,
    
    input   clk_1Hz,
    
    output   wire [3:0]     h_cntH,
    output   wire [3:0]     h_cntL,
    output   wire [3:0]     m_cntH,
    output   wire [3:0]     m_cntL,
    output   wire [3:0]     s_cntH,
    output   wire [3:0]     s_cntL
);

wire enable_seconds;
wire enable_mintues;

wire carry_seconds;
wire carry_mintues;


counter60 counter_seconds(
    .clk(clk),
    .rstn(rstn),
    .enable(enable),
    .cntH(s_cntH),
    .cntL(s_cntL),
    .next_enable(carry_seconds)
);

counter60 counter_mintues(
    .clk(clk),
    .rstn(rstn),
    .enable(enable_mintues),
    .cntH(m_cntH),
    .cntL(m_cntL),
    .next_enable(carry_mintues)
);

counter24 counter_hours(
    .clk(clk),
    .rstn(rstn),
    .enable(enable_hours),
    .cntH(h_cntH),
    .cntL(h_cntL)
);

assign enable_seconds = enable; 
assign enable_mintues = AdjMinKey ? clk_1Hz : carry_seconds;    
assign enable_hours = AdjHrKey ? clk_1Hz : carry_mintues;

endmodule