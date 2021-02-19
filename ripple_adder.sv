module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);


		 logic c4,c8,c12;
		 
		 CRA add0(A[3:0],B[3:0],cin,S[3:0],c4);
		 CRA add1(A[7:4],B[7:4],c4,S[7:4],c8);
		 CRA add2(A[11:8],B[11:8],c8,S[11:8],c12);
		 CRA add3(A[15:12],B[15:12],c12,S[15:12],cout);

	 
     
endmodule
