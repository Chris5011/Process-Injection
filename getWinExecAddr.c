#include <stdio.h>
#include <windows.h>

/*
 * This Program runs calc.exe and exits the process.
 * Author: Chris5011
 * Date: 14. Nov 2022
 * Adapted from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
 */

int main(int argc, char *argv[]){

 /* x64 implementation:   
	struct HINSTANCE__ *kernel32Addr;       //Save the Address of Kernerl32.dll
	unsigned long exitProcessAddr;           //Address of the "Exit"-Process
    unsigned long winExecAddr;               //Address of WinExec

    kernel32Addr = GetModuleHandle("kernel32.dll");
    printf("KERNEL32 Address: 0x%8p\n", kernel32Addr);

    exitProcessAddr = (unsigned long) GetProcAddress(kernel32Addr, "ExitProcess");
    printf("ExitProcess address in memory is: 0x%8ld\n", exitProcessAddr);

    winExecAddr = (unsigned long) GetProcAddress(kernel32Addr, "WinExec");
    printf("WinExec address in memory is: 0x%8ld\n", winExecAddr);

    getchar();
    return 0;
	*/
	
	unsigned long Kernel32Addr;      // kernel32.dll address
	unsigned long ExitProcessAddr;   // ExitProcess address
	unsigned long WinExecAddr;       // WinExec address

	Kernel32Addr = GetModuleHandle("kernel32.dll");
	printf("KERNEL32 address in memory: \t  %08p\n", Kernel32Addr);

	ExitProcessAddr = GetProcAddress(Kernel32Addr, "ExitProcess");
	printf("ExitProcess address in memory is: %08p\n", ExitProcessAddr);

	WinExecAddr = GetProcAddress(Kernel32Addr, "WinExec");
	printf("WinExec address in memory is: \t  %08p\n", WinExecAddr);
	
	//getchar();
	return 0;
}
