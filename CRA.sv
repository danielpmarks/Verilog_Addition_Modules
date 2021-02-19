module CRA
(
	input [3:0] A,B,
	input Cin,
	output logic [3:0] S,
	output logic Cout
);
	
		logic C1,C2,C3;
		full_addr add0 (.a(A[0]),.b(B[0]),.cin(Cin),.s(S[0]),.cout(C1));
		full_addr add1 (.a(A[1]),.b(B[1]),.cin(C1),.s(S[1]),.cout(C2));
		full_addr add2 (.a(A[2]),.b(B[2]),.cin(C2),.s(S[2]),.cout(C3));
		full_addr add3 (.a(A[3]),.b(B[3]),.cin(C3),.s(S[3]),.cout(Cout));
	
	
endmodule
	