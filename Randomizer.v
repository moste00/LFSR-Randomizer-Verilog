module Randomizer(input clk , input enable , input async_reset , input load , input lfsr_data_in, input data_in , data_out) ;

wire lfsr_data_out ;
LFSR lfsr(clk, enable , async_reset , load , lfsr_data_in , lfsr_data_out) ;

assign data_out = lfsr_data_out ^ data_in ;





endmodule
