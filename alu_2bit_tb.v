`timescale 1ns / 1ps

module alu_2bit_tb;

reg [1:0] A;
reg [1:0] B;
reg [2:0] sel;
wire [2:0] Y;

alu_2bit uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);

initial begin
    $display("Time\tA\tB\tsel\tY");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, A, B, sel, Y);

    // Test Addition
    A = 2'b01; B = 2'b10; sel = 3'b000; #10;

    // Test Subtraction
    A = 2'b11; B = 2'b01; sel = 3'b001; #10;

    // Test AND
    A = 2'b10; B = 2'b01; sel = 3'b010; #10;

    // Test OR
    A = 2'b10; B = 2'b01; sel = 3'b011; #10;

    // Test XOR
    A = 2'b11; B = 2'b10; sel = 3'b100; #10;

    // Default case
    sel = 3'b111; #10;

    $finish;
end

endmodule
