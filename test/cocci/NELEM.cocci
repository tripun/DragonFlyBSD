//
// Find cases where NELEM() can be used.
//
// Applies to userland and kernel code.
//

@param@
@@

#include <sys/param.h>

@depends on param@
type E;
E[] T;
@@

- sizeof(T)/sizeof(E)
+ NELEM(T)

@depends on param@
type E;
E[] T;
@@

- sizeof(T)/sizeof(*T)
+ NELEM(T)

@depends on param@
type E;
E[] T;
@@

- sizeof(T)/sizeof(T[...])
+ NELEM(T)
