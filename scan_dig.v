module scan_dig(		//7段数码管动态扫描模块
	input	clk, 
	input	rstn, 
	input	enable,				
	input 	[3:0] 		h_cntH,
    input 	[3:0] 		h_cntL,
    input 	[3:0] 		m_cntH,
    input 	[3:0] 		m_cntL,
    input 	[3:0] 		s_cntH,
    input 	[3:0] 		s_cntL,

	input	[7:0]		set_h,
	input 	[7:0]		set_m,

	input 				mode,

	output	wire[7:0]	dig,			
	output	wire[7:0] 	seg				
);

	reg 	[7:0] 	seg_r;							
	reg 	[7:0] 	dig_r;							
	reg 	[3:0] 	disp_dat;						
	reg 	[2:0] 	count;		//control the dig from no.1 ~ no.6							

	assign dig = dig_r;						
	assign seg = seg_r;							

	//数码管点亮选择计数器
	always @(posedge clk or negedge rstn)   			
	begin
		if (!rstn)
			count <= 3'b0;	
		else if (enable) begin 
			if(mode == 0) begin
				if(count >= 3'd5)
					count <= 3'b0;
				else
					count <= count + 1'b1;
			end
			else begin
				if(count >= 2'd3)
					count <= 2'b0;
				else
					count <= count + 1'b1;
			end
		end
	end

	//根据数码管点亮选择计数器确定待显示的数值及数码管选择信号
	always @(count or h_cntH or h_cntL or m_cntH or m_cntL or s_cntH or s_cntL or mode or rstn)   						
	begin

		if(rstn == 0)
			dig_r = 8'b1111_1111;
		else if(mode == 0)
		begin
			case(count)							
			3'd0:
				begin
					disp_dat = h_cntH;			//hour h
					dig_r = 8'b1101_1111;
				end
			3'd1: 
				begin
					disp_dat = h_cntL;			//hour l
					dig_r = 8'b1110_1111;
				end 	
			3'd2: 
				begin
					disp_dat = m_cntH;			//mintue h
					dig_r = 8'b1111_0111;
				end 	
			3'd3: 
				begin
					disp_dat = m_cntL;			//mintue l
					dig_r = 8'b1111_1011;
				end 	
			3'd4: 
				begin
					disp_dat = s_cntH;			//second h
					dig_r = 8'b1111_1101;
				end 	
			3'd5: 
				begin
					disp_dat = s_cntL;			//second l
					dig_r = 8'b1111_1110;
				end 	
			default: 
				begin
					disp_dat = 4'hx;		    //default
					dig_r = 8'hxx;
				end
			endcase
		end

		else
		begin
			case(count)							
			3'd0:
				begin
					disp_dat = set_h[7:4];			//hour h
					dig_r = 8'b1111_0111;
				end
			3'd1: 
				begin
					disp_dat = set_h[3:0];			//hour l
					dig_r = 8'b1111_1011;
				end 	
			3'd2: 
				begin
					disp_dat = set_m[7:4];			//mintue h
					dig_r = 8'b1111_1101;
				end 	
			3'd3: 
				begin
					disp_dat = set_m[3:0];			//mintue l
					dig_r = 8'b1111_1110;
				end 	
			default: 
				begin
					disp_dat = 4'hx;		    //default
					dig_r = 8'hxx;
				end
			endcase
		end
	end

	// 七段数码管译码
	always @(disp_dat)
	begin
		case(disp_dat)					
			4'h0:		seg_r = 8'h3f;				//0
			4'h1:		seg_r = 8'h06;				//1
			4'h2:		seg_r = 8'h5b;				//2
			4'h3:		seg_r = 8'h4f;				//3
			4'h4:		seg_r = 8'h66;				//4
			4'h5:		seg_r = 8'h6d;				//5
			4'h6:		seg_r = 8'h7d;				//6
			4'h7:		seg_r = 8'h07;				//7
			4'h8:		seg_r = 8'h7f;				//8
			4'h9:		seg_r = 8'h6f;				//9
			4'ha:		seg_r = 8'h77;				//a
			4'hb:		seg_r = 8'h7c;				//b
			4'hc:		seg_r = 8'h39;				//c
			4'hd:		seg_r = 8'h5e;				//d
			4'he:		seg_r = 8'h79;				//e
			4'hf:		seg_r = 8'h71;				//f
			default: 	seg_r = 8'hFF;
		endcase
	end
endmodule