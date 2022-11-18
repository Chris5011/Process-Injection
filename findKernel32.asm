; Find kernel32
; author: Chris5011
; date: 14. Nov 2022
; from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
; nasm -f win32 -o findKernel32.o findKernel32.asm
; ld -m i386pe -o findKernel32.exe findKernel32.o

section .data

section .bss

section .text
	global _start               ; must be declared for linker

_start:
  mov eax, [fs:ecx + 0x30]      ; offset to the PEB struct (64-Bit gs 0x60; 32-Bit fs 0x30)
  mov eax, [eax + 0xc]          ; offset to LDR within PEB
  mov eax, [eax + 0x14]         ; offset to InMemoryOrderModuleList
  mov eax, [eax]                ; kernel.exe address loaded in eax (1st module)
  mov eax, [eax]                ; ntdll.dll address loaded (2nd module)
  mov eax, [eax + 0x10]         ; kernel32.dll address loaded (3rd module)