module char_rom(enable,address,data_out);
input [5:0] address;
input enable;
output [7:0] data_out;



 //an to enable einai energopoihmeno 
assign data_out=   (enable) ?   (address==6'b000000) ? 8'b00011000 ://kai i diefthynsh einai afth , tote 
								(address==6'b000001) ? 8'b00111000 :		
								(address==6'b000010) ? 8'b01111000 :
								(address==6'b000011) ? 8'b11011000 :
								(address==6'b000100) ? 8'b00011000 :
								(address==6'b000101) ? 8'b00011000 :
								(address==6'b000110) ? 8'b00011000 :
								(address==6'b000111) ? 8'b00011000 :
								(address==6'b001000) ? 8'b00011000 :
								(address==6'b001001) ? 8'b00011000 :
								(address==6'b001010) ? 8'b00011000 :
								(address==6'b001011) ? 8'b00011000 :
								(address==6'b001100) ? 8'b00011000 :
								(address==6'b001101) ? 8'b00011000 :
								(address==6'b001110) ? 8'b11111111 :
								(address==6'b001111) ? 8'b11111111 :

								(address==6'b010000) ? 8'b00111100 :		
								(address==6'b010001) ? 8'b01111110 :
								(address==6'b010010) ? 8'b11000011 :
								(address==6'b010011) ? 8'b11000011 :
								(address==6'b010100) ? 8'b00000011 :
								(address==6'b010101) ? 8'b00000011 :
								(address==6'b010110) ? 8'b00000110 :
								(address==6'b010111) ? 8'b00001100 :
								(address==6'b011000) ? 8'b00011000 :
								(address==6'b011001) ? 8'b00110000 :
								(address==6'b011010) ? 8'b01100000 :
								(address==6'b011011) ? 8'b11000000 :
								(address==6'b011100) ? 8'b11000000 :
								(address==6'b011101) ? 8'b11000000 :
								(address==6'b011110) ? 8'b11111111 :
								(address==6'b011111) ? 8'b01111111 :

								(address==6'b100000) ? 8'b11111111 :		
								(address==6'b100001) ? 8'b11111111 :
								(address==6'b100010) ? 8'b00000011 :
								(address==6'b100011) ? 8'b00000011 :
								(address==6'b100100) ? 8'b00000011 :
								(address==6'b100101) ? 8'b00000011 :
								(address==6'b100110) ? 8'b00000011 :
								(address==6'b100111) ? 8'b01111110 :
								(address==6'b101000) ? 8'b01111110 :
								(address==6'b101001) ? 8'b00000010 :
								(address==6'b101010) ? 8'b00000011 :
								(address==6'b101011) ? 8'b00000011 :
								(address==6'b101100) ? 8'b00000011 :
								(address==6'b101101) ? 8'b00000011 :
								(address==6'b101110) ? 8'b11111111 :
								(address==6'b101111) ? 8'b11111111 :

								(address==6'b110000) ? 8'b11000011 :		
								(address==6'b110001) ? 8'b11000011 :
								(address==6'b110010) ? 8'b11000011 :
								(address==6'b110011) ? 8'b11000011 :
								(address==6'b110100) ? 8'b11000011 :
								(address==6'b110101) ? 8'b11000011 :
								(address==6'b110110) ? 8'b11000011 :
								(address==6'b110111) ? 8'b11111111 :
								(address==6'b111000) ? 8'b11111111 :
								(address==6'b111001) ? 8'b00000011 :
								(address==6'b111010) ? 8'b00000011 :
								(address==6'b111011) ? 8'b00000011 :
								(address==6'b111100) ? 8'b00000011 :
								(address==6'b111101) ? 8'b00000011 :
								(address==6'b111110) ? 8'b00000011 : 
                                                       8'b00000011 : 
								8'b00000000;//an to enable den einai energopoihmeno, tote den exoume data_out


endmodule
