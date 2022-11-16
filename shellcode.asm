; run calc.exe and exit normal
; author: Chris5011
; date: 14. Nov 2022
; from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
; nasm -f elf64 -o shellcode.o shellcode.asm
; ld -m elf_x86_64 -o shellcode shellcode.o
; 64-bit linux exe --> Works in windows as ShellCode


section .data
				
section .bss
				
section .text
	global _start	 	    ; must be declared for linker
				
_start:
	xor rcx, rcx		    ; Zero out rcx
	push rcx		        ; String-Terminator
	push 0x6578652e		    ; Push exe.
	push 0x636c6163		    ; Push clac

	mov rax, rsp		    ; save the pointer to "calc.exe" string in rbx
				
	; UINT WinExec([in] LPCSTR lpCmdLine, [in] UINT   uCmdShow);
	inc rcx			        ; uCmdShow = 1
	push rcx		        ; uCmdShow *ptr to stack on pos 2
	push rax		        ; lpCmdLine *ptr to stack on pos 1 (LIFO)
	mov rbx, 0x7ffc415e6140	; move and call WinExec() function on current Address in Kernel32.dll
	call rbx		;
				
	; void ExitProcess([in] UINT uExitCode);
	xor rax, rax		    ; Zero out rax
	push rax		        ; push NULL
	mov rax, 0x7ffc4159e0a0	; move and call ExitProcess() function on current Address in Kernel32.dll
	jmp rax			        ; execute the ExitProcess() function
