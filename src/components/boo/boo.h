/* ┌──────────────────────┐
   │ Some component stuff │
   └──────────────────────┘
   
    Florian Dupeyron
    July 2022
*/

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <foo/foo.h>

void boo_mystruct_init(struct MyStruct *st);
int  boo_mystruct_diff(struct MyStruct *st);

#ifdef __cplusplus
}
#endif
