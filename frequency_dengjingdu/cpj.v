module cpj(sel,gate,clkx,clkbz,int1,out8,clr,y,y2);//
input gate,clkx,clkbz,clr;
input [2:0]sel;
output [7:0]out8;
output int1;
output y,y2;
wire en,dcen,load,load1;//????
wire[31:0]out,out1,out2,ou,ou1;
rmk(gate,clkbz,clr,en,y);
sjzm(en,clkx,clr,out,dcen,y2);
bzjs(dcen,clkbz,clr,out2,int1);
mux4to1(int1,sel,out2,out,out8,clr);
endmodule
module rmk(gate1,clkin,clr0,en,y);//????????
input gate1,clkin,clr0;
output en;
output y;
reg en;
reg y;
reg[31:0]clkjcq;
always@(posedge clkin or posedge clr0)
begin
      if(clr0)
      begin
        clkjcq<=32'b0;
        en<=0;
        y=0;
      end
    else
    if(clkjcq==50000000)
      begin
        clkjcq<=50000000;
        en<=1'b0;
        y=1'b1;
      end
    else
      begin
        clkjcq<=clkjcq+1;
        en<=1'b1;
        y=1'b0;
      end
/*
begin
     if(clr0)
      begin
        clkjcq<=0;
        en<=0;
      end
    else
    if(clkjcq==500000000)
      begin
        clkjcq<=500000000;
        en<=0;
      end
    else
      begin
        clkjcq<=#1clkjcq+1;
        en<=1;
      end
end*/
end
endmodule
module sjzm(en1,clk1,clr1,out1,dcen,y2);//??????
input en1,clk1,clr1;
output[31:0]out1;
reg[31:0]out1;
output dcen;
output y2;
reg y2;
reg dcen;
always @ (posedge clk1 or posedge clr1)      //????????????????
  begin
    if(clr1)
      begin
        out1<=32'b0;
        dcen<=1'b0;
        y2<=1'b0;
      end
    else if(en1==1)
      begin
        out1<=out1+1;
        dcen<=1'b1;
        y2<=1'b1;
      end
    else if(out1)
      begin
        dcen<=1'b0;
      end
end
endmodule
module bzjs(en2,clk2,clr2,out2,load);//??????
input en2,clk2,clr2;
output[31:0]out2;
reg[31:0]out2;
output load;
reg load;
always @ (posedge clk2 or posedge clr2)      
  begin
    if(clr2)
      begin
        out2<=32'b0;
        load<=1'b0;
      end
    else if(en2)
      begin
        out2<=out2+1;
      end
    else if(out2)
      begin
        load<=1'b1;
      end
  end
endmodule
/*
module launch1(aload,in,ou,load1);//????1
input aload;
input[31:0]in;
output[31:0]ou;
reg[31:0]ou;
output load1;
reg load1;
always
if(aload)
begin
ou=in;
load1=#1aload;
end
else
begin
ou<=#1ou;
load1=0;
end
endmodule
module launch2(aload1,in1,ou1);//????2
input aload1;
input[31:0]in1;
output[31:0]ou1;
reg[31:0]ou1;
always
if(aload1)
ou1<=#1in1;
endmodule*/
module mux4to1(load,sel,bzin32,in32,out8,clr);        
   input[2:0]sel;
   input[31:0]in32,bzin32;
input load,clr;
output [7:0]out8;
reg [7:0]out8;
wire[2:0]sel;
always@(sel or clr or load )
begin
if(clr)out8=0;
else if(load)
begin 
case (sel)
3'b000:out8=in32[7:0];
3'b001:out8=in32[15:8];
3'b010:out8=in32[23:16];
3'b011:out8=in32[31:24];
3'b100:out8=bzin32[7:0];
3'b101:out8=bzin32[15:8];
3'b110:out8=bzin32[23:16];
3'b111:out8=bzin32[31:24];
endcase
end
end
endmodule






