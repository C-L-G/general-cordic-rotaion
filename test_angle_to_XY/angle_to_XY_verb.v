/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  angle_to_XY_verb.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module angle_to_XY_verb #(
	parameter	DSIZE	= 16,
	parameter	PSIZE	= 5,
	parameter	ISIZE	= 10
)(
	input				clock 	,
	input [DSIZE-1:0]	Angle   ,
	output[DSIZE-1:0]	X       ,
	output[DSIZE-1:0]	Y	
);


wire signed[DSIZE:0]				Z [ISIZE-1:0];
wire [PSIZE-1:0]					I [ISIZE-1:0];
wire signed[DSIZE:0]				Zout [ISIZE-1:0];
wire [ISIZE-1:0]					direction;

wire signed[DSIZE:0]				Xr		[ISIZE-1:0];
wire signed[DSIZE:0]				Yr		[ISIZE-1:0];
wire signed[DSIZE:0]				Xout	[ISIZE-1:0];
wire signed[DSIZE:0]				Yout	[ISIZE-1:0];

assign	Z[0]			= {1'b0,Angle};
assign	Xr[0]			= 2**(DSIZE-1);
assign	Yr[0]			= {1'b0,{DSIZE{1'b0}}};
assign	direction[0]	= 1'b1;


genvar II;

generate
for(II=0;II<ISIZE;II=II+1)begin
general_cordic_rotation #(
	.DSIZE			(DSIZE+1	),
	.ROTTMODE		("ROTT"		),	//"ROTT"  "VECTOR"
	.MMODE			("1"		)		// "-1" "0" "1"
)general_cordic_rotation_inst(
/*	input						*/	.clock		(clock				),
/*	input signed[DSIZE-1:0]		*/	.Xin        (Xr[II]             ),
/*	input signed[DSIZE-1:0]		*/	.Yin        (Yr[II]             ),
/*	input		[4:0]			*/	.I		    (I[II]              ),
/*	input						*/	.direcion   (direction[II]      ),
/*	input signed[DSIZE-1:0]		*/	.Zin        (Z[II]              ),
/*	output signed[DSIZE-1:0]	*/	.Xout       (Xout[II]           ),
/*	output signed[DSIZE-1:0]	*/	.Yout       (Yout[II]           ),
/*	output signed[DSIZE-1:0]	*/	.Zout       (Zout[II]	        )
);

assign	I[II] = II;

if(II != 0)begin
assign	Z[II] 			= Zout[II-1];
assign	direction[II]	= !Zout[II-1][DSIZE-1];
assign	Xr[II]			= Xout[II-1];
assign	Yr[II]			= Yout[II-1];
end
end

endgenerate

assign	X 	= Xout[ISIZE-1][DSIZE-1:0]	;
assign	Y	= Yout[ISIZE-1][DSIZE-1:0]	;

endmodule



