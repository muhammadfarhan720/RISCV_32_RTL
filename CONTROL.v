
module CONTROL(
     opcode,
     RegDst,
     Branch,
     MemRead,
     MemtoReg,
     MemWrite,
     ALUSrc,
     RegWrite,
     ALUOp
    );

input [5:0] opcode;
output RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output [1:0] ALUOp;
reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
reg [1:0] ALUOp;


always @(*)
begin

casez(opcode)

6'b000000: {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUOp} = 9'b100100010; //r controls
6'b100011: {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUOp}=9'b011110000;  //lw controls
6'b101011: {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUOp}=9'bx1x001000;  //sw controls
6'b000100: {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUOp}=9'bx0x000101;  //beq controls
default: {RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,ALUOp}=9'b0;
endcase
end


//if(opcode==6'b000000) //r controls
//begin
//RegDst<=1'b1;
//ALUSrc<=1'b0;
//MemtoReg<=1'b0;
//RegWrite<=1'b1;
//MemRead<=1'b0;
//MemWrite<=1'b0;
//Branch<=1'b0;
//ALUOp<=2'b10;
//end
//if(opcode==6'b100011) //lw controls
//begin
//RegDst<=1'b0;
//ALUSrc<=1'b1;
//MemtoReg<=1'b1;
//RegWrite<=1'b1;
//MemRead<=1'b1;
//MemWrite<=1'b0;
//Branch<=1'b0;
//ALUOp<=2'b00;
//end
//if(opcode==6'b101011) //sw controls
//begin
//RegDst<=1'bx;
//ALUSrc<=1'b1;
//MemtoReg<=1'bx;
//RegWrite<=1'b0;
//MemRead<=1'b0;
//MemWrite<=1'b1;
//Branch<=1'b0;
//ALUOp<=2'b00;
//end
//if(opcode==6'b000100) //beq controls
//begin
//RegDst<=1'bx;
//ALUSrc<=1'b0;
//MemtoReg<=1'bx;
//RegWrite<=1'b0;
//MemRead<=1'b0;
//MemWrite<=1'b0;
//Branch<=1'b1;
//ALUOp<=2'b01;
//end
//end
endmodule
