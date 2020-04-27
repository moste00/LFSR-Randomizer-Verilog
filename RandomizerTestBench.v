module RandomizerTestBench ;

//The randomizer Ports
reg clk ;
reg enable ;
reg reset; 
reg load ;
reg lfsr_data_in ;
reg data_in ;
wire data_out;

//Buffers for storing the input and output sequence
reg [95:0] InputStream ;
reg [95:0] OutputStream ;


Randomizer UUT(clk, enable, reset, load, lfsr_data_in, data_in, data_out);
initial clk = 0;
always #5 clk = ~clk ;

//test loop
integer iterator ;
initial
begin 
	enable = 1;
	reset =  1;
	load = 0 ;
	lfsr_data_in = 'bx;
	reset = 1;
	#10 reset = 0 ;

	InputStream = 'hACBCD2114DAE1577C6DBF4C9 ;
	for(iterator = 95 ; iterator >= 0 ; iterator = iterator - 1)
	begin
		data_in = InputStream[iterator] ;
		#10
		OutputStream[iterator] = data_out ;
	end
	
	$display("Given the test sequence : %h", InputStream);
	$display("\nthe Randomizer unit produced the following sequence \n");
	$display("%h", OutputStream);
end


endmodule
