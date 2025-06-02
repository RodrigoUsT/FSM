module maquina_expendedora (
    input clk,
    input reset,
    input moneda,
    input aceptar,
    output reg [2:0] producto
);

    reg [2:0] credito;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            credito <= 3'b000;
            producto <= 3'b000;
        end else begin
            if (moneda && (credito < 3'b101)) begin
                credito <= credito + 1;
            end

            if (aceptar) begin
                producto <= credito;
                credito <= 3'b000;
            end else begin
                producto <= 3'b000;
            end
        end
    end

endmodule
