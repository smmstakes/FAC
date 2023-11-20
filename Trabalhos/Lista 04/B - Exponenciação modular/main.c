#include <stdio.h>
#include <stdlib.h>

int ehPrimo(int num) {
    if (num <= 1) {
        return 0; // Números menores ou iguais a 1 não são primos
    }

    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return 0; // Encontrou um divisor, não é primo
        }
    }

    return 1; // Se nenhum divisor foi encontrado, é primo
}

int power(int base, int expoente){
    int resultado = 1;
    for(int i = 0; i < expoente; i++){
        resultado *= base;
    }
    return resultado;
}

int main(void){
    int n1, n2, n3;
    scanf("%d %d %d", &n1, &n2, &n3);
    if(n1 >= 1 && n1 <= 65535 && n2 >= 1 && n2 <= 65535 && n3 >= 1 && n3 <= 65535){
        if(ehPrimo(n3)){
            printf("A exponencial modular %d elevado a %d (mod %d) eh %d\n.", n1, n2, n3, (power(n1, n2))%n3);
        }else{
            printf("O modulo nao eh primo.\n");
        }
    } else{
        printf("Entradas invalidas.\n");
    }

    return 0;
}