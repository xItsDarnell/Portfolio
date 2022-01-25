#include "spimcore.h"
#include <stdio.h>


/* ALU */

/* Implement the operations on input parameters A and B according to ALUControl. */
/* Output the result (Z) to ALUresult. */
/* Assign Zero to 1 if the result is zero; otherwise, assign 0. */
/* The following table shows the operations of the ALU.*/

/* 10 Points */
void ALU(unsigned A,unsigned B,char ALUControl,unsigned *ALUresult,char *Zero)
{

	switch (ALUControl) 
    {
    case 0: // Add
		*ALUresult = A + B;
		break;
	
    case 1: // Subtract 
		*ALUresult = A - B;
		break;
	
    case 2: // Two Complemnt
		if ( (signed) A < (signed) B)
            *ALUresult = 1;
        else
            *ALUresult = 0;
		break;
	
    case 3: // Unsigned Case
		if (A < B)
			*ALUresult = 1;
		else
			*ALUresult = 0;
		break;
	
    case 4: //And case
		*ALUresult = A & B;
		break;
	case 5: //Or case
		*ALUresult = A | B;
		break;
	
    case 6:
		*ALUresult = B << 16;
		break;
	
    case 7: // A! case
		*ALUresult = ~A;
		break;
	}

	//if ALUresult is 0, then zero = 1, otherwise zero = 0
	if (*ALUresult == 0)
		*Zero = 1;
	else
		*Zero = 0;
}

/* instruction fetch */

/* Fetch the instruction addressed by PC from Mem and write it to instruction. */
/* Return 1 if a halt condition occurs; otherwise, return 0. */

/* 10 Points */
int instruction_fetch(unsigned PC,unsigned *Mem,unsigned *instruction)
{

    unsigned index = PC >> 2;

        if(PC % 4 != 0)
            return 1;

        *instruction = Mem[index];
        return 0;
}


/* instruction partition */

/* Partition instruction into several parts (op, r1, r2, r3, funct, offset, jsec). */
/* Return 1 if a halt condition occurs; otherwise, return 0.*/

/* 10 Points */
void instruction_partition(unsigned instruction, unsigned *op, unsigned *r1,unsigned *r2, unsigned *r3, unsigned *funct, unsigned *offset, unsigned *jsec)
{
    *op = (instruction >> 26) & 0b00000000000000000000000000111111; // [31-26]
	*r1 = (instruction >> 21) & 0b11111; // [25-21]
	*r2 = (instruction >> 16) & 0b11111; // [20-16]
	*r3 = (instruction >> 11) & 0b11111; // [15-11]
	*funct = instruction & 0b00000000000000000000000000111111; // [5-0]
	*offset = instruction & 0b00000000000000001111111111111111; // [15-0]
	*jsec = instruction & 0b00000011111111111111111111111111; // [25-0]
}



/* instruction decode */

/* 1. Decode the instruction using the opcode (op). */
/* 2. Assign the values of the control signals to the variables in the structure controls (See spimcore.h file). */
/* The meanings of the values of the control signals: */
/* For MemRead, MemWrite or RegWrite, the value 1 means that enabled, 0 means that disabled, 2 means “don’t care”. */
/* For RegDst, Jump, Branch, MemtoReg or ALUSrc, the value 0 or 1 indicates the selected path of the multiplexer; 2 means “don’t care”. */
/* Return 1 if a halt condition occurs; otherwise, return 0. */

/* 15 Points */
int instruction_decode(unsigned op,struct_controls *controls)
{
  switch(op)
    {
        case 0:
            controls->RegDst = 1;
            controls->RegWrite = 1;
            controls->ALUSrc = 0;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 7;
            break;

        //Addi
        case 8:
            controls->RegDst = 0;
            controls->RegWrite = 1;
            controls->ALUSrc = 1;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 0;
            break;
        
        //SLT
        case 10:
            controls->RegDst = 1;
            controls->RegWrite = 1;
            controls->ALUSrc = 0;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 2;
            break;
            
        //SLTU
        case 11:
            controls->RegDst = 1;
            controls->RegWrite = 1;
            controls->ALUSrc = 0 ;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 3;
            break;
            
        //BEQ
        case 4:
            controls->RegDst = 2;
            controls->RegWrite = 0;
            controls->ALUSrc = 0;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 2;
            controls->Jump = 0;
            controls->Branch = 1;
            controls->ALUOp = 1;
            break;
            
        //LW
        case 35:
            controls->RegDst = 0;
            controls->RegWrite = 1;
            controls->ALUSrc = 1;
            controls->MemRead = 1;
            controls->MemWrite = 0;
            controls->MemtoReg = 1;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 0;
            break;
            
        //LUI
        case 15:
            controls->RegDst = 0;
            controls->RegWrite = 1;
            controls->ALUSrc = 1;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 6;
            break;
            
        //SW
        case 43:
            controls->RegDst = 2;
            controls->RegWrite = 0;
            controls->ALUSrc = 1;
            controls->MemRead = 0;
            controls->MemWrite = 1;
            controls->MemtoReg = 2;
            controls->Jump = 0;
            controls->Branch = 0;
            controls->ALUOp = 0;
            break;

        //Jump
        case 2:
            controls->RegDst = 0;
            controls->RegWrite = 0;
            controls->ALUSrc = 0;
            controls->MemRead = 0;
            controls->MemWrite = 0;
            controls->MemtoReg = 0;
            controls->Jump = 1;
            controls->Branch = 0;
            controls->ALUOp = 0;
            break;
        default:
            return 1;
    }
    return 0;
}

/* Read Register */

/* Read the registers addressed by r1 and r2 from Reg, and write the read values to data1 and data2 respectively. */

/* 5 Points */
void read_register(unsigned r1,unsigned r2,unsigned *Reg,unsigned *data1,unsigned *data2)
{
    *data1 = Reg[r1];
    *data2 = Reg[r2];
}


/* Sign Extend */

/* Assign the sign-extended value of offset to extended_value. */

/* 10 Points */
void sign_extend(unsigned offset,unsigned *extended_value)
{
    unsigned negative = offset >> 15;
    
    if(negative == 1)
        *extended_value = offset | 0xFFFF0000;
    else
        *extended_value = offset & 0x0000FFFF;
}

/* ALU operations */

/* Apply ALU operations on data1, and data2 or extended_value (determined by ALUSrc). */
/* The operation performed is based on ALUOp and funct. */
/* Apply the function ALU(…). */
/* Output the result to ALUresult. */
/* Return 1 if a halt condition occurs; otherwise, return 0. */

/* 10 Points */
int ALU_operations(unsigned data1,unsigned data2,unsigned extended_value,unsigned funct,char ALUOp,char ALUSrc,unsigned *ALUresult,char *Zero)
{

	if (ALUSrc == 1) {
		data2 = extended_value;
	}

    if (ALUOp == 7) {
    	switch(funct) {
	    	// Add
	    	case 32:
	    		ALUOp = 0;
	    		break;
	    	// Subtract
	    	case 34:
	    		ALUOp = 1;
	    		break;
	    	// SLT
	    	case 42:
	    		ALUOp = 2;
	    		break;
	    	// SLTU
	    	case 43:
	    		ALUOp = 3;
	    		break;
	    	// And
	    	case 36:
	    		ALUOp = 4;
	    		break;
	    	// Or
	    	case 37:
	    		ALUOp = 5;
	    		break;
	    	// SLRV
	    	case 4:
	    		ALUOp = 6;
	    		break;
	    	// Nor
	    	case 39:
	    		ALUOp = 7;
	    		break;
	    	// Default
	    	default:
	    		return 1;
	    }
	    ALU(data1, data2, ALUOp, ALUresult, Zero);
    }
    else 
    	ALU(data1, data2, ALUOp, ALUresult, Zero);

    return 0;
}

/* Read / Write Memory */

/* Apply ALU operations on data1, and data2 or extended_value (determined by ALUSrc). */
/* The operation performed is based on ALUOp and funct. */
/* Apply the function ALU(…). */
/* Output the result to ALUresult. */
/* Return 1 if a halt condition occurs; otherwise, return 0. */

/* 10 Points */
int rw_memory(unsigned ALUresult,unsigned data2,char MemWrite,char MemRead,unsigned *memdata,unsigned *Mem)
{
        if(MemRead == 1)
        {
            if((ALUresult % 4) == 0)
                *memdata = Mem[ALUresult >> 2];         
            else
                return 1;     
        }
            
    if(MemWrite == 1)
    {
        if((ALUresult % 4) == 0)
            Mem[ALUresult >> 2] = data2;
        else
            return 1;
    }
    return 0;
}


/* Write Register */

/* Write the data (ALUresult or memdata) */
/* to a register (Reg) addressed by r2 or r3. */

/* 10 Points */
void write_register(unsigned r2,unsigned r3,unsigned memdata,unsigned ALUresult,char RegWrite,char RegDst,char MemtoReg,unsigned *Reg)
{
    if(RegWrite==1)
    {
        if(MemtoReg == 1 && RegDst == 0)
            Reg[r2] = memdata;
        
        else if(MemtoReg == 1 && RegDst == 1)
            Reg[r3] = memdata;
        
        else if(MemtoReg == 0 && RegDst == 0)
            Reg[r2] = ALUresult;
        
        else if(MemtoReg == 0 && RegDst == 1)
            Reg[r3] = ALUresult;
    }
}

/* PC update */

/* Update the program counter (PC). */

/* 10 Points */
void PC_update(unsigned jsec,unsigned extended_value,char Branch,char Jump,char Zero,unsigned *PC)
{

    *PC += 4;
    
    if(Zero == 1 && Branch == 1)
        *PC += extended_value << 2;

    if(Jump == 1)
        *PC = (jsec << 2) | (*PC & 0xf0000000);
}