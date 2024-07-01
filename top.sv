`timescale 1ns / 1ps

module top #(parameter B = 4)(
  input logic clk,
  input logic reset_n,
  input logic add_button, sub_button, // write enable input
  output logic [B - 1:0] LED
);

  logic inc, dec;

  button add_button (
    .clk(clk),
    .reset_n(reset_n),
    .noisy(add_button),
    .debounced(),
    .p_edge(inc),
    .n_edge(),
    ._edge()
  );
    //Subtract button
  button sub_button (
    .clk(clk),
    .reset_n(reset_n),
    .noisy(sub_button),
    .debounced(debounced),
    .p_edge(dec),
    .n_edge(),
    ._edge()
  );

  // LED incrementer
  LED #(
    .B(B)
  ) u_LED (
    .clk(clk),
    .reset(reset_n),
    .add(inc),
    .sub(dec),
    .LED(LED)
  );
endmodule
