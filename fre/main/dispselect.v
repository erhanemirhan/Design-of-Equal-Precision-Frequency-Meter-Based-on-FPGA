module dispselect(clk,disp_select,Q);

output [5:0] Q;
output [2:0] disp_select;
input  clk;

reg [5:0] Q;
reg [2:0] disp_select;

always @(posedge clk)
begin
	if(disp_select < 3'b101)
		disp_select <= disp_select + 3'b1;
	else
		disp_select <= 3'b0;
	case(disp_select)
	  3'b000: Q <= 6'b100000;
	  3'b001: Q <= 6'b010000;
	  3'b010: Q <= 6'b001000;
	  3'b011: Q <= 6'b000100;
	  3'b100: Q <= 6'b000010;
	  3'b101: Q <= 6'b000001;
	  default: Q <= 6'b000000;  
	endcase
end
endmodule