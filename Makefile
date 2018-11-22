CXX=clang++
CC=clang
PREFIX=/usr

CXXFLAGS= -std=c++17
CFLAGS=-g -Iinclude -Wno-incompatible-pointer-types
CDIALECT = -std=c11
LDFLAGS=
LIBS=-llc -lssl

BINDIR=bin
INCDIR=include
SRCDIR=src

HFILES=$(INCDIR)/opengps.hpp
OFILES= $(BINDIR)/opengps.o $(BINDIR)/main.o

TARGET=$(BINDIR)/OpenGPS

.PHONY: all clean example exampleclean
.DEFAULT: all
.PRECIOUS: Makefile
.DELETE_ON_ERROR:

all: $(TARGET)

clean:
	rm -f $(TARGET) $(OFILES)

install: $(TARGET)
	cp $(TARGET) $(PREFIX)/lib
	cp $(HFILES) $(PREFIX)/include

$(TARGET): $(OFILES)
	$(CXX) -o $(TARGET) $(LDFLAGS) $(OFILES) $(LIBS)

$(BINDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CFLAGS) $(CXXFLAGS) -c $@ $^
	
$(BINDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $(CDIALECT) -c $@ $^
	
	
