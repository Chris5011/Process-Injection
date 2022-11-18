#include <windows.h>
#include <stdio.h>

/*
 * This Program runs calc.exe and exits the process.
 * Author: Chris5011
 * Date: 14. Nov 2022
 * From: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
 */

int main(int argc, char * argv[]){

    WinExec("calc.exe", 0);
    ExitProcess(0);

    //return 0;
}