module dispdecoder(
					data_in,
					disp_select,
					dp_s1hz,dp_s10hz,dp_s100hz,
					Q5,Q4,Q3,Q2,Q1,Q0,counter_out,
					data_out,
					dp);

output [6:0] data_out;
output dp;
input  [3:0] data_in;
input  [2:0] disp_select;
input  dp_s1hz,dp_s10hz,dp_s100hz;
input  [3:0] Q5,Q4,Q3,Q2,Q1,Q0;
input  counter_out;

reg dp;
reg [6:0] data_out;

reg hide;

initial 
begin
  dp <= 1'b0;
  hide <= 1'b0;
end
//译码显示数据
always @(data_in,hide,data_out)
begin
  if(hide == 1'b0)
  begin
	case(data_in)
    	4'b0000 : data_out <= 7'b1000000;  //0
		4'b0001 : data_out <= 7'b1111001;  //1
		4'b0010 : data_out <= 7'b0100100;  //2
		4'b0011 : data_out <= 7'b0110000;  //3
		4'b0100 : data_out <= 7'b0011001;  //4
		4'b0101 : data_out <= 7'b0010010;  //5
		4'b0110 : data_out <= 7'b0000010;  //6
		4'b0111 : data_out <= 7'b1110000;  //7
		4'b1000 : data_out <= 7'b0000000;  //8
		4'b1001 : data_out <= 7'b0010000;  //9
		default : data_out <= 7'b1111111;  //void
	endcase
  end
end

//小数点位置与零数字的处理
always @(disp_select,dp_s1hz,dp_s10hz,dp_s100hz,
         Q5,Q4,Q3,Q2,Q1,counter_out,dp,hide)
begin
  if (((disp_select == 3'b001) && (dp_s100hz == 1'b1))||
	  ((disp_select == 3'b011) && (dp_s10hz == 1'b1))||
      ((disp_select == 3'b101) && (dp_s1hz == 1'b1)))
    dp <= 1'b1;
  else
    dp <= 1'b0;
  case(disp_select)
    3'b000:  begin
               if((counter_out == 1'b1) && (Q5 == 4'b0))
                 hide <= 1'b1;
               else
                 hide <= 1'b0;
             end
    3'b001:  begin
               if((counter_out == 1'b1) && (Q5 == 4'b0) &&
										   (Q4 == 4'b0) &&
										   (dp_s100hz != 1'b1))
                 hide <= 1'b1;
               else
                 hide <= 1'b0;
             end
    3'b010:  begin
               if((counter_out == 1'b1) && (Q5 == 4'b0) && 
                                           (Q4 == 4'b0) && 
                                           (Q3 == 4'b0) &&
                                           (dp_s100hz != 1'b1))
                 hide <= 1'b1;
               else
                 hide <= 1'b0;
             end
    3'b011:  begin
               if((counter_out == 1'b1) && (Q5 == 4'b0) && 
                                           (Q4 == 4'b0) && 
                                           (Q3 == 4'b0) &&
                                           (Q2 == 4'b0) &&
                                           (dp_s100hz != 1'b1)&&
                                           (dp_s10hz != 1'b1))
                 hide <= 1'b1;
               else
                 hide <= 1'b0;
             end
    3'b100:  begin
               if((counter_out == 1'b1) && (Q5 == 4'b0) && 
                                           (Q4 == 4'b0) && 
                                           (Q3 == 4'b0) &&
                                           (Q2 == 4'b0) &&
                                           (Q1 == 4'b0) &&
                                           (dp_s100hz != 1'b1)&&
                                           (dp_s10hz != 1'b1))
                 hide <= 1'b1;
               else
                 hide <= 1'b0;
             end
    default:     hide <= 1'b0;
  endcase

end

endmodule
	