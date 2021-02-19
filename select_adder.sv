module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);


    logic C4,C8,C12, one, zero;
	 assign one = 1'b1;
	 assign zero = 1'b0;
	 
	 
	 // First CRA, no MUX
	 CRA adder0(A[3:0],B[3:0],cin,S[3:0],C4);
	 
	 
	 /* FIRST MUX LAYER */
	 
		 logic [3:0] withC4,noC4;
		 //Store the carry out of each adder in the first layer
		 logic zeroC8,oneC8;
		 //Calculate each sum in the first layer
		 CRA adder1NoC(A[7:4],B[7:4],zero,noC4,zeroC8);
		 CRA adder1WithC(A[7:4],B[7:4],one,withC4,oneC8);
		 
		 //4 bit MUX to store the correct sum into the output
		 assign S[7:4] = C4 ? withC4 : noC4;
		 
		 //Next carry bit
		 assign C8 = zeroC8 | (C4 & oneC8);
	 
	 
	 /* SECOND MUX LAYER */
	
		 logic [3:0] withC8,noC8;
		 //Store the carry out of each adder in the second layer
		 logic zeroC12,oneC12;
		 //Calculate each sum in the second layer
		 CRA adder2NoC(A[11:8],B[11:8],zero,noC8,zeroC12);
		 CRA adder2WithC(A[11:8],B[11:8],one,withC8,oneC12);
		 
		 //4 bit MUX to store the correct sum into the output
		 assign S[11:8] = C8 ? withC8 : noC8;
		 
		 //Next carry bit
		 assign C12 = zeroC12 | (C8 & oneC12);
		 
		 
		 
	 /* THIRD MUX LAYER */
	
		 logic [3:0] withC12,noC12;
		 //Store the carry out of each adder in the second layer
		 logic zeroCout,oneCout;
		 //Calculate each sum in the second layer
		 CRA adder3NoC(A[15:12],B[15:12],zero,noC12,zeroCout);
		 CRA adder3WithC(A[15:12],B[15:12],one,withC12,oneCout);
		 
		 //4 bit MUX to store the correct sum into the output
		 assign S[15:12] = C12 ? withC12 : noC12;
		 
		 //Next carry bit
		 assign Cout = zeroCout | (C12 & oneCout);

endmodule
