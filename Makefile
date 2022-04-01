# This Makefile was tested with GNU Make
CC=gcc

# Use pkg-config to lookup the proper compiler and linker flags for LCM
CFLAGS=`pkg-config --cflags lcm`
LDFLAGS=`pkg-config --libs lcm`

all: lcm_simple

lcm_simple: l2g_t.o lcm_simple.o
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< 

%_t.c %_t.h: %_t.lcm
	lcm-gen -c $<

clean:
	rm -f lcm_simple
	rm -f *.o
	rm -f l2g_t.c l2g_t.h