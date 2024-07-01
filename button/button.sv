`timescale 1ns / 1ps

module button(
    input logic clk,
    input logic reset_n,
    input logic noisy,
    output logic debounced,
    output logic p_edge,
    output logic n_edge,
    output logic _edge
    );

    logic synced_noisy;
    logic debounced_signal;
    logic timer_done, timer_reset;
    
    // Synchronize the noisy input to the clock
    synchronizer sync(
        .clk(clk),
        .reset_n(reset_n),
        .D(noisy),
        .Q(synced_noisy)
    );

    // Debounce the synchronized signal
    debouncer_delayed_fsm fsm (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(synced_noisy),
        .timer_done(timer_done),
        .timer_reset(timer_reset),
        .debounced(debounced_signal)
    );
    
    // 20 ms timer for debounce
    timer_parameter #(.FINAL_VALUE(1_999_999)) timer (
        .clk(clk),
        .reset_n(~timer_reset),
        .enable(~timer_reset),
        .done(timer_done)
    );
    
    // Edge detection for the debounced signal
    edge_detector edge_det (
        .clk(clk),
        .reset_n(reset_n),
        .level(debounced_signal),
        .p_edge(p_edge),
        .n_edge(n_edge),
        ._edge(_edge)
    );
    
    assign debounced = debounced_signal;

endmodule
