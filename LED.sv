`timescale 1ns / 1ps

module LED #(
  parameter B = 16
) (
  input logic clk,
  reset,
  add,
  sub,
  output logic [B-1:0] LED
);
  localparam logic [B-1:0] MAX = {B{1'b1}};

  always_ff @(posedge clk or negedge reset) begin
    if (~reset) LED <= 'b0;
    else if (add) begin
      if (LED < MAX) LED <= LED + 1;
    end else if (sub) begin
      if (LED > 0) LED <= LED - 1;
    end
  end
endmodule
