module Ascii_Convert(
					input				CLK,
					input		[3:0]	Data_in,
					output	reg	[7:0]	Ascii_out
					);
always@(posedge CLK)
begin
	case(Data_in)
	4'd0:	Ascii_out	<=	8'd48;	
	4'd1:	Ascii_out	<=	8'd49;
	4'd2:	Ascii_out	<=	8'd50;
	4'd3:	Ascii_out	<=	8'd51;
	4'd4:	Ascii_out	<=	8'd52;
	4'd5:	Ascii_out	<=	8'd53;
	4'd6:	Ascii_out	<=	8'd54;
	4'd7:	Ascii_out	<=	8'd55;
	4'd8:	Ascii_out	<=	8'd56;
	4'd9:	Ascii_out	<=	8'd57;
	default:Ascii_out	<=	Ascii_out;
	endcase
end

endmodule