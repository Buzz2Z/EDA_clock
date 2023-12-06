module N_bitcomparator#(
    parameter N = 4        //N: you can just set it from 1 ~ 16;
)(
    input   [15:0]    A,
    input   [15:0]    B,
    output  wire      equate
);

assign equate = (A[N:0] == B[N:0]);

endmodule