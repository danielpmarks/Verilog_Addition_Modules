module lookahead_adder (
	input [15:0] A, B,
	input cin,
	output [15:0] S,
	output cout, Pg, Gg
);
// The design is 4x4 hierarchical, so it is split into 4 parts
// CLU One -> P0-3 and G0-3 are portions of the P and G signals

logic P0, P1, P2, P3;
logic G0, G1, G2, G3;
logic C0, C4, C8, C12;

assign P0 = A[0] ^ B[0];
assign P1 = A[1] ^ B[1];
assign P2 = A[2] ^ B[2];
assign P3 = A[3] ^ B[3];

assign G0 = A[0] & B[0];
assign G1 = A[1] & B[1];	
assign G2 = A[2] & B[2];
assign G3 = A[3] & B[3];

//
assign Pg = P0 & P1 & P2 & P3;
assign Gg = G3 | (G2 & P3)|(G1 & P3 & P2)|(G0 & P3 & P2 & P1);

// Carry bits for CLAs
assign C0 = (cin);
assign C4 = (cin & (P0)) | (G0);
assign C8 = (cin & (P0) & (P1)) | ((G0) & (P1) | (G1);
assign C12 = (cin & (P0) & (P1) & (P2)) | ((G0) & (P1) & (P2)) | ((G1) & (P2)) | (G2);
assign cout = (C12 & P3) | (G3); 

// Carry outs aren't needed
// These 4 CLAs make up the 4x4 lookahead adder
CLA CLU1 (.a(A[3:0]),.b(B[3:0]),.cin(C0),.s(S[3:0]),.cout(), .P(P0), .G(G0));
CLA CLU2 (.a(A[7:4]),.b(B[7:4]),.cin(C4),.s(S[7:4]),.cout(), .P(P1), .G(G1));
CLA CLU3 (.a(A[11:8]),.b(B[11:8]),.cin(C8),.s(S[11:8]),.cout(), .P(P2), .G(G2));
CLA CLU4 (.a(A[15:13]),.b(B[15:13]),.cin(C12),.s(S[15:13]),.cout(), .P(P3), .G(G3));

endmodule
