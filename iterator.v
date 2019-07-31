module iterator(line,display,starting_address,address_output);
input [5:0]starting_address;
input [3:0]line;
input display;
output [5:0]address_output;


assign address_output=(display) ? starting_address+line:0;
endmodule
