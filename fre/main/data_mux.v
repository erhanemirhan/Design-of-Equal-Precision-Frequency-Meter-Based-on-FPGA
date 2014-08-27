module data_mux(disp_select,A0,A1,A2,A3,A4,A5,Q);

output [3:0] Q;
input  [2:0]disp_select;
input  [3:0] A0,A1,A2,A3,A4,A5;

reg [3:0] Q;

always @(disp_select,A5,A4,A3,A2,A1,A0,Q)
begin
  case(disp_select)
	  3'b000: Q <= A5;
	  3'b001: Q <= A4;
	  3'b010: Q <= A3;
	  3'b011: Q <= A2;
	  3'b100: Q <= A1;
	  3'b101: Q <= A0;
	  default: Q <= 4'b0;
  endcase
end
endmodule