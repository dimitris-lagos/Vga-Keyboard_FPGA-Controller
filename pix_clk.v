module pix_clk(clk,reset,clkdiv4);
input clk, reset;
output clkdiv4;
reg [1:0] counter;
assign clkdiv4=(counter==2'd3);
always@(posedge clk or posedge reset)
begin
    if (reset) counter<=2'd0;
    else 
    begin
        if (counter==2'd3) counter<=2'd0;   
        else        counter<=counter+1;
    end
end
endmodule
