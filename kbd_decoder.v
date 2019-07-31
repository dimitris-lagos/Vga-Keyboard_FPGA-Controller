module kbd_decoder(clock,reset,flag,scancode,start_address_out,r,g,b,f,up,char_enable);
input [7:0] scancode;
input flag,clock,reset;
output reg f,r,g,b,char_enable;
output reg [5:0] start_address_out;
output reg [2:0] up;

always @(posedge clock or posedge reset) //to be replaced with vga_clk?
if (reset)
begin
	r<=0;
    g<=0;
    b<=0;
    f<=0;
	char_enable<=0;
    up<=3'b000;
end
else begin
    r<=0;
    g<=0;
    b<=0;
    f<=0;
    up<=3'b000;
if(flag)
begin
    case(scancode)
        8'h16: begin //found 1 
					start_address_out<=6'b000000; 
					char_enable<=1; 
					end
        8'h1e: begin //found 2
					start_address_out<=6'b010000; 
					char_enable<=1;
					end					
        8'h26: begin //found 3
					start_address_out<=6'b100000; 
					char_enable<=1;
					end
        8'h25: begin //found 4 
					start_address_out<=6'b110000 ; 
					char_enable<=1;
					end
        8'h2d: r<=1'b1; //found red
        8'h34: g<=1'b1; //found green
        8'h32: b<=1'b1; //found blue
        8'h2b: f<=1'b1; // F
        8'h75: up<=3'b100;//panw
        8'h72: up<=3'b011;//katw
        8'h6B: up<=3'b001;//aristera
        8'h74: up<=3'b010;//deksia
    endcase
end
else 
    begin
    r<=0;
    g<=0;
    b<=0;
    f<=0;
    up<=3'b000;
    end
end
endmodule



