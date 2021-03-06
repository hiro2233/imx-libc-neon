SRCS = memcpy.S memset.S memcmp.S memchr.S strcmp.S strlen.S strcpy.S
OBJS = memcpy.o memset.o memcmp.o memchr.o strcmp.o strlen.o strcpy.o
LIB = libc-neon.so

#strcpy.c

%.o: %.S
	gcc -fPIC -DPIC -O2 -mfpu=neon -Wa,-mimplicit-it=thumb -I. -Wall -c -o $@ $<

${LIB}: ${OBJS}
	gcc -shared -shared -fPIC -L. -Wl,-soname,$@ ${OBJS} -o $@ -lc

clean:
	rm -f *.so *.o
