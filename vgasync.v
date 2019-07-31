module vgasync(clk,clk25,reset,up,hsync,vsync,display_area,line);
input clk25,clk,reset;
input [2:0] up;
output hsync,vsync,display_area;
output[3:0] line;
wire hsync,vsync;
reg [9:0] left,right;
reg [8:0] top,down;
reg [9:0] pixel_counter;
reg [8:0] line_counter;
parameter H_FRONT_PORCH = 16 ;
parameter H_SYNC_PULSE = 96 ;
parameter H_BACK_PORCH = 48 ;
parameter H_VISIBLE_PIXELS = 640 ;
parameter H_END=800;

parameter V_FRONT_PORCH = 12 ;
parameter V_SYNC_PULSE = 2 ;
parameter V_BACK_PORCH = 35 ;
parameter V_VISIBLE_LINES = 400 ;
parameter V_END=449;

parameter H_LEFT_BORDER=475;//(800+160)/2-4
parameter H_RIGHT_BORDER=482;//476+7
parameter V_TOP_BORDER=216;//(12+2+35+400-1)/2
parameter V_BOTTOM_BORDER=231;//216+15 epeidh exoume 16 grammes pros anaparastash 


always @(posedge clk25 or posedge reset) 
begin
    if (reset) // an exoume energopoihmeno reset, midenise ton counter
    begin
        pixel_counter<=10'd0;
        line_counter<=9'd0;
    end

    else if (pixel_counter==H_END) //an den exoume energopoihmeno reset kai an eimaste sto deksi akro tis othonis
         begin
             pixel_counter<=10'd0;
             if (line_counter==V_END) line_counter<=9'd0; //an eimaste sthn teleftaia grammi, midenizoume ton line_counter
             else line_counter<=line_counter+9'd1; //alliws afksanoume ton line_counter
         end
    else pixel_counter<=pixel_counter+10'd1; //an den eimaste sto deksi akro tis othonis   
    end
    
    
 always @(posedge clk or posedge reset) 
begin
    if(reset)
    begin
        top=V_TOP_BORDER;
        left=H_LEFT_BORDER;
        down=V_BOTTOM_BORDER;
        right=H_RIGHT_BORDER;
    end
    else
    begin
        case(up)
         3'b100: begin
                    top=top-1;
                    down=down-1;
                    end
         3'b011: begin
                    top=top+1;
                    down=down+1;
                        end
         3'b001: begin
                    left=left-1;
                    right=right-1;
                       end
         3'b010: begin
                    left=left+1;
                    right=right+1;
                       end
        endcase
    
    
    
    
    end
end//2nd always



 
assign hsync =(pixel_counter>H_FRONT_PORCH-1 && pixel_counter<H_FRONT_PORCH+H_SYNC_PULSE)? 0:1;//  112 > pc > 15
assign vsync =(line_counter>V_FRONT_PORCH-1 && line_counter<V_FRONT_PORCH+V_SYNC_PULSE)? 1:0; // 14> lc > 11
assign visible= (pixel_counter>H_FRONT_PORCH+H_SYNC_PULSE+H_BACK_PORCH-1 && line_counter>V_FRONT_PORCH+V_SYNC_PULSE+V_BACK_PORCH-1)? 1:0;

assign display_area=(pixel_counter>=left && pixel_counter<= right && line_counter>=top && line_counter<=down)? 1:0;
assign line[3:0]=(line_counter>=top ) ? (line_counter - top):0;//ypologizoume thn apostash se lines apo to top border. paei ston iterator gia diefthynsiodotish ths mnhmhs 
//assign Red=(display_area)? 3'b111:3'b000;//an eimaste sto display area steile aspro, alliws mavro 216 231
//assign Blue=(display_area)? 3'b111:3'b000; 476-482
//assign Green=(display_area)? 3'b111:3'b000; 12-13


endmodule

