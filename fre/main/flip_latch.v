module flip_latch(clk,A0,A1,A2,A3,A4,A5,Q0,Q1,Q2,Q3,Q4,Q5);

output [3:0] Q0,Q1,Q2,Q3,Q4,Q5;
input  clk;
input  [3:0] A0,A1,A2,A3,A4,A5;

reg [3:0] Q0,Q1,Q2,Q3,Q4,Q5;

always @(posedge clk)
begin
	Q0 <= A0;
	Q1 <= A1;
	Q2 <= A2;
	Q3 <= A3;
	Q4 <= A4;
	Q5 <= A5;
end
endmodule