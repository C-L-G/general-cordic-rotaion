/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  hyperbola_LUT.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module hyperbola_LUT #(
	parameter	DSIZE	= 16
)(
	input [4:0]			I	,
	output[DSIZE-1:0]	Dz	
);

localparam [DSIZE-1:0]	
	  Z00		=     0.549306144334055 * (2**DSIZE),  
      Z01		=     0.255412811882995 * (2**DSIZE),
      Z02		=     0.125657214140453 * (2**DSIZE),
      Z03		=     0.062581571477003 * (2**DSIZE),
      Z04		=     0.031260178490667 * (2**DSIZE),
      Z05		=     0.015626271752052 * (2**DSIZE),
      Z06		=     0.007812658951540 * (2**DSIZE),
      Z07		=     0.003906269868397 * (2**DSIZE),
      Z08		=     0.001953127483533 * (2**DSIZE),
      Z09		=     0.000976562810441 * (2**DSIZE),
      Z10		=     0.000488281288805 * (2**DSIZE),
      Z11		=     0.000244140629851 * (2**DSIZE),
      Z12		=     0.000122070313106 * (2**DSIZE),
      Z13		=     0.000061035156326 * (2**DSIZE),
      Z14		=     0.000030517578134 * (2**DSIZE),
      Z15		=     0.000015258789064 * (2**DSIZE),
      Z16		=     0.000007629394531 * (2**DSIZE),
      Z17		=     0.000003814697266 * (2**DSIZE),
      Z18		=     0.000001907348633 * (2**DSIZE),
      Z19		=     0.000000953674316 * (2**DSIZE),
      Z20		=     0.000000476837158 * (2**DSIZE),
      Z21		=     0.000000238418579 * (2**DSIZE),
      Z22		=     0.000000119209290 * (2**DSIZE),
      Z23		=     0.000000059604645 * (2**DSIZE),
      Z24		=     0.000000029802322 * (2**DSIZE),
      Z25		=     0.000000014901161 * (2**DSIZE),
      Z26		=     0.000000007450581 * (2**DSIZE),
      Z27		=     0.000000003725290 * (2**DSIZE),
      Z28		=     0.000000001862645 * (2**DSIZE),
      Z29		=     0.000000000931323 * (2**DSIZE),
      Z30		=     0.000000000465661 * (2**DSIZE),
      Z31		=     0.000000000232831 * (2**DSIZE);

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
