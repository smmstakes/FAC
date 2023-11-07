#include <stdio.h>
#include <stdlib.h>

int main (void){

    int a, b, c, m;
    scanf("%d %d %d", &a, &b, &c);

    m = c & 31;

    printf("ADD: %d\n", a + b);
    printf("SUB: %d\n", a - b);
    printf("AND: %d\n", a & b);
    printf("OR: %d\n", a | b);
    printf("XOR: %d\n", a ^ b);
    printf("MASK: %d\n", m);
    printf("SLL(%d): %d\n", m, a << m);
    printf("SLR(%d): %d\n", m, b >> m);

    return 0;
}