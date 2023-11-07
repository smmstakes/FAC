.data		#Diz para o assembly que é uma area de informações
string:		#Label para reconhecer o lugar na memoria
	.string "Ola Mundo\n"

.text	#Diz para que é uma área de texto/código
main:
	la a0, string		#Carrega o endereço do label string no resgistrador a0
	addi a7, a7, 4		#Adiciona o imediato 4 no registrador a7
	ecall			#Faz a chamada de sistema que imprime o que está no registrador a0
	
	li a7, 10		#Carrega um imediato no registrador a7
	ecall			#Realiza a finalização do programa
	