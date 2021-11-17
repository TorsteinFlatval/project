module pixelTop(
		input logic      clk,
                input logic      reset,
		input logic      VBN1,
   		input logic      RAMP,
   		input logic      RESET,
   		output [7:0]	 DATA
   		);
   		
   wire             erase;
   wire             expose;
   wire             read1;
   wire		    read2;
   wire		    read3;
   wire 	    read4;	
   wire             convert;

   tri[7:0]         pixData;
   
   PIXEL_ARRAY ps1(VBN1, RAMP, RESET, erase,expose, read1, read2, read3, read4, pixData);
   pixelSensorFsm fsm1(.clk(clk),.reset(reset),.erase(erase),.expose(expose),.read1(read1),.read2(read2),.read3(read3),.read4(read4),.convert(convert));
   
   assign DATA = pixData;

endmodule
