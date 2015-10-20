/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  rotation_X.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module rotation_X #(
	parameter	DSIZE		= 16,
	parameter	PSIZE		= 5,
	parameter	MMODE		= "0"		//"-1" "0" "1"
)(
	input						clock			,
	input signed[DSIZE-1:0]		Xin				,
	input signed[DSIZE-1:0]		Yin             ,
	input [PSIZE-1:0]			I               ,
	input						direction       ,
	input						exec_rott       ,
	output signed[DSIZE-1:0]	Xout
);

reg signed[DSIZE-1:0]	Dyin;

always@(posedge clock)
	if( MMODE != "0")
		Dyin	<= Yin >>> I; 
	else
		Dyin	<= {DSIZE{1'b0}};


wire signed[DSIZE-1:0]	Xin_lat1;

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE		)
)Xin_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Xin		),
	.q		(Xin_lat1	) 
);

wire		dire_lat1;
latency #(
	.LAT	(1			),
	.DSIZE	(1   		)
)Dire_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(direction	),
	.q		(dire_lat1	) 
);

rotation #(
	.DSIZE			(DSIZE		),
	.MODE			("SLAVER" 	)	//"ROTT" "VECTOR"
)rotation_X_inst(
/*	input					*/	.clock				(clock			),
/*	input signed[DSIZE-1:0]	*/	.Din            	(Xin_lat1   	),
/*	input signed[DSIZE-1:0]	*/	.Delta          	(Dyin       	),
/*	input					*/	.direction      	(dire_lat1		),		//
/*  input					*/	.master_exec_rott	(exec_rott		),
/*	output signed[DSIZE-1:0]*/	.Dout           	(Xout       	),
/*	output					*/	.slaver_exec_rott  	(		 		)
);


endmodule
