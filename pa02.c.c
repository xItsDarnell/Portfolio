/*=============================================================================
|   Assignment:  pa02 - Calculating an 8, 16, or 32 bit checksum
|                       for a simple ASCII file containing only ASCII
|                       characters. This file is terminated by a NEWLINE
|                       character which has a hexadecimal value of ’0a’.
|
|       Author:  Dawnelle Metayer
|     Language:  C
|
|   To Compile: gcc -o pa02 pa02.c
|                
|
|   To Execute:  c    -> ./pa02 
|                         where inputFilename.txt is the ASCII text file
|                         and 8 is the checksum size in bits
|                         (Valid options are 8, 16, & 32)
|
|         Note:  All input files are simple 8 bit ASCII input
|
|        Class:  CIS3360 - Security in Computing - Summer 2021
|   Instructor:  McAlpin
|     Due Date:  Monday, July 26th, 2021
|
+=============================================================================*/
#define TEXT_MAX_LENGTH 1000 // used in Visual studio


//Defining library functions
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//The first parameter will be the nameof the input file for calculating the checksum.  
//The second parameter will be for the size of thechecksum (8, 16, or 32 bits)

void calculateCheckSum(int size, char *input, unsigned int long *check);
void calculateFileInputCheckSum(char *file, int size);
unsigned int long calculateBitMask(char *input, int checkSize);


void calculateCheckSum(int size, char *input, unsigned int long *check)
{
    unsigned int long BitMask;

    //Calling the bitmask computation with input and size. 
    BitMask = calculateBitMask(input, size);

    //Derive the checksum for 8, 16, & 32 bits.
    *check = BitMask + *check;
    *check = BitMask << (64 - *check);
    *check = BitMask >> (64 - *check);


}

//Calculate the 8, 16, & 32 bit checksum.
//Remember that the checksum is a running total withnooverflow.
//Resolve the calculations and padding for all checksums.

void calculateFileInputCheckSum(char *file, int checkSize)
{
    //Initializing FILE variable 
    FILE *infile;

    //Checksum & inputChar are used to allocate memory for by calculating the length of char/stirngLength
    int charValue = 0, charCount = 0, stringLength;
    
    unsigned int long *checksum;
    char *inputChar;
    int i = 0, j = 0, k = 0;

    stringLength = checkSize / 8 + 1;
    checksum = calloc(1, sizeof(char));
    inputChar = malloc(sizeof(char)* stringLength);


    infile = fopen(file, "r");

    if (infile == NULL)
        {
            printf("File cannot be opened. \n Exiting program. \n");
            exit(0);
        }
    
    //While loop until end of file is reached
    while (charValue != EOF)
    {
        //Checks if the length of the word is equal to 1 
        if ((stringLength - i) == 1)
        {
            inputChar[i] = '\0';
            printf ("%s", inputChar);
            
            //Calling calculateCheckSum, increment j, & set i back to 0.
            calculateCheckSum(checkSize, inputChar, checksum);
            j++;
            i = 0;
            
            //Checking if comparison reaches 80, prints a new line
            if (j * (stringLength - 1) == 80)
                printf("\n");
        }
        //Else Case initiated by when stringLength does not equal 1
        else
        {
            //File function that takes the character value from input file
            charValue = fgetc(infile);

            //Checks if characterValue is equal to -1
            if (charValue == EOF)
            {
                //Checks if the checkSizes are either equal to 16 or 32
                if (checkSize == 16 || checkSize == 32)
                {
                    
                    if((stringLength - i) != 1 && (stringLength - i) != stringLength)
                    {
                        k = 0;
                        while ((stringLength - i) != 1 && (stringLength - i) != stringLength)
                        {
                            //Remember to pad with X if the input data does not align with checkSize for calculateCheckSum.  
                            inputChar[i] == 'X';
                            i++;
                            k++;
                            printf("\n");
                        }

                        inputChar[i] = '\0';
                        printf("%s", inputChar);
                        calculateCheckSum(checkSize, inputChar, checksum);
                        j++;
                        charCount += k - 1;
                        i++;

                        if (j * (stringLength - 1) == 80)
                            printf("\n");
                    }
                else
                    break;
                }
            else
                break;
            }
        else
            inputChar[i] = charValue;
        
        charCount++;
        i++;
                
        }
    }
    
    printf("\n");
    fprintf(stderr,"%2d bit checksum is %8lx for all %4d chars\n", checkSize, *checksum, charCount);
    fclose(infile);

}
unsigned int long calculateBitMask(char *input, int checkSize)
{
    //initalize BItMask & i as 0;
    int i = 0;
    unsigned int long BitMask;

    //Set BitMask equal to the input[i]
    //Subtracts checkSize by 8 every loop;
    BitMask = input[i];
    checkSize = checkSize - 8;

    //While loop
    while (checkSize != 0)
        {
            //Shift BitMask and add the value of input(input being incremented by 1)
            //increment 1 after checkSize & subtract 8 from checkSize every loop;
            BitMask = (BitMask << 8) + input[i+1];
            checkSize -= 8;
            i++;
        }
        //Returns the reverenced value of BitMask to after function is called  
        return BitMask;
}

//Main function
int main(int argc, char *argv[])
{
    //Declare char and int variable in main function
    char *inputFile;
    int bitCheck;

    //Allocates memory by char's bit size * 30
    inputFile = malloc(sizeof(char) * 30);
    
    //Conditional statement checks if argc is less than two.
    //Displays error message if argc does not reaches 3 or greater
    if (argc < 2)
    { 
        printf("Insufficient arguments in command line.\n");
    }

    else 
    {
        //Copies the string from inputFile and stores into argv[1]
        //Bitcheck converts argv[2] from ASCII value to Integer
        strcpy(inputFile, argv[1]);
        bitCheck = atoi(argv[2]);
    
        //If condition checks if bitCheck is not equal to 8, 16, or 32
        //If true, file prints out Valid checksum sizes for clarafication
        if (bitCheck != 8 && bitCheck != 16 && bitCheck != 32)
            fprintf(stderr, "Valid checksum sizes are 8, 16, or 32\n");

        //If passed, calculateFileInputeCheckSum is called with bitCheck + inputFile
        calculateFileInputCheckSum(inputFile, bitCheck);
    }
    return 0;
}



/*=============================================================================
| I, Dawnelle Metayer (da700818) affirm that this program is
| entirely my own work and that I have neither developed my code together with
| any another person, nor copied any code from any other person, nor permitted
| my code to be copied  or otherwise used by any other person, nor have I
| copied, modified, or otherwise used programs created by others. I acknowledge
| that any violation of the above terms will be treated as academic dishonesty.
+=============================================================================*/