#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void){
	int qtd, pts = 0;
	scanf("%d", &qtd);
	char c;

	char *str1 = malloc(qtd*sizeof(char));
    char *str2 = malloc(qtd*sizeof(char));
	
	scanf("%s", str1);
	scanf("%s", str2);

	while(qtd--)
		if(str1[qtd] == str2[qtd] && str1[qtd] != '\0')
			pts++;

	printf("%d\n", pts);

	return 0;
}
