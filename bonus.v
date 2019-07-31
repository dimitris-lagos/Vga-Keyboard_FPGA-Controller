module bonus(vga_clk,reset,f,vsync,rin,gin,bin,rout,gout,bout);
input reset,vsync,f,vga_clk;
input [2:0] rin,gin,bin;
output [2:0] rout,gout,bout;
reg[6:0] counterv;
reg f_state;
reg [7:0]samples;
wire rising_edge;

always @(posedge vga_clk or posedge reset)
begin
if (reset) samples <= 8'd0;
else samples <= {samples[7:0], vsync};
end
    assign rising_edge = (samples[7:4] == 4'h0) & (samples[3:0] == 4'hF);

always @(posedge vga_clk or posedge reset )
begin

    if(reset)
    begin
        counterv<=7'd0;
        f_state<=1'd0;
    end
    else
    begin
        if(f==1'b1)  f_state<=~f_state;
        else if(rising_edge)
        begin
            if(counterv==127) counterv<=7'd0;
            else if(counterv<127) counterv<=counterv+1'd1;
        end
   end
end


assign rout =(f_state )? (counterv<63)? rin:3'b000:rin;
assign gout =(f_state )? (counterv<63)? gin:3'b000:gin;
assign bout =(f_state )? (counterv<63)? bin:3'b000:bin;

endmodule
