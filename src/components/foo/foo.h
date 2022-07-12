/* ┌──────────────────────┐
   │ Some component stuff │
   └──────────────────────┘
   
    Florian Dupeyron
    July 2022
*/

#pragma once

struct MyStruct {
	int a;
	int b;
};

void foo_mystruct_init(struct MyStruct *st);
int  foo_mystruct_sum (struct MyStruct *st);
