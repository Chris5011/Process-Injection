; Find kernel32
; author: Chris5011
; date: 14. Nov 2022
; from: https://cocomelonc.github.io/tutorial/2021/10/27/windows-shellcoding-1.html
; nasm -f elf64 -o findKernel32.o findKernel32.asm
; ld -m elf_x86_64 -o findKernel32.exe findKernel32.o

section .data

section .bss

section .text
	global _start               ; must be declared for linker

_start:
  mov rax, [gs:rcx + 0x60]      ; offset to the PEB struct (64-Bit gs 0x60; 32-Bit fs 0x30)
  mov rax, [rax + 0x18]         ; offset to LDR within PEB
  mov rax, [rax + 0x20]         ; offset to InMemoryOrderModuleList
  mov rax, [rax]                ; kernel.exe address loaded in eax (1st module)
  mov rax, [rax]                ; ntdll.dll address loaded (2nd module)
  mov rax, [rax + 0x30]         ; kernel32.dll address loaded (3rd module)