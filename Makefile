# Copiler for NASM
NASM = nasm -f elf32
ASM = io_char.asm
ASM2 = Sum_of_two_numbers.asm

# Link object file
LINK = ld -m elf_i386
ENTRY_POINT = -e _main

######################################################
all: io_char linker1 run1 Sum linker2 run2
######################################################
io_char: $(ASM)
	$(NASM) $(ASM) -o myApp.o

linker1: myApp.o
	$(LINK) $(ENTRY_POINT) myApp.o -o myApp.out
######################################################
Sum: $(ASM2)
	$(NASM) $(ASM2) -o Sum.o
	
linker2: Sum.o
	$(LINK) $(ENTRY_POINT) Sum.o -o Sum.out
######################################################
run1: linker1
	./myApp.out

run2: linker2
	./Sum.out
######################################################
.PHONY: all
