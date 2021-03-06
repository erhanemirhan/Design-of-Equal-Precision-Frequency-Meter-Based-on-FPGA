module LCD_1602(
				input              	CLK,               			// 50MHz时钟
				input				RST_n,
				// Input frequency
				input	[71:0]		CLK_Data,	
				//LCD1602 Interface
				output             	LCD_EN,		// 使能信号
				output 	reg         LCD_RS,     // 指令、数据选择
				output             	LCD_RW ,    // 读、写选择
				output	reg	[7:0]	LCD_Data    // 数据总线
				);  

reg		[15:0] 		cnt;                         //计数分频得到lcd_clk
wire 				lcd_clk=cnt[15];     
reg 	[127:0] 	Line_Rom1 = "Frequency Count ";	//怎么写成wire，reg都可以
wire	[127:0]		Line_Rom2 = {"Data:",CLK_Data,"Hz"};


assign 	LCD_EN  = lcd_clk;                // 数据在时钟高电平被锁存                 
assign 	LCD_RW 	= 1'b0;                   // 只写  

always @ (posedge CLK or negedge RST_n)
begin
	if(!RST_n)
		cnt <= 0;
	else
		cnt <= cnt + 1'b1;	
end
                                 
// 格雷码编码：共40个状态
parameter 	IDLE        	= 8'h00;	//空闲，初始化
// 写指令，初始化
parameter	DISP_SET     	= 8'h01;         // 显示模式设置
parameter 	DISP_OFF     	= 8'h03;         // 显示关闭
parameter 	CLR_SCR      	= 8'h02;         // 显示清屏
parameter 	CURSOR_SET1  	= 8'h06;         // 显示光标移动设置
parameter 	CURSOR_SET2  	= 8'h07;         // 显示开及光标设置
// 显示第一行
parameter 	ROW1_ADDR    	= 8'h05;         // 写第1行起始地址
parameter 	ROW1_0       	= 8'h04;
parameter 	ROW1_1       	= 8'h0C;
parameter 	ROW1_2       	= 8'h0D;
parameter 	ROW1_3       	= 8'h0F;
parameter 	ROW1_4       	= 8'h0E;
parameter 	ROW1_5       	= 8'h0A;
parameter 	ROW1_6       	= 8'h0B;
parameter 	ROW1_7       	= 8'h09;
parameter 	ROW1_8       	= 8'h08;
parameter 	ROW1_9       	= 8'h18;
parameter 	ROW1_A       	= 8'h19;
parameter 	ROW1_B       	= 8'h1B;
parameter 	ROW1_C       	= 8'h1A;
parameter 	ROW1_D       	= 8'h1E;
parameter 	ROW1_E       	= 8'h1F;
parameter 	ROW1_F       	= 8'h1D;
// 显示第二行
parameter 	ROW2_ADDR    	= 8'h1C;         // 写第2行起始地址
parameter 	ROW2_0       	= 8'h14;
parameter 	ROW2_1       	= 8'h15;
parameter 	ROW2_2       	= 8'h17;
parameter 	ROW2_3       	= 8'h16;
parameter 	ROW2_4       	= 8'h12;
parameter 	ROW2_5       	= 8'h13;
parameter 	ROW2_6       	= 8'h11;
parameter 	ROW2_7       	= 8'h10;
parameter 	ROW2_8       	= 8'h30;
parameter 	ROW2_9       	= 8'h31;
parameter 	ROW2_A       	= 8'h33;
parameter 	ROW2_B       	= 8'h32;
parameter 	ROW2_C       	= 8'h36;
parameter 	ROW2_D       	= 8'h37;
parameter 	ROW2_E       	= 8'h35;
parameter 	ROW2_F       	= 8'h34;

reg [5:0] current_state, next_state;    // 现态、次态

// FSM: always1
always @ (posedge lcd_clk or negedge RST_n)
begin
	if(!RST_n)
		current_state <= IDLE;
	else
		current_state <= next_state;
end

// FSM: always2
always
begin
	case(current_state)
	IDLE        	: 	next_state = DISP_SET;
	// 写指令，初始化
	DISP_SET    	: 	next_state = DISP_OFF;
	DISP_OFF    	: 	next_state = CLR_SCR;
	CLR_SCR     	:	next_state = CURSOR_SET1;
	CURSOR_SET1 	: 	next_state = CURSOR_SET2;
	CURSOR_SET2 	: 	next_state = ROW1_ADDR;
	// 显示第一行
	ROW1_ADDR   	: 	next_state = ROW1_0;
	ROW1_0      	: 	next_state = ROW1_1;
	ROW1_1      	: 	next_state = ROW1_2;
	ROW1_2      	: 	next_state = ROW1_3;
	ROW1_3      	: 	next_state = ROW1_4;
	ROW1_4      	: 	next_state = ROW1_5;
	ROW1_5      	: 	next_state = ROW1_6;
	ROW1_6      	: 	next_state = ROW1_7;
	ROW1_7      	: 	next_state = ROW1_8;
	ROW1_8      	: 	next_state = ROW1_9;
	ROW1_9      	: 	next_state = ROW1_A;
	ROW1_A      	: 	next_state = ROW1_B;
	ROW1_B      	: 	next_state = ROW1_C;
	ROW1_C      	: 	next_state = ROW1_D;
	ROW1_D      	: 	next_state = ROW1_E;
	ROW1_E      	: 	next_state = ROW1_F;
	ROW1_F      	: 	next_state = ROW2_ADDR;
	// 显示第二行
	ROW2_ADDR   	: 	next_state = ROW2_0; 
	ROW2_0      	: 	next_state = ROW2_1;
	ROW2_1      	: 	next_state = ROW2_2;
	ROW2_2      	: 	next_state = ROW2_3;
	ROW2_3      	:	next_state = ROW2_4;
	ROW2_4      	: 	next_state = ROW2_5;
	ROW2_5      	: 	next_state = ROW2_6;
	ROW2_6      	: 	next_state = ROW2_7;
	ROW2_7      	: 	next_state = ROW2_8;
	ROW2_8      	: 	next_state = ROW2_9;
	ROW2_9      	: 	next_state = ROW2_A;
	ROW2_A      	: 	next_state = ROW2_B;
	ROW2_B      	: 	next_state = ROW2_C;
	ROW2_C      	: 	next_state = ROW2_D;
	ROW2_D      	: 	next_state = ROW2_E;
	ROW2_E      	: 	next_state = ROW2_F;
	ROW2_F      	: 	next_state = ROW1_ADDR;
	default     	: 	next_state = IDLE ;
	endcase
end

// FSM: always3
always @ (posedge lcd_clk or negedge RST_n)
begin
	if(!RST_n)
		begin
		LCD_RS <= 0;
		LCD_Data <= 8'hxx;
		end
	else
		begin
			// 写LCD_RS
			case(next_state)      
			IDLE        	: LCD_RS <= 0;	//指令
			// 写指令，初始化
			DISP_SET    	: LCD_RS <= 0;	//指令
			DISP_OFF    	: LCD_RS <= 0;	//指令
			CLR_SCR     	: LCD_RS <= 0;	//指令
			CURSOR_SET1 	: LCD_RS <= 0;	//指令
			CURSOR_SET2 	: LCD_RS <= 0;	//指令
			// 写数据，显示第一行
			ROW1_ADDR   	: LCD_RS <= 0;	//指令
			ROW1_0      	: LCD_RS <= 1;	//数据
			ROW1_1      	: LCD_RS <= 1;	//数据
			ROW1_2      	: LCD_RS <= 1;	//数据
			ROW1_3      	: LCD_RS <= 1;	//数据
			ROW1_4      	: LCD_RS <= 1;	//数据
			ROW1_5      	: LCD_RS <= 1;	//数据
			ROW1_6      	: LCD_RS <= 1;	//数据
			ROW1_7      	: LCD_RS <= 1;	//数据
			ROW1_8      	: LCD_RS <= 1;	//数据
			ROW1_9      	: LCD_RS <= 1;	//数据
			ROW1_A      	: LCD_RS <= 1;	//数据
			ROW1_B      	: LCD_RS <= 1;	//数据
			ROW1_C      	: LCD_RS <= 1;	//数据
			ROW1_D      	: LCD_RS <= 1; 	//数据
			ROW1_E      	: LCD_RS <= 1;	//数据
			ROW1_F      	: LCD_RS <= 1;	//数据
			// 写数据，显示第二行
			ROW2_ADDR   	: LCD_RS <= 0;	//指令
			ROW2_0      	: LCD_RS <= 1;	//数据
			ROW2_1     	: LCD_RS <= 1;	//数据
			ROW2_2      	: LCD_RS <= 1;	//数据
			ROW2_3      	: LCD_RS <= 1;	//数据
			ROW2_4      	: LCD_RS <= 1;	//数据
			ROW2_5      	: LCD_RS <= 1;	//数据
			ROW2_6      	: LCD_RS <= 1;	//数据
			ROW2_7      	: LCD_RS <= 1;	//数据
			ROW2_8      	: LCD_RS <= 1;	//数据
			ROW2_9      	: LCD_RS <= 1;	//数据
			ROW2_A      	: LCD_RS <= 1;	//数据
			ROW2_B      	: LCD_RS <= 1;	//数据
			ROW2_C      	: LCD_RS <= 1;	//数据
			ROW2_D      	: LCD_RS <= 1; 	//数据
			ROW2_E      	: LCD_RS <= 1;	//数据
			ROW2_F      	: LCD_RS <= 1;	//数据
			endcase   

			// 写LCD_Data
			case(next_state)
			IDLE        	: LCD_Data <= 8'hxx;
			// 写指令，初始化
			DISP_SET    	: LCD_Data <= 8'h38;	//设置16X2显示,5X7阵列,8位数据接口
			DISP_OFF    	: LCD_Data <= 8'h08;	//设置显示功能关,无光标,无显示
			CLR_SCR     	: LCD_Data <= 8'h01;	//清显示,光标复位到00H位置
			CURSOR_SET1 	: LCD_Data <= 8'h06;	//显示地址递增，即写一个数据后，显示位置右移一位
			CURSOR_SET2 	: LCD_Data <= 8'h0C;	//开启显示屏，关光标，光标不闪烁
			// 写数据，显示第一行
			ROW1_ADDR   	: LCD_Data <= 8'h80;	//令字符在第一行显示
			ROW1_0      	: LCD_Data <= Line_Rom1[127:120];
			ROW1_1      	: LCD_Data <= Line_Rom1[119:112];
			ROW1_2      	: LCD_Data <= Line_Rom1[111:104];
			ROW1_3      	: LCD_Data <= Line_Rom1[103: 96];
			ROW1_4      	: LCD_Data <= Line_Rom1[ 95: 88];
			ROW1_5      	: LCD_Data <= Line_Rom1[ 87: 80];
			ROW1_6      	: LCD_Data <= Line_Rom1[ 79: 72];
			ROW1_7      	: LCD_Data <= Line_Rom1[ 71: 64];
			ROW1_8      	: LCD_Data <= Line_Rom1[ 63: 56];
			ROW1_9      	: LCD_Data <= Line_Rom1[ 55: 48];
			ROW1_A      	: LCD_Data <= Line_Rom1[ 47: 40];
			ROW1_B      	: LCD_Data <= Line_Rom1[ 39: 32];
			ROW1_C      	: LCD_Data <= Line_Rom1[ 31: 24];
			ROW1_D      	: LCD_Data <= Line_Rom1[ 23: 16]; 
			ROW1_E      	: LCD_Data <= Line_Rom1[ 15:  8];
			ROW1_F      	: LCD_Data <= Line_Rom1[  7:  0];
			// 写数据，显示第二行
			ROW2_ADDR   	: LCD_Data <= 8'hC0;	//令字符在第一行显示
			ROW2_0      	: LCD_Data <= Line_Rom2[127:120];
			ROW2_1      	: LCD_Data <= Line_Rom2[119:112];
			ROW2_2      	: LCD_Data <= Line_Rom2[111:104];
			ROW2_3      	: LCD_Data <= Line_Rom2[103: 96];
			ROW2_4      	: LCD_Data <= Line_Rom2[ 95: 88];
			ROW2_5      	: LCD_Data <= Line_Rom2[ 87: 80];
			ROW2_6      	: LCD_Data <= Line_Rom2[ 79: 72];
			ROW2_7      	: LCD_Data <= Line_Rom2[ 71: 64];
			ROW2_8      	: LCD_Data <= Line_Rom2[ 63: 56];
			ROW2_9      	: LCD_Data <= Line_Rom2[ 55: 48];
			ROW2_A      	: LCD_Data <= Line_Rom2[ 47: 40];
			ROW2_B      	: LCD_Data <= Line_Rom2[ 39: 32];
			ROW2_C      	: LCD_Data <= Line_Rom2[ 31: 24];
			ROW2_D      	: LCD_Data <= Line_Rom2[ 23: 16];
			ROW2_E      	: LCD_Data <= Line_Rom2[ 15:  8];
			ROW2_F      	: LCD_Data <= Line_Rom2[  7:  0];
			endcase 
		end 
end

endmodule
