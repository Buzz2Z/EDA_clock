module counter60(
    input clk,
    input rstn,
    input enable,
    output reg[3:0] cntH,
    output reg[3:0] cntL,
	output wire next_enable
);

always @(posedge clk or negedge rstn) begin
    if(~rstn)
        {cntH,cntL} <= 8'b0;
    else if(enable) begin
        if((cntH>6)||(cntL>9)) 
            {cntH, cntL} <= 8'b0;
        else if((cntH==5)&&(cntL==9))
            {cntH, cntL} <= 8'b0;
        else if(cntL==9) begin 
            cntH <= cntH + 1;
            cntL <= 1'b0;
        end
        else begin 
            cntH <= cntH;
            cntL <= cntL + 1'b1;
        end
    end
end


assign next_enable = (((cntH == 5) && (cntL == 9))? 1'b1 : 1'b0) & enable;

endmodule