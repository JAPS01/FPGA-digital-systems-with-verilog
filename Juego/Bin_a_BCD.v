`timescale 1ns / 1ps
module BCD (bin,bcd);
input [8:0] bin;
output [11:0] bcd;
reg [11 : 0] bcd;
reg [3:0] i;
     
always @(bin)
   begin
      bcd = 0; 
      for (i = 0; i < 9; i = i+1) 
        begin
          bcd = {bcd[10:0],bin[8-i]}; 
              if(i < 8 && bcd[3:0] > 4) 
                 bcd[3:0] = bcd[3:0] + 2'b11;
              if(i < 8 && bcd[7:4] > 4)
                 bcd[7:4] = bcd[7:4] + 2'b11;
              if(i < 8 && bcd[11:8] > 4)
                 bcd[11:8] = bcd[11:8] + 2'b11; 
        end
    end           
endmodule
