module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo (dado[8])
  output  [10:0] saida
);
wire [3:0] erro;

// bits que indicam posição do erro
assign erro[0] = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign erro[1] = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign erro[2] = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
assign erro[3] = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

// Corrige o erro invertendo o bit errado (se houver erro)
wire [14:0] recebido_corrigido = (erro != 0) ? recebido ^ (15'b000000000000001 << (erro - 1)) : recebido;

// extrai os dados corrigidos
assign saida = {recebido_corrigido[14:12], recebido_corrigido[11:8], recebido_corrigido[6:4], recebido_corrigido[2]};


endmodule
