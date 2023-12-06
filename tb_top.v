 `timescale  1ps/1ps

module tb_top;

reg clk;
reg setHrKey;
reg setMinKey;
reg CtrlBell;    
reg rstn;
reg AdjMinKey;
reg AdjHrKey;
reg mode;
wire [7:0] dig;
wire [7:0] seg;
wire  alarm_beep;

initial begin
    rstn = 0;
    AdjMinKey = 0;
    AdjHrKey = 0;
    mode = 0;
    setHrKey = 0;
    setMinKey = 0;
    clk = 0;
    CtrlBell = 0;
    # 100 rstn = 1;
    forever begin
        #50 clk = ~clk;
    end
end


test_clock test_clock
(
	.clk(clk) ,	// input  clk
	.setHrKey(setHrKey) ,	// input  setHrKey
	.setMinKey(setMinKey) ,	// input  setMinKey
	.CtrlBell(CtrlBell) ,	// input  CtrlBell
	.rstn(rstn) ,	// input  rstn
	.AdjMinKey(AdjMinKey) ,	// input  AdjMinKey
	.AdjHrKey(AdjHrKey) ,	// input  AdjHrKey
	.mode(mode) ,	// input  mode
	.dig(dig) ,	// output [7:0] dig
	.seg(seg) ,	// output [7:0] seg
	.alarm_beep(alarm_beep) 	// output  alarm_beep
);



endmodule