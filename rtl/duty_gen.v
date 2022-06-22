/*
	每100ms duty改变一次 
*/
module duty_gen(
	input				clk		,
	input				rst		,
	
	output	reg[15:0]	duty	//输出的占空比
);
parameter	MAX_100MS = 23'd500_0000;
//parameter	MAX_100MS = 23'd500;//测试用
reg	[22:0]	cnt_100ms;

//100ms计数器实现
always@(posedge clk or negedge rst)begin
	if(~rst)begin
		cnt_100ms <= 23'd0;
	end
	else begin
		if(cnt_100ms == MAX_100MS - 1'b1)begin
			cnt_100ms <= 23'd0;
		end
		else begin
			cnt_100ms <= cnt_100ms + 23'd1;
		end
	end
end
//改变占空比
always@(posedge clk or negedge rst)begin
	if(~rst)begin
		duty <= 16'd50000;
	end
	else begin
		if(cnt_100ms == MAX_100MS - 1'b1)begin
			if(duty == 16'd0)begin
				duty <= 16'd50000;
			end
			else begin
				duty <= duty - 16'd5000;
			end
		end
		else begin
			duty <= duty;
		end
	end
end
endmodule
