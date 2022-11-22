#CC = C:\Users\Student\Downloads\msys32\mingw32\bin\i686-w64-mingw32-gcc
CC = gcc
LIBS = -lcurl 
CFLAGS = -Wall -std=c17 -L msys-2.0.dll
BINDIR = $(DESTDIR)/usr/bin
NAME = cbg
OUTDIR = build

all: run.exe exit.exe getWinExecAddr.exe shellcode.exe findkernel.exe

run.exe: run.c
	$(CC) $(CFLAGS) run.c -o $(OUTDIR)/run.exe

exit.exe: exit.c
	$(CC) $(CFLAGS) -O2 exit.c -o $(OUTDIR)/exit.exe

getWinExecAddr.exe:
	gcc -O2 getWinExecAddr.c -o $(OUTDIR)/getWinExecAddr.exe -mconsole -I /usr/include -s -ffunction-sections -fdata-sections -Wall -fno-exceptions -fmerge-all-constants -static-libstdc++ -L msys-2.0.dll -static-libgcc >/dev/null 2>&1

shellcode.exe:
	nasm -f elf32 -o $(OUTDIR)/shellcode.o shellcode.asm
	ld -m i386pe -o $(OUTDIR)/shellcode.exe $(OUTDIR)/shellcode.o
# elf_i386
	rm $(OUTDIR)/shellcode.o
	

findkernel.exe:
	nasm -f win32 -o $(OUTDIR)/findKernel32.o findKernel32.asm
	ld -m i386pe -o $(OUTDIR)/findKernel32.exe $(OUTDIR)/findKernel32.o
	rm $(OUTDIR)/findKernel32.o

CPP-Test:
	g++ -std=c++11 CPP-Test.cpp -o $(OUTDIR)/cpp/CPP-Test.exe 
	
injectproc: 
	g++ -std=c++11 InjectRemoteProcess.cpp -o $(OUTDIR)/cpp/InjectRemoteProcess.exe -Wall
