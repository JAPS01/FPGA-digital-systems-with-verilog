`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:20:56 05/01/2021 
// Design Name: 
// Module Name:    Melodia2 
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
module Melodia2(
		input clock, 
		output reg aux);


reg[27:0] C_CHG = 28'd0; 
reg[18:0] C_NOTA = 19'd0; 
reg[8:0] PASA_NOTA; 

wire clock_CHG;
parameter DIV_CHG = 28'd200000000,
			 DIV_FA = 19'd1086957, 
			 DIV_LA = 19'd909091, 
			 DIV_La = 19'd854701, 
			 DIV_Fa = 19'd1075269, 
			 DIV_MI = 19'd1204819, 
			 DIV_FA1 = 19'd1149425; 
					 

always @(posedge clock)
begin
 	
 C_CHG <= C_CHG + 28'd1;
 C_NOTA <= C_NOTA + 19'd1;
 
  
	if(C_CHG>=(DIV_CHG+1))
		begin C_CHG <= 28'd0; end
		
 case (PASA_NOTA)
  
	3'd0: begin
				
			if(C_NOTA >=(DIV_FA-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_FA/2))
				begin aux = 0; end 
			else 
				begin aux = 1; end 
			
			end
	3'd1: begin
				
				if(C_NOTA >=(DIV_LA-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_LA/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
	
	3'd2: begin
				
			if(C_NOTA >=(DIV_La-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_La/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
		3'd3: begin
				
			if(C_NOTA >=(DIV_Fa-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_Fa/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
		3'd4: begin
				
			if(C_NOTA >=(DIV_LA-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_LA/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
		3'd5: begin
				
			if(C_NOTA >=(DIV_La-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_La/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
		3'd6: begin
				
			if(C_NOTA >=(DIV_MI-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_MI/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
		3'd7: begin
				
			if(C_NOTA >=(DIV_FA1-1))
				begin C_NOTA <= 9'd0; end
			else if (C_NOTA < (DIV_FA1/2))
				begin aux = 1; end 
			else 
				begin aux = 0; end 
			
			
		end
	
 endcase;
end

assign clock_CHG = (C_CHG == DIV_CHG)? 1'b1 : 1'b0;

always @(posedge clock_CHG)
	begin
		if (PASA_NOTA < 3'd7)
			PASA_NOTA <= PASA_NOTA + 3'd1;
		end

endmodule 