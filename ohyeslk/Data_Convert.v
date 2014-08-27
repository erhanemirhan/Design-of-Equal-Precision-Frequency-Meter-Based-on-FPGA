module Data_Convert(
					input				CLK,
					input		[29:0]	Data_in,
					output		[71:0]	Data_out
					);
reg	[3:0]	D8,D7,D6,D5,D4,D3,D2,D1,D0;

always@(posedge CLK)
begin
	D0 <= Data_in % 10;
	D1 <= Data_in /10 % 10;
	D2 <= Data_in /100 % 10;
	D3 <= Data_in /1000 % 10;
	D4 <= Data_in /10000 % 10;
	D5 <= Data_in /100000 % 10;
	D6 <= Data_in /1000000 % 10;
	D7 <= Data_in /10000000 % 10;
	D8 <= Data_in /100000000;  
end
						
Ascii_Convert UA0(
				.CLK		(CLK),
				.Data_in	(D0),
				.Ascii_out	(Data_out[7:0])
				);
Ascii_Convert UA1(
				.CLK		(CLK),
				.Data_in	(D1),
				.Ascii_out	(Data_out[15:8])
				);
Ascii_Convert UA2(
				.CLK		(CLK),
				.Data_in	(D2),
				.Ascii_out	(Data_out[23:16])
				);
Ascii_Convert UA3(
				.CLK		(CLK),
				.Data_in	(D3),
				.Ascii_out	(Data_out[31:24])
				);
Ascii_Convert UA4(
				.CLK		(CLK),
				.Data_in	(D4),
				.Ascii_out	(Data_out[39:32])
				);
Ascii_Convert UA5(
				.CLK		(CLK),
				.Data_in	(D5),
				.Ascii_out	(Data_out[47:40])
				);
Ascii_Convert UA6(
				.CLK		(CLK),
				.Data_in	(D6),
				.Ascii_out	(Data_out[55:48])
				);
Ascii_Convert UA7(
				.CLK		(CLK),
				.Data_in	(D7),
				.Ascii_out	(Data_out[63:56])
				);
				
Ascii_Convert UA8(
				.CLK		(CLK),
				.Data_in	(D8),
				.Ascii_out	(Data_out[71:64])
				);


endmodule
