#include <stdio.h>
#include <stdlib.h>

int main(void){
	int num;
	scanf(" %d", &num);
	
	if(num < 2){
		printf("Entrada invalida.\n");
		return 0;
	} 

	for(int i = 2; i*i <= num; i++){
		if(num % i == 0){
			printf("nao\n");
			return 0;
		}
	}

	printf("sim\n");

	return 0;
}

