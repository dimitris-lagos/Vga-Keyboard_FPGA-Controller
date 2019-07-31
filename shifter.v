module shifter(reset,char_rom_data_out,vga_clk,display_area_enable,one_bit_output);
input [7:0]char_rom_data_out;
input vga_clk,display_area_enable,reset;
output reg one_bit_output;
reg [2:0]counter;
always @(posedge vga_clk or posedge reset)
begin
if (reset)
	begin
		counter<=3'd0;
		one_bit_output<=0;
	end
	else if (display_area_enable==0) 
    begin
    counter<=0;
    one_bit_output<=0;
    end
	else //otan tha eimaste sto display area
		begin //den xreiazetai na midenisoume ton counter afou emfanisei to 8o bit, giati tha eimaste gia 8 xtypous tou vga_clock sto display area. meta tha vgoume, kai tha midenistei o counter apo tin grammi 8.
		if (char_rom_data_out[7-counter]==1) one_bit_output<=1; 
		else one_bit_output<=3'd0;
		counter<=counter+1;
        if (counter==3'd7) counter<=0;
        else counter<=counter+1;
		end
end


endmodule
