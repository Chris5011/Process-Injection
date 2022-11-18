#include <stdio.h>
#include <stdlib.h>

/*
 * A Simple Skeleton-Program to execute ShellCode.
 * Author: Chris5011
 * Date: 14. Nov 2022
 * From: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
 */

char shellCode[] = "\x31\xc9\x51\x68\x2e\x65\x78\x65\x68\x63\x61\x6c\x63\x89\xe0\x41\x51\x50\xbb\x2e\xf5\xd1\x76\xff\xd3\x31\xc0\x50\xb8\x8a\xbe\xce\x76\xff\xe0";

int main(int argc, char * argv[]){

    int (*func)();                  //Create empty Function-Pointer
    func = (int(*)()) shellCode;    //Point the Function-Pointer to the ShellCode
    (int)(*func)();                 //Execute the function which in turn executes the ShellCode in shellCode[]

    return 0;
}