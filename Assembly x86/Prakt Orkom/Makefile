#
exe= main
src= main.asm
assembler= yasm

#
obj= $(patsubst %.asm,%.o,$(src))

default: main

.PHONY: main
main: $(obj)
	gcc -o $(exe) -m32 $(obj)
	
.PHONY: clean
clean:
	rm -f *.o *.lst $(exe) *- .*.gdb
	
%.o: %.asm
	$(assembler) $*.asm -f elf32 -g dwarf2 -l $*.lst
