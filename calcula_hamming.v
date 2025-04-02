module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);

assign saida[2]  = entrada[0];
assign saida[4]  = entrada[1];
assign saida[5]  = entrada[2];
assign saida[6]  = entrada[3];
assign saida[8]  = entrada[4];
assign saida[9]  = entrada[5];
assign saida[10] = entrada[6];
assign saida[11] = entrada[7];
assign saida[12] = entrada[8];
assign saida[13] = entrada[9];
assign saida[14] = entrada[10];

// bits de paridade
assign saida[0] = saida[2] ^ saida[4] ^ saida[6] ^ saida[8] ^ saida[10] ^ saida[12] ^ saida[14];
assign saida[1] = saida[2] ^ saida[5] ^ saida[6] ^ saida[9] ^ saida[10] ^ saida[13] ^ saida[14];
assign saida[3] = saida[4] ^ saida[5] ^ saida[6] ^ saida[11] ^ saida[12] ^ saida[13] ^ saida[14];
assign saida[7] = saida[8] ^ saida[9] ^ saida[10] ^ saida[11] ^ saida[12] ^ saida[13] ^ saida[14];


endmodule
