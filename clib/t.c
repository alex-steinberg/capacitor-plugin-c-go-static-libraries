#include <stdio.h>
#include "libgolib.h"
// export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
// gcc -o t -golib -L. t.c && ./t
// clang -o t t.c -L. -ltoetsbib

#define LEN 2048

int main()
{
    char str[LEN];
    GoodMorning(str, LEN);
    printf("return string: %s\n", str);
} // main
