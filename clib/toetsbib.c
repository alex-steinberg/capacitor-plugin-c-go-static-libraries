#include <stdio.h>
#include <string.h>
#include "libgolib.h"

// gcc -shared -o libgolib.so -fPIC toetsbib.c
// clang -c -o toetsbib.o toetsbib.c && libtool -static -o libgolib.a toetsbib.o

void GoodMorning(char* version, int length)
{
    strcpy(version, "Good morning says we - C version");
} // GoodMorning
