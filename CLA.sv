module CLA( input [3:0] A, B, 
				input Cin,
				output [3:0] S, 
				output P, G, Cout);
	logic P0,P1,P2,P3;
	
	logic G0,G1,G2,G3;
	
	logic C1,C2,C3;
	
	assign P0 = A[0]^B[0];
	assign P1 = A[1]^B[1];
	assign P2 = A[2]^B[2];
	assign P3 = A[3]^B[3];
	
	assign G0 = A[0]&B[0];
	assign G1 = A[1]&B[1];	
	assign G2 = A[2]&B[2];
	assign G3 = A[3]&B[3];
	
	assign P = P0&P1&P2&P3;
	assign G = G3|(G2&P3)|(G1&P3&P2)|(G0&P3&P2&P1);
	
	CRA adder(.a(A),.b(B),.cin(Cin),.s(S),.cout(Cout));
	
endmodule
	
	