.data
	inptInv: .asciz "Entrada invalida.\n"
	inptPrimo: .asciz "sim\n"
	inptNotPrimo: .asciz "nao\n"
	
.text	
	li t0, 2			#t0 = 2
	li t1, 1			#t1 = 1
	li a7, 5			#Lendo inteiro
	ecall
	
	beq a0, t1, fimNotPrimo		#Se a0 = 1, entao nao é primo
	blt a0, t0, fimInv		#Se a entrada for menor que 2 vá para Entrada Invalida
	jal notPrimo
	
	li a7, 4			#Prepara para imprimir uma string
	la, a0, inptPrimo		#Caregando a string
	ecall
	
	li a7, 10			#Finalizando o programa com code 0
	ecall
	
notPrimo:
	li t1, 2			#int i = 2
	add t2, a0, zero		#t2 = num, interação maxima
	for:
		bge t1, t2, break	#Se for maior ou igual acabou o loop
		
		rem t3, a0, t1		#t3 = a0 % i
		beqz t3, fimNotPrimo	#Se t3 for igual a zero entao nao eh primo
		
		add t1, t1, t1		#i = i*i
		j for
		
break:
	jr ra				#Voltando para o programa principal
	
fimNotPrimo:
	li a7, 4			#Prepara para imprimir uma string
	la, a0, inptNotPrimo		#Caregando a string
	ecall
	
	li a7, 10			#Finalizando o programa com code 0
	ecall

fimInv:
	li a7, 4			#Prepara para imprimir uma string
	la, a0, inptInv			#Caregando a string
	ecall
	
	li a7, 10			#Finalizando o programa com code 0
	ecall
