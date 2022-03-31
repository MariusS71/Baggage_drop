`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:16:17 11/07/2021 
// Design Name: 
// Module Name:    square_root 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module square_root (
    output reg [15:0] out,
    input  [7:0] in );
	 
	 
	reg [3:0] base;
	reg [3:0] i;
	reg [7:0] dec;
	reg [23:0] insec;
	always @(*) begin
		base=8;
		out=0;
		for(i=0; i<4; i=i+1) begin
			out=out+base;
			if((out*out)>in) begin
				out=out-base;
				end
			base=base/2;
		end
		
		out=out<<<8;
	
		dec=8'b10000000;
		insec=in<<<16;
		
		for(i=0; i<8; i=i+1) begin
		out=out+dec;
		if((out*out)>(insec)) begin
			out=out-dec;
		end
		dec=dec>>>1;
		
		end

	end

endmodule
