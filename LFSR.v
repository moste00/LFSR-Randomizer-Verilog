module LFSR(input clk, input enable, input async_reset, input load, input data_in, output reg data_out );

localparam initial_val = 'b 101010001110110 ;
reg [15:1] data ;

always @(posedge clk or async_reset)
begin
	if(async_reset) data = initial_val ; 
	else if(enable)
	begin
		casex( load ) //makes 'x' and 'z' also match 0 case, it's useful to consider the load flag 0 by defualt unless it's explicetly 1
			'b 0 :
			begin
				data[15:2] <= data[14:1] ;
				data[1]    <= data[14] ^ data[15] ;
				data_out   <= data[1] ;
			end
			
			'b 1 :
			begin
				data[15:2] <= data[14:1] ;
				data[1]    <= data_in ;
				data_out   <= 'bx ;
			end
		
		endcase
	end 
end

endmodule 