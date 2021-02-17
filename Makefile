all: test

# This rule creates an empty file (and ultimately empty library) 
# if the graders haven't provided _functions.c. Later, they will
# replace libfunctions.a with a static library containing the actual
# reference implementations
_functions.c:
	touch _functions.c

_functions.o: _functions.c
	$(CC) -c $^

libfunctions.a: _functions.o
	$(AR) -rc $@ $^

test: test.c libfunctions.a
	$(CC) -o $@ test.c functions.c -L. -lfunctions -lcunit

.PHONY: clean
clean:
	rm -fv _functions.c _functions.o libfunctions.a test *~ 
