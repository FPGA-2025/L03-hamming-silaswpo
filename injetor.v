module injetor (
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output [14:0] saida
);

assign saida = erro ? (entrada ^ (15'b1 << n)) : entrada;

endmodule
