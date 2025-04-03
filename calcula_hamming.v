module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);

// Inserção dos bits de dados nos lugares corretos
assign saida[2]  = entrada[0];   // d1
assign saida[4]  = entrada[1];   // d2
assign saida[5]  = entrada[2];   // d3
assign saida[6]  = entrada[3];   // d4
assign saida[8]  = entrada[4];   // d5
assign saida[9]  = entrada[5];   // d6
assign saida[10] = entrada[6];   // d7
assign saida[11] = entrada[7];   // d8
assign saida[12] = entrada[8];   // d9
assign saida[13] = entrada[9];   // d10
assign saida[14] = entrada[10];  // d11

// Cálculo dos bits de paridade (paridade par)
assign saida[0] = saida[2] ^ saida[4] ^ saida[6] ^ saida[8] ^ saida[10] ^ saida[12] ^ saida[14]; // p1
assign saida[1] = saida[2] ^ saida[5] ^ saida[6] ^ saida[9] ^ saida[10] ^ saida[13] ^ saida[14]; // p2
assign saida[3] = saida[4] ^ saida[5] ^ saida[6] ^ saida[11] ^ saida[12] ^ saida[13] ^ saida[14]; // p4
assign saida[7] = saida[8] ^ saida[9] ^ saida[10] ^ saida[11] ^ saida[12] ^ saida[13] ^ saida[14]; // p8

endmodule
