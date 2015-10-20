/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  circular_LUT.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module circular_LUT #(
	parameter	DSIZE	= 16
)(
	input [4:0]			I		,
	output[DSIZE-1:0]	Dz	
);

localparam [DSIZE-1:0]	
	  Z00		=  45.000000000000000 * (2**DSIZE)/90,  
      Z01		=  26.565051177077990 * (2**DSIZE)/90,
      Z02		=  14.036243467926477 * (2**DSIZE)/90,
      Z03		=   7.125016348901798 * (2**DSIZE)/90,
      Z04		=   3.576334374997352 * (2**DSIZE)/90,
      Z05		=   1.789910608246069 * (2**DSIZE)/90,
      Z06		=   0.895173710211074 * (2**DSIZE)/90,
      Z07		=   0.447614170860553 * (2**DSIZE)/90,
      Z08		=   0.223810500368538 * (2**DSIZE)/90,
      Z09		=   0.111905677066207 * (2**DSIZE)/90,
      Z10		=   0.055952891893804 * (2**DSIZE)/90,
      Z11		=   0.027976452617004 * (2**DSIZE)/90,
      Z12		=   0.013988227142265 * (2**DSIZE)/90,
      Z13		=   0.006994113675353 * (2**DSIZE)/90,
      Z14		=   0.003497056850704 * (2**DSIZE)/90,
      Z15		=   0.001748528426980 * (2**DSIZE)/90,
      Z16		=   0.000874264213694 * (2**DSIZE)/90,
      Z17		=   0.000437132106872 * (2**DSIZE)/90,
      Z18		=   0.000218566053439 * (2**DSIZE)/90,
      Z19		=   0.000109283026720 * (2**DSIZE)/90,
      Z20		=   0.000054641513360 * (2**DSIZE)/90,
      Z21		=   0.000027320756680 * (2**DSIZE)/90,
      Z22		=   0.000013660378340 * (2**DSIZE)/90,
      Z23		=   0.000006830189170 * (2**DSIZE)/90,
      Z24		=   0.000003415094585 * (2**DSIZE)/90,
      Z25		=   0.000001707547293 * (2**DSIZE)/90,
      Z26		=   0.000000853773646 * (2**DSIZE)/90,
      Z27		=   0.000000426886823 * (2**DSIZE)/90,
      Z28		=   0.000000213443412 * (2**DSIZE)/90,
      Z29		=   0.000000106721706 * (2**DSIZE)/90,
      Z30		=   0.000000053360853 * (2**DSIZE)/90,
      Z31		=   0.000000026680426 * (2**DSIZE)/90;

wire [DSIZE-1:0]	D [31:0];
assign	D[00]	= Z00	;
assign	D[01]	= Z01	;
assign	D[02]	= Z02	;
assign	D[03]	= Z03	;
assign	D[04]	= Z04	;
assign	D[05]	= Z05	;
assign	D[06]	= Z06	;
assign	D[07]	= Z07	;
assign	D[08]	= Z08	;
assign	D[09]	= Z09	;
assign	D[10]	= Z10	;
assign	D[11]	= Z11	;
assign	D[12]	= Z12	;
assign	D[13]	= Z13	;
assign	D[14]	= Z14	;
assign	D[15]	= Z15	;
assign	D[16]	= Z16	;
assign	D[17]	= Z17	;
assign	D[18]	= Z18	;
assign	D[19]	= Z19	;
assign	D[20]	= Z20	;
assign	D[21]	= Z21	;
assign	D[22]	= Z22	;
assign	D[23]	= Z23	;
assign	D[24]	= Z24	;
assign	D[25]	= Z25	;
assign	D[26]	= Z26	;
assign	D[27]	= Z27	;
assign	D[28]	= Z28	;
assign	D[29]	= Z29	;
assign	D[30]	= Z30	;
assign	D[31]	= Z31	; 

assign	Dz	= D[I];

endmodule
