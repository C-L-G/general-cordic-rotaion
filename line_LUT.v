/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  line_LUT.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module line_LUT #(
	parameter	DSIZE	= 16
)(
	input [4:0]				I,
	output[DSIZE-1:0]		Dz
);

assign	Dz	= (2**(DSIZE-1)) >> I;

endmodule


