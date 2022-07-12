/* ┌──────────────────┐
   │ Foo module stuff │
   └──────────────────┘
   
    Florian Dupeyron
    July 2022
*/

#include "foo.h"

void foo_mystruct_init(struct MyStruct *st)
{
	st->a = 12;
	st->b = 39;
}

int foo_mystruct_sum(struct MyStruct *st)
{
	return st->a + st->b;
}
