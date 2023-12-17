module buzz_generator(clk, rstn, enable); 
	input clk, rstn;
	output enable;
	
	parameter N = 50000;
	parameter W = 16;

	reg		    r_enable;
	reg [W-1 :0] cnt_reg;
	
	always@(posedge clk or negedge rstn)
	begin
		if (!rstn) begin
			cnt_reg <= 0;
			r_enable = 0;
		end
		else if (cnt_reg == N-1) begin
			cnt_reg <= 0;
			r_enable = ~r_enable;
		end
		else
			cnt_reg <= cnt_reg + 1'b1;
	end

assign enable = r_enable;

endmodule
 