module top (
    input [7:0] io_in,
    output [7:0] io_out,
    input clk,
    input rst
);

    wire moneda     = io_in[0];
    wire aceptar    = io_in[1];

    wire [2:0] producto;

    maquina_expendedora dut (
        .clk(clk),
        .reset(rst),
        .moneda(moneda),
        .aceptar(aceptar),
        .producto(producto)
    );

    assign io_out[2:0] = producto;
    assign io_out[7:3] = 5'b00000;  // No utilizados

endmodule
