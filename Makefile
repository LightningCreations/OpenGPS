CXX=g++
PREFIX=/usr

CPPFLAGS=
CFLAGS=-g -Iinclude -Wno-incompatible-pointer-types
LDFLAGS=
LIBS=-llc -lssl

BINDIR=bin
INCDIR=include
SRCDIR=src

SRCFILES=$(SRCDIR)/main.cpp $(SRCDIR)/opengps.cpp
HFILES=$(INCDIR)/opengps.h
OFILES=$(SRCFILES:.cpp=.o)

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

$(OFILES): $(HFILES) $(SRCDIR)/opengpsInt.h

