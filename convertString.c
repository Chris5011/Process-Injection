#include <stdio.h>
#include <string.h>

/*
 * This Program is used to create the Little-Endian Representation of a given String
 * Author: Chris5011
 * Date: 14. Nov 2022
 */


int main(int argc, char * argv[]){

    if(argc != 2){
        printf("Please enter exactly one parameter to convert!\n");
        return 1;
    }

    char * baseString = argv[1];
    char * reversed;
    unsigned char strH[200];

    reversed = strrev(baseString);
    memset(strH, 0, sizeof(strlen(reversed)*2));

    /*converting str character into Hex and adding into strH*/
    int i, j;
    for (i = 0, j = 0; i < strlen(reversed); i++, j += 2) {
        sprintf((char*)strH + j, "%02X", reversed[i]);
    }
    strH[j] = '\0'; //Add terminating 0-character

    //Print Reversed String
    printf("Reversed: %s", reversed);

    //Printing Hex-String in 8-Byte form
    for(i = 0; i < strlen(strH); ++i){
        if(i % 8 == 0){
            printf("\n0x");
        }
        printf("%c", strH[i]);
    }

    return 0;
}