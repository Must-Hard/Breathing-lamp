`timescale 1ns / 1ns

module tb_pwm;

reg		clk;
reg		rst;

wire	led;

initial begin
	clk = 0;
	rst = 0;
	#200
	rst = 1;
end
always#10 clk = ~clk;

pwm			pwm_inst(
	.clk		(clk),
	.rst		(rst),
	.duty		(16'd10000),//20% 

	.pwm        (led)
);
endmodule
