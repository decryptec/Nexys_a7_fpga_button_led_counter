`timescale 1ns / 1ps

module synchronizer
    #(parameter STAGES = 2)(
    input logic clk, reset_n,
    input logic D,
    output logic Q
    );
    
    logic [STAGES - 1:0] Q_reg;
    always_ff @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= {D, Q_reg[STAGES - 1:1]};
    end
    
    assign Q = Q_reg[0];
endmodule