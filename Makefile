CXX=clang++
CC=clang
PREFIX=/usr

CXXFLAGS=-g -Iinclude -Wno-incompatible-pointer-types -std=c++17
CFLAGS=-g -Iinclude -Wno-incompatible-pointer-types -std=c17
LDFLAGS=
LIBS=-llc -lssl

BINDIR=bin
INCDIR=include
SRCDIR=src

CSRC=
CPPSRC=$(SRCDIR)/main.cpp $(SRCDIR)/opengps.cpp

HFILES=$(INCDIR)/opengps.hpp
OFILES=$(CSRC:.c=.o) $(CPPSRC:.cpp=.o)

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
