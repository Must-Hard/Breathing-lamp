`timescale 1ns / 1ns

module tb_duty_gen;

reg	clk;
reg	rst;

wire	[15:0]	duty;

initial begin
	clk = 0;
	rst = 0;
	#200
	rst = 1;
end
always#10 clk = ~clk;
duty_gen	duty_gen_inst(
	.clk		(clk	),
	.rst		(rst	),
                 
	.duty	    (duty	)
);
endmodule
