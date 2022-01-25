/*=============================================================================
|   Assignment:  pa01 - Encrypting a plaintext file using the Vigenere cipher
|
|       Author:  Dawnelle Metayer
|     Language:  C
|
|   To Compile: gcc -o pa01 pa01.c
|                
|
|   To Execute:  c    -> ./pa01 kX.txt pX.txt
|                         where kX.txt is the keytext file
|                           and pX.txt is plaintext file
|
|         Note:  All input files are simple 8 bit ASCII input
|
|        Class:  CIS3360 - Security in Computing - Summer 2021
|   Instructor:  McAlpin
|     Due Date:  June 27th, 2021
|
+=============================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


void keyFile1(FILE *ix1, char *key1, char *point, char *count){
    
    
    int c;
    int i = 0;
    int j, k = 0;
    
    if(ix1 == NULL)
    {
        printf("Key file cannot be opened. \n Exiting program. \n");
        exit(0);
    }

    c = fgetc(ix1);
    printf("Vigenere Key:\n");
    while (c != EOF)
    {
        printf("%c", c);
        if (i > 512)
            break;
        i++;

        if(c >= 'a' && c <= 'z')
            key1[k++] == toupper(c);
        
        if(c >= 'A' && c <= 'Z')
            key1[k++] == c;

        c = fgetc(ix1);
    }
    printf("\n");
    key1[k] = '\0';
    fclose(ix1);
}

void keyFile2(FILE *ix2, char *key2, char *point, char *count)
{
    int c;
    int i = 0;
    int j, k = 0;

    if(ix2 == NULL)
    {
        printf("Key file cannot be opened. \n Exiting program. \n");
        exit(0);
    }
    c = fgetc(ix2);
    printf("Plaintext:\n");
    while (c  != EOF)
    {
        printf("%c", c);
        if (i > 512)
            break;
        i++;

        if(c >= 'a' && c <= 'z')
            point[k++] == toupper(c);
        
        if(c >= 'A' && c <= 'Z')
            point[k++] == c;

        c = fgetc(ix2);
    }
    printf("\n");
    point[k] = '\0';
    fclose(ix2);
}


void encryption(char* key1, char* point, char* count, int mlen, int klen){
    mlen = strlen(point);
    klen = strlen(key1);
    int i = 0;

    for (i = mlen; i < klen; i++)
        point[i] = 'X';
    
    point[i] = '\0';
    mlen = strlen(point);


    for (i = 0; i < mlen; i++)
        count[i] = ((point[i] + key1[i]) % 26) + 'A';

    count[i] = '\0';

    printf("Cipher text:\n");
    for(i = 0; i < strlen(count); i++)
    {
        if (i % 80 == 0)
            printf("\n");

        printf("%c", tolower(count[i]));
    }
    printf("\n");

}

int main(int argc, char* argv[])
{
    FILE *infile1, *infile2;
    int i=0, k=0, j, c, mlength, klength;
    char key1[513], point[513], key2[mlength], count[mlength];
    infile1 = fopen(argv[1], "r");
    keyFile1(infile1, key1, point, count);

    infile2 = fopen(argv[2], "r");
    keyFile2(infile2, key2, point, count);

    encryption(key1, point, count, mlength, klength);
    
}
/*=============================================================================
| I, Dawnelle Metayer (da700818) affirm that this program is
| entirely my own work and that I have neither developed my code together with
| any another person, nor copied any code from any other person, nor permitted
| my code to be copied  or otherwise used by any other person, nor have I
| copied, modified, or otherwise used programs created by others. I acknowledge
| that any violation of the above terms will be treated as academic dishonesty.
+=============================================================================*/