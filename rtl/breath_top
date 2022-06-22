
module breath_top(
	input			clk		,
	input			rst		,
	
	output			led			//pwm输出到led灯上
);

wire	[15:0]duty;
//pwm模块例化
pwm			pwm_inst(
	.clk		(clk),
	.rst		(rst),
	.duty		(duty),

	.pwm        (led)
);
//duty_gen模块例化
duty_gen	duty_gen_inst(
	.clk		(clk),
	.rst		(rst),

	.duty	    (duty)
);
endmodule
