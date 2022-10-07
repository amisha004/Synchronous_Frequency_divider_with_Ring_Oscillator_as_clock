module amisha_frequency_divider(
    input clk,
    output reg [2:0] Fout
    );
	 
	 initial
	 Fout = 3'b000;
	 always @(negedge clk)
	 Fout <= Fout + 1'b1;

endmodule