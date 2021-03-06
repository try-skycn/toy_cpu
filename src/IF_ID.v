module IF_ID(
	input	wire					clk,		//= clk
	input	wire					rst,		//= rst

	input	wire					kill,		//= ID::o_takeBranch
	input	wire					stall_if,	//= CTRL::stall_if
	input	wire					stall_id,	//=	CTRL::stall_id

	input	wire[`INST_ADDR_BUS]	if_pc,		//= PCReg::pc
	input	wire[`INST_BUS]			if_inst,	//= i_romInst

	output	reg	[`INST_ADDR_BUS]	id_pc,		//= id_pc
	output	reg	[`INST_BUS]			id_inst		//= id_inst
);

	always @(posedge clk) begin
		if (rst) begin
			id_pc <= 0;
			id_inst <= 0;
		end else if (stall_id) begin
		end else if (stall_if | kill) begin
			id_pc <= 0;
			id_inst <= 0;
		end else begin
			id_pc <= if_pc;
			id_inst <= if_inst;
		end
	end

endmodule
