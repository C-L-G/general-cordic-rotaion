/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  general_cordic_rotation.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module general_cordic_rotation #(
	parameter	DSIZE		= 16,
	parameter	ROTTMODE	= "ROTT",	//"ROTT"  "VECTOR"
	parameter	MMODE		= "1"		// "-1" "0" "1"
)(
	input						clock	,
	input signed[DSIZE-1:0]		Xin     ,
	input signed[DSIZE-1:0]		Yin     ,
	input		[4:0]			I		,
	input						direcion,
	input signed[DSIZE-1:0]		Zin     ,
	output signed[DSIZE-1:0]	Xout    ,
	output signed[DSIZE-1:0]	Yout    ,
	output signed[DSIZE-1:0]	Zout
);

wire	ctrl_Z_exec;
wire	ctrl_Y_exec;
wire	ctrl_X_exec;
wire	Z_exec_rott;
wire	Y_exec_rott;

assign	ctrl_Z_exec	= ROTTMODE == "VECTOR" ? 	Y_exec_rott : 1'b1;
assign	ctrl_Y_exec	= ROTTMODE == "ROTT" ?		Z_exec_rott	: 1'b1;
assign	ctrl_X_exec	= ROTTMODE == "VECTOR" ? 	Y_exec_rott : Z_exec_rott;

wire	Z_dire;
wire	Y_dire;
wire	X_dire;

assign	Z_dire	= ROTTMODE == "ROTT" ?	 direcion : ~direcion;
assign	Y_dire	= ROTTMODE == "VECTOR"?	 direcion : ~direcion;
assign	X_dire	= ROTTMODE == "ROTT" ?	 direcion : ~direcion;


rotation_Z #(
	.DSIZE			(DSIZE		),
	.PSIZE			(5  		),
	.ROTTMODE		(ROTTMODE	),	//"ROTT" "VECTOR"
	.MMODE			(MMODE		)	//"1" "0" "-1"
)rotation_Z_inst(
/*	input					*/	.clock			(clock				),		
/*	input signed[DSIZE-1:0]	*/	.Zin            (Zin              	),
/*	input [PSIZE-1:0]		*/	.I              (I	                ),
/*	input					*/	.direction      (Z_dire		    	),
/*	input					*/	.Y_exec_rott    (ctrl_Z_exec        ),
/*	output signed[DSIZE-1:0]*/	.Zout           (Zout	            ),
/*	output					*/	.Z_exec_rott    (Z_exec_rott  		)
);

rotation_Y #(
	.DSIZE			(DSIZE       	),
	.PSIZE			(5              ),
	.ROTTMODE		(ROTTMODE		)//"ROTT" "VECTOR"
)rotation_Y_inst(
/*	input					*/	.clock			(clock				),
/*	input signed[DSIZE-1:0]	*/	.Yin            (Yin	            ),
/*	input signed[DSIZE-1:0]	*/	.Xin            (Xin                ),
/*	input [PSIZE-1:0]		*/	.I              (I                  ),
/*	input					*/	.direction      (Y_dire    	        ),
/*	input					*/	.Z_exec_rott    (ctrl_Y_exec        ),
/*	output signed[DSIZE-1:0]*/	.Yout           (Yout	            ),
/*	output					*/	.Y_exec_rott    (Y_exec_rott        )
);

rotation_X #(
	.DSIZE			(DSIZE   		),
	.PSIZE			(5				),
	.MMODE			(MMODE			)		//"-1" "0" "1"
)rotation_X_inst(
/*	input					*/	.clock			(clock				),		
/*	input signed[DSIZE-1:0]	*/	.Xin			(Xin	        	),
/*	input signed[DSIZE-1:0]	*/	.Yin            (Yin            	),
/*	input [PSIZE-1:0]		*/	.I              (I                  ),
/*	input					*/	.direction      (X_dire			    ),
/*	input					*/	.exec_rott      (ctrl_X_exec        ),
/*	output signed[DSIZE-1:0]*/	.Xout           (Xout	            )
);


endmodule


