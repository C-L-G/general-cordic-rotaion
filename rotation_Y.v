/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  rotation_Y.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module rotation_Y #(
	parameter	DSIZE		= 16,
	parameter	PSIZE		= 5,
	parameter	ROTTMODE	= "ROTT"	//"ROTT" "VECTOR"
)(
	input						clock		,
	input signed[DSIZE-1:0]		Yin         ,
	input signed[DSIZE-1:0]		Xin         ,
	input [PSIZE-1:0]			I           ,
	input						direction   ,
	input						Z_exec_rott ,
	output signed[DSIZE-1:0]	Yout        ,
	output						Y_exec_rott
);

reg signed[DSIZE-1:0]	Dxin;

always@(posedge clock)
	Dxin	<= Xin >>> I;

wire signed[DSIZE-1:0]	Yin_lat1;

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE		)
)Yin_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Yin		),
	.q		(Yin_lat1	) 
);

wire		dire_lat1;
latency #(
	.LAT	(1			),
	.DSIZE	(1			)
)Dire_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(direction	),
	.q		(dire_lat1	) 
);

localparam	MODE	= ROTTMODE == "VECTOR" ? "MASTER" : (ROTTMODE == "ROTT")? "SLAVER" : ""; 
wire	exec_rott	;
assign	exec_rott	= ROTTMODE == "VECTOR" ? 1'b1 : (ROTTMODE == "ROTT")? Z_exec_rott : 1'b0; 

rotation #(
	.DSIZE		(DSIZE		),
	.MODE		(MODE	 	)	//"ROTT" "VECTOR"
)rotation_Y_inst(
/*	input					*/	.clock				(clock			),
/*	input signed[DSIZE-1:0]	*/	.Din            	(Yin_lat1   	),
/*	input signed[DSIZE-1:0]	*/	.Delta          	(Dxin       	),
/*	input					*/	.direction      	(dire_lat1		),		//    
/*  input					*/	.master_exec_rott	(exec_rott		),
/*	output signed[DSIZE-1:0]*/	.Dout           	(Yout       	),
/*	output					*/	.slaver_exec_rott  	(Y_exec_rott  	)
);


endmodule



