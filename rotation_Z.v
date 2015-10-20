/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  rotation_Z.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module rotation_Z #(
	parameter	DSIZE	= 16,
	parameter	PSIZE	= 5,
	parameter	ROTTMODE	= "ROTT",	//"ROTT" "VECTOR"
	parameter	MMODE		= "1"		//"1" "0" "-1"
)(
	input						clock			,
	input signed[DSIZE-1:0]		Zin             ,
	input [PSIZE-1:0]			I               ,
	input						direction       ,
	input						Y_exec_rott     ,
	output signed[DSIZE-1:0]	Zout            ,
	output						Z_exec_rott
);

wire [DSIZE-2:0]	Dz;
generate
if(MMODE == "1")begin
circular_LUT #(
	.DSIZE		(DSIZE-1	)
)LUT_inst(
	.I			(I			),
	.Dz			(Dz			)
);
end else if(MMODE == "0")begin
line_LUT #(
	.DSIZE		(DSIZE-1	)
)LUT_inst(
	.I			(I			),
	.Dz			(Dz			)
);
end else if(MMODE == "-1")begin
hyperbola_LUT #(
	.DSIZE		(DSIZE-1	)
)LUT_inst(
	.I			(I			),
	.Dz			(Dz			)
);	
end
endgenerate
	

wire signed[DSIZE-1:0]	Zin_lat1;
wire signed[DSIZE-1:0]	Dz_lat1;

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE		)
)Zin_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Zin		),
	.q		(Zin_lat1	) 
);

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE-1	)
)Dz_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Dz			),
	.q		(Dz_lat1[DSIZE-2:0]	) 
);
assign	Dz_lat1[DSIZE-1]	= 1'b0;

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

localparam	MODE	= ROTTMODE == "ROTT" ? "MASTER" : (ROTTMODE == "VECTOR")? "SLAVER" : ""; 
wire	exec_rott	;
assign	exec_rott	= ROTTMODE == "ROTT" ? 1'b1 : (ROTTMODE == "VECTOR")? Y_exec_rott : 1'b0; 

rotation #(
	.DSIZE		(DSIZE		),
	.MODE		(MODE	 	)	//"ROTT" "VECTOR"
)rotation_Z_inst(
/*	input					*/	.clock				(clock			),
/*	input signed[DSIZE-1:0]	*/	.Din            	(Zin_lat1		),
/*	input signed[DSIZE-1:0]	*/	.Delta          	(Dz_lat1   		),
/*	input					*/	.direction      	(dire_lat1		),		//
/*  input					*/	.master_exec_rott	(exec_rott		),
/*	output signed[DSIZE-1:0]*/	.Dout           	(Zout       	),
/*	output					*/	.slaver_exec_rott   (Z_exec_rott  	)
);


endmodule






	
