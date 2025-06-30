module alu_2bit (
    input [1:0] A,        // First 2-bit operand
    input [1:0] B,        // Second 2-bit operand
    input [2:0] sel,      // Operation select (control)
    output reg [2:0] Y    // 3-bit output to handle carry
);

always @(*) begin
    case (sel)
        3'b000: Y = A + B;        // Addition
        3'b001: Y = A - B;        // Subtraction
        3'b010: Y = {1'b0, A & B}; // AND
        3'b011: Y = {1'b0, A | B}; // OR
        3'b100: Y = {1'b0, A ^ B}; // XOR
        default: Y = 3'b000;
    endcase
end

endmodule
