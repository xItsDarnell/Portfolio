#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "leak_detector_c.h"

#define MAXSMOOTHIE 100000

FILE* inFile;
FILE* outFile;
recipe** smoothieList;
double* amtOfEachItem;

typedef struct item{
    int itemID;
    int numParts;
}item;

typedef struct recipe{
    int numItems;
    item* itemList;
    int totalParts;
}recipe;


// Pre-condition: reference to a variable to store number of ingredients. 

// Post-condition: Reads in numIngredients and that number of strings from                      
//                 the inputs, allocates an array of
//                 strings to store the input, and sizes each
//                 individual string dynamically to be the
//                 proper size (string length plus 1), and 
//                 returns a pointer to the array.

char** readIngredients(int *numIngredients){
    
    char** array;
    int i, nameLength;
    
    fscanf(inFile, "%d", &numIngredients);
    array = (char*) malloc(*numIngredients * sizeof(char));

    for (i = 0; i < numIngredients; i++)
    {
        fscanf(inFile, "%s", smoothieList[i]);

        nameLength = strlen(array) + 1;
        array[i] = (char*) malloc(nameLength+1);
    }
    return array;

}


// Pre-condition: does not take any parameter

// Post-condition: Reads in details of a recipe such as numItems,
//                 Dynamically allocates space for a single
//                 recipe, dynamically allocates an array of
//                 item of the proper size, updates the 
//                 numItems field of the struct, fills the
//                 array of items appropriately based on the 
//                 input and returns a pointer to the struct
//                 dynamically allocated.
recipe* readRecipe(){

    int r, i, *S, *W;
    recipe** ingredient;
    char iName[MAXSMOOTHIE];

    fscanf(inFile, "%d", &r);

    ingredient = (recipe**) malloc(r * sizeof(recipe*));
    for (i = 0; i < r; i++)
    {
        //ingredient[i] = (recipe*) malloc(r * sizeof(recipe));
        ingredient[i] = (recipe*) malloc(r * sizeof(recipe));
        for (int j = 0; j < r; j++)
        {
            int total = 0, nameLength;
            //fscanf(inFile, "%d", )
        }
        
        fscanf(inFile, "%d", S[i]);


    }
}


// Pre-condition: reference to a variable to store number of recipes.

// Post-condition: Read number of recipes. Dynamically allocates an array of 
//                 pointers to recipes of size numRecipes, reads numRecipes
//                 number of recipes from standard input, creates
//                 structs to store each recipe and has the 
//                 pointers point to each struct, in the order 
//                 the information was read in. (Should call
//                 readRecipe in a loop.)
recipe** readAllRecipes(int *numRecipes){

}

// Pre-condition: 0 < numSmoothies <= 100000, recipeList is 
//    pointing to the list of all smoothie recipes and 
//    numIngredients equals the number of total ingredients (you have        
//      already read it in the first line of the input).

// Post-condition: Reads in information from standard input
//    about numSmoothies number of smoothie orders and dynamically 
//    allocates an array of doubles of size numIngredients such 
//    that index i stores the # of pounds of ingredient i
//    needed to fulfill all smoothie orders and returns a pointer 
//    to the array.
double* calculateOrder(int ingredientCount, int numSmoothies, recipe** recipeList){

}

// Pre-conditions: ingredientNames store the names of each 
//                 ingredient and orderList stores the amount 
//                 to order for each ingredient, and both arrays  
//                 are of size numIngredients. 

// Post-condition: Prints out a list, in ingredient order, of each 
//                 ingredient, a space and the amount of that 
//                 ingredient to order rounded to 6 decimal 
//                 places. One ingredient per line.
void printOrder(char** ingredientNames,    double* orderList,    int numIngredients){

    int i;
    
    for (i = 0; i < numIngredients; i++);
        fprintf("%d %s %.6f ", numIngredients, &ingredientNames[i], orderList[i]);

}

// Pre-conditions: ingredientList is an array of char* of size  
//          numIngredients with each char* dynamically allocated. 

// Post-condition: all the memory pointed to by ingredientList is  
//                 freed. 
void freeIngredients(char** ingredientList, int numIngredients){

    for (int i = 0; i < numIngredients; i++)
    {
        free(ingredientList[i]);
    }
    free(ingredientList);
}

// Pre-conditions: allRecipes is an array of recipe* of size  
//                numRecipes with each recipe* dynamically allocated  
//              to point to a single recipe. 

// Post-condition: all the memory pointed to by allRecipes is  
//                 freed. 
void freeRecipes(recipe** allRecipes, int numRecipes){

    for(int i = 0; i < numRecipes; i++)
    {
        free(allRecipes[i]->numItems);
    }
    free(allRecipes);
}

void processOutput(char** ingredientList, int ingredientCount, recipe** allRecipes, int recipeCount){

}

int main()
{

    atexit(report_mem_leak); //for memory leak detector.
    int n, k, ss, m;

    inFile = fopen("in.txt", "r");
    outFile = fopen("out.txt", "w");
    if(inFile != NULL)
    {
        fscanf(inFile, "%d", &n);


    }


    fclose(inFile);
    fclose(outFile);
}