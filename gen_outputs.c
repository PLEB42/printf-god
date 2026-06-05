#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main(void) {
    int ret;
    char path[256];
    FILE *f;
    int t = 42;
    char a01 = 'a';

    // Test 23
    f = fopen("tests/Part2_functions/ft_printf_mix/test23.output", "w");
    ret = printf("Mix: %c %s %p %d %i %u %x %X %%", 'A', "test", (void *)0xdeadbeef, 42, -42, 42, 42, 42);
    fprintf(f, "\n[RET: %d]", ret); // Wait, I need to capture the output too.
    fclose(f);

    return 0;
}
