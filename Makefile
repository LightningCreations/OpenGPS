CXX=clang++
CC=clang
PREFIX=/usr

CXXFLAGS=-g -Iinclude -Wno-incompatible-pointer-types -std=c++17
CFLAGS=-g -Iinclude -Wno-incompatible-pointer-types -std=c17
LDFLAGS=
LIBS=-llc -lssl

BINDIR=bin
GENDIR=gen
INCDIR=include
SRCDIR=src

CSRC=
CPPSRC=$(SRCDIR)/main.cpp $(SRCDIR)/opengps.cpp
ASMSRC=$(GENDIR)/maps/worldMap.asm

HFILES=$(INCDIR)/opengps.hpp
OFILES=$(CSRC:.c=.o) $(CPPSRC:.cpp=.o) $(ASMSRC:.asm=.o)

GENSRC=$(GENDIR)/maps/worldMap.asm

TARGET=$(BINDIR)/OpenGPS

.PHONY: all clean example exampleclean
.DEFAULT: all
.PRECIOUS: Makefile
.DELETE_ON_ERROR:

all: generate $(TARGET)

clean:
	rm -f $(TARGET) $(OFILES) $(GENSRC)

generate: $(GENSRC)

install: $(TARGET)
	cp $(TARGET) $(PREFIX)/lib
	cp $(HFILES) $(PREFIX)/include

$(TARGET): $(OFILES)
	$(CXX) -o $(TARGET) $(LDFLAGS) $(OFILES) $(LIBS)

%.o: %.s
	nasm -o $@ $?

$(GENDIR)/maps/%.asm: $(SRCDIR)/maps/%.map
	echo bits 64                  > $@
	echo section .rodata         >> $@
	echo global _%_start         >> $@
	echo global _%_end           >> $@
	echo global _%_size          >> $@
	echo _%_start: incbin $?     >> $@
	echo _%_end:                 >> $@
	echo _%_size:  dd $-_%_start >> $@
