#include <stdio.h>
#include <stdlib.h>

int main(void){

    int entrada, num, maior = -1;

    scanf("%d", &entrada);
    for(int i = 0; i < entrada; i++){
        scanf("%d", &num);

        if(num > maior){
            maior = num;
        }
    }
    printf("%d\n", maior);
    return 0;
}