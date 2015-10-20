/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  rotation.v
--Project Name: general-cordic-rotation
--Data modified: 2015-10-20 11:29:59 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module rotation #(
	parameter	DSIZE	= 16,
	parameter	MODE	= "SLAVER" 	//"MASTER" "SLAVER"
)(
	input						clock				,
	input signed[DSIZE-1:0]		Din                 ,
	input signed[DSIZE-1:0]		Delta               ,
	input						direction           ,
	input						master_exec_rott	,	//sync 'abs_cmp'
	output signed[DSIZE-1:0]	Dout                ,
	output						slaver_exec_rott	
);

reg signed[DSIZE-1:0]	pre_Dout;

always@(posedge clock)
	if(direction == 1'b0)
			pre_Dout	= Din + Delta;  
	else	pre_Dout	= Din - Delta;

wire signed[DSIZE-1:0]	Din_lat1;
wire signed[DSIZE-1:0]	Din_lat2;

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE		)
)Din_lat1_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Din		),
	.q		(Din_lat1	) 
);

latency #(
	.LAT	(1			),
	.DSIZE	(DSIZE		)
)Din_lat2_inst(     	
	.clk	(clock		),
	.rst_n	(1'b1		),
	.d		(Din_lat1	),
	.q		(Din_lat2	) 
);

wire signed[DSIZE-1:0]	pre_Dout_lat2;

latency #(
	.LAT	(1				),
	.DSIZE	(DSIZE			)
)Dout_lat2_inst(     		
	.clk	(clock			),
	.rst_n	(1'b1			),
	.d		(pre_Dout		),
	.q		(pre_Dout_lat2	) 
);



reg abs_cmp;

always@(posedge clock)begin
	case({pre_Dout[DSIZE-1],Din_lat1[DSIZE-1]})
	2'b00:	abs_cmp	<=  Din_lat1 >=  pre_Dout; 
	2'b11:	abs_cmp	<=  Din_lat1[DSIZE-2:0] <= pre_Dout[DSIZE-2:0];
	2'b01:	abs_cmp	<= -Din_lat1 >=  pre_Dout;
	2'b10:	abs_cmp	<=  Din_lat1 >= -pre_Dout;
	default:abs_cmp	<= 1'b0;
	endcase
end

reg signed[DSIZE-1:0]	Dout_reg;

always@(posedge clock)begin
	if(MODE == "MASTER")begin
		Dout_reg	<= abs_cmp?	pre_Dout_lat2 : Din_lat2;
	end else if(MODE == "SLAVER")begin
		Dout_reg	<= master_exec_rott? pre_Dout_lat2 : Din_lat2;
	end
end

reg rott_reg;

always@(posedge clock)
	rott_reg	<= abs_cmp;

assign	Dout		= Dout_reg;
//assign	slaver_exec_rott	= rott_reg;
assign	slaver_exec_rott	= abs_cmp;

endmodule






	
