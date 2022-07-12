#include <stdlib.h>
#include <stdio.h>

#include <foo/foo.h>
#include <boo/boo.h>

int main( int argc, char *argv[] )
{
	struct MyStruct x = {.a = 0, .b = 0};

	printf("Before init: a = %d, b = %d\n", x.a, x.b);
	foo_mystruct_init(&x);
	printf("After init: a = %d, b = %d\n", x.a, x.b);

	int sum = foo_mystruct_sum(&x);
	printf("Sum = %d\n", sum);

	boo_mystruct_init(&x);
	printf("After boo init: a = %d, b = %d\n", x.a, x.b);

	int diff = boo_mystruct_diff(&x);
	printf("Diff = %d\n", diff);

	return EXIT_SUCCESS;
}
