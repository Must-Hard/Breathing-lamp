/*
	功能：生成频率为1KHz的PWM波 1ms
*/
module pwm(
	input			clk		,
	input			rst		,
	input	[15:0]	duty	,
	
	output	reg		pwm			//输出PWM波
);
parameter	MAX_1MS = 16'd50000;
reg	[15:0] cnt_1ms;//1ms计数器

//1ms计数器实现
always@(posedge clk or negedge rst)begin
	if(~rst)begin
		cnt_1ms <= 16'd0;
	end
	else begin
		if(cnt_1ms == MAX_1MS - 1'b1)begin
			cnt_1ms <= 16'd0;
		end
		else begin
			cnt_1ms <= cnt_1ms + 16'd1;
		end
	end
end
//根据占空比产生PWM波
always@(posedge clk or negedge rst)begin
	if(~rst)begin
		pwm <= 1'b0;
	end
	else begin
		if(cnt_1ms < duty)begin
			pwm <= 1'b1;
		end
		else begin
			pwm <= 1'b0;
		end
	end
end

endmodule 
