module counter24(
    input clk,
    input rstn,
    input enable,
    output reg[3:0] cntH,
    output reg[3:0] cntL
);

always @(posedge clk or negedge rstn) begin
    if(~rstn)
        {cntH,cntL} <= 8'b0;
    else if(enable) begin
        if((cntH>2)||(cntL>9)||((cntH==2)&&(cntL>3)))
            {cntH,cntL} <= 8'b0;
        else if((cntH==2)&&(cntL==3))
            {cntH,cntL} <= 8'b0;
        else if((cntH==2)&&(cntL<3)) begin
            cntH <= cntH;
            cntL <= cntL + 1'b1;
        end
        else if(cntL==9) begin 
            cntH <= cntH + 1'b1;
            cntL <= 1'b0;
        end
        else begin
            cntH <= cntH;
            cntL <= cntL + 1'b1;
        end
    end
end

endmodule