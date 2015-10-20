/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  angle_to_XY_tb.sv
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module angle_to_XY_tb;

bit		clock,rst_n;

clock_rst_verb #(
	.ACTIVE			(0		)
)clk_rst_inst(
	.clock			(clock		),
	.rst_x			(rst_n		)
);

localparam	DSIZE	= 16;
localparam	ISIZE	= 10;

logic [DSIZE-1:0]	angle;
logic [DSIZE-1:0]	X,Y;

angle_to_XY_verb #(
	.DSIZE		(DSIZE		),
	.ISIZE		(ISIZE      )
)angle_to_XY_inst(
/*	input				*/	.clock 		(clock		),
/*	input [DSIZE-1:0]	*/	.Angle      (angle      ),
/*	output[DSIZE-1:0]	*/	.X          (X          ),
/*	output[DSIZE-1:0]	*/	.Y	        (Y          )
);

initial begin
	angle	= 70*(2**DSIZE)/90;
end

endmodule
