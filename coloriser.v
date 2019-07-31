module coloriser(reset,fpga_clk,vga_clk,display_area,shifter_output,Rin,Gin,Bin,Redout,Greenout,Blueout);
input reset,Rin,Gin,Bin,vga_clk,display_area,fpga_clk;
input shifter_output;
output reg [2:0]  Redout,Greenout,Blueout;
reg [2:0]  Red,Green,Blue;
reg red_up,green_up,blue_up; //an to up einai ena, exoume afksisi twn xrwmatwn, alliws theloume meiwsh

always @(posedge vga_clk or posedge reset) //to be replaced with vga_clk?
begin
if (reset)
    begin 
	    Red=3'd0;
		Green=3'd0;
		Blue=3'd0;
		
		
		red_up=1;
		green_up=1;
		blue_up=1;
    end

else
begin
	if (Rin==1)
		begin
			if (red_up==1) 
				begin
					Red=Red+3'b1;
					if (Red==3'd7) red_up=0;
				end
			else if (red_up==0) 
				begin
					Red=Red-3'b1;
					if (Red==3'd0) red_up=1;
				end
				
		end
		
		if (Gin==1)
		begin
			if (green_up==1) 
				begin
					Green=Green+3'b1;
					if (Green==3'd7) green_up=0;
				end
			else if (green_up==0) 
				begin
					Green=Green-3'b1;
					if (Green==3'd0) green_up=1;
				end
				
		end
		if (Bin==1)
		begin
			if (blue_up==1) 
				begin
					Blue=Blue+3'b1;
					if (Blue==3'd7) blue_up=0;
				end
			else if (blue_up==0) 
				begin
					Blue=Blue-3'b1;
					if (Blue==3'd0) blue_up=1;
				end
				
		end
end
end
always @(posedge vga_clk)
begin
    if (display_area & shifter_output)
    begin
        Redout=Red;
        Greenout=Green;
        Blueout=Blue;
    end
    else 
    begin 
        Redout=3'b000;
        Greenout=3'b000;
        Blueout=3'b000;
    end
end

endmodule


