/* ┌──────────────────┐
   │ Foo module stuff │
   └──────────────────┘
   
    Florian Dupeyron
    July 2022
*/

#include "boo.h"

void boo_mystruct_init(struct MyStruct *st)
{
	st->a = 24;
	st->b = 38;
}

int boo_mystruct_diff(struct MyStruct *st)
{
	return st->b - st->a;
}
