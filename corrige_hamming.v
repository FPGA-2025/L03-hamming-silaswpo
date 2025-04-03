module corrige_hamming (
  input [14:0] entrada,
  output [10:0] saida
);

wire [3:0] posicao_erro;
reg [14:0] saida_temp;

// Cálculo da posição do erro (bits de paridade)
assign posicao_erro[0] = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign posicao_erro[1] = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign posicao_erro[2] = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
assign posicao_erro[3] = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

// Corrige o dado com base na posição do erro
always @(*) begin
  if (posicao_erro != 0)
    saida_temp = entrada ^ (15'b1 << (posicao_erro - 1));
  else
    saida_temp = entrada;
end

// Extrai os bits de dados
assign saida = {
  saida_temp[14], // d11
  saida_temp[13], // d10
  saida_temp[12], // d9
  saida_temp[11], // d8
  saida_temp[10], // d7
  saida_temp[9],  // d6
  saida_temp[8],  // d5
  saida_temp[6],  // d4
  saida_temp[5],  // d3
  saida_temp[4],  // d2
  saida_temp[2]   // d1
};

endmodule
