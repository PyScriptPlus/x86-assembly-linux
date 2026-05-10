# Copiler for NASM
NASM = nasm -f elf32
ASM = io_char.asm
OBJ = myApp.o

# Link object file
LINK = ld -m elf_i386
ENTRY_POINT = -e _main
OUTPUT = myApp.out

all: io_char linker run

io_char: io_char.asm
	$(NASM) $(ASM) -o $(OBJ)

linker: $(OBJ)
	$(LINK) $(ENTRY_POINT) $(OBJ) -o $(OUTPUT)

run: $(OUTPUT)
	./$(OUTPUT)

.PHONY: all

