#include <stdio.h>
#include <windows.h>

/*
 * This Program runs calc.exe and exits the process.
 * Author: Chris5011
 * Date: 14. Nov 2022
 * Adapted from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
 */

int main(int argc, char *argv[]){

    struct HINSTANCE__ *kernel32Addr;       //Save the Address of Kernerl32.dll
    INT_PTR (*exitProcessAddr)();           //Address of the "Exit"-Process
    INT_PTR (*winExecAddr)();               //Address of WinExec

    kernel32Addr = GetModuleHandle("kernel32.dll");
    printf("KERNEL32 Address: 0x%8p\n", kernel32Addr);




    exitProcessAddr = GetProcAddress(kernel32Addr, "ExitProcess");
    printf("ExitProcess address in memory is: 0x%8p\n", exitProcessAddr);

    winExecAddr = GetProcAddress(kernel32Addr, "WinExec");
    printf("WinExec address in memory is: 0x%8p\n", winExecAddr);

    getchar();
    return 0;
}
