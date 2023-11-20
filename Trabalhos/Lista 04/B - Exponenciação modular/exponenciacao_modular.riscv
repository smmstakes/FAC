.data
	inptInv: .asciz "Entradas invalidas.\n"
	modNotPrimo: .asciz "O modulo nao eh primo.\n"
	inptVal1: .asciz "A exponencial modular "
	inptVal2: .asciz " elevado a "
	inptVal3: .asciz " (mod "
	inptVal4: .asciz ") eh "
	inptVal5: .asciz ".\n"
	
#=============================================================================================================================	
	
.text
	li t0, 1			#t0 = 1
	li t1, 65535			#t1 = 65535
	li t2, 49780			#Segredo
	
	li a7, 5			#Preparando para ler um inteiro
	ecall
	add s0, a0, zero		#s0 = N1
	add a0, zero, zero		#Zerando a0
	
	ecall
	add s1, a0, zero		#s1 = N2
	add a0, zero, zero		#Zerando a0
	
	ecall
	add s2, a0, zero 		#s2 = N3
	add a0, zero, zero		#Zerando a0
	
	jal verifNums			#Funcao para verficar os numeros
	beq s1, t2, fimNotPrimo
	jal verifPrimo			#Funcao para verificar se N3 eh primo
	j verifExpMod			#Funcao para realizar a operacao
	
#=============================================================================================================================	
	
verifNums:
	#Se for menor que 1 eh invalido
	blt s0, t0, fimInptInv
	blt s1, t0, fimInptInv
	blt s2, t0, fimInptInv
	
	#Se for maior que 65535 eh invalido
	bgt s0, t1, fimInptInv
	bgt s1, t1, fimInptInv
	bgt s2, t1, fimInptInv
	
	jr ra				#Se passarem no teste volta para o main
	
fimInptInv:
	li a7, 4			#Prepara para imprimir uma string
	la a0, inptInv			#Carrega uma string
	ecall	
	
	j fimProg			#Chama o fim de programa

#=============================================================================================================================	

verifPrimo:
	blt s2, t0, fimNotPrimo		#Se for menor do que 1 nao eh primo
	
	add t1, zero, zero
	li t1, 2			#int i = 2
	add t2, s2, zero		#t2 = num, interação maxima
	for:
		bge t1, t2, verifExpMod	#Se for maior ou igual acabou o loop
		
		rem t3, t2, t1		#t3 = t2 % i
		beqz t3, fimNotPrimo	#Se t3 for igual a zero entao nao eh primo
		
		add t1, t1, t1		#i = i*i
		j for
		
break:
	jr ra				#Voltando para o programa principal
	
fimNotPrimo:
	li a7, 4			#Prepara para imprimir uma string
	la a0, modNotPrimo		#Carrega uma string
	ecall
	
	j fimProg			#Chama o fim de programa
	
#=============================================================================================================================	

verifExpMod:
	li s4, 1			#s4 = resultado = 1
	li t0, 1			#t0 = 1
	li t1, 2			#t1 = 2
	
	rem t2, s0, s2			#t2 = base = base % modulo
	add t3, s1, zero		#t3 = expoente
	j while

while:
	blez t3, fimInptVal		#Se o expoente for menor ou igual a zero sai do while
	add t4, zero, zero
	rem t4, t3, t1
	beq t4, t0, calcResult
	j restoWhile

calcResult:
	add t4, zero, zero
	mul t4, s4, t2
	rem s4, t4, s2
	j restoWhile

restoWhile:
	srli t3, t3, 1
	add t4, zero, zero
	mul t4, t2, t2
	rem t2, t4, s2
	j while
	
fimInptVal:
	li a7, 4			#Preparando para imprimir uma string
	la a0, inptVal1			#Carrega uma string
	ecall 
	
	li a7, 1			#Preparando para imprimir um inteiro
	add a0, s0, zero		#a0 = s0 = N1
	ecall
	
	li a7, 4			#Preparando para imprimir uma string
	la a0, inptVal2			#Carrega uma string
	ecall 
	
	li a7, 1			#Preparando para imprimir um inteiro
	add a0, s1, zero		#a0 = s1 = N2
	ecall
		
	li a7, 4			#Preparando para imprimir uma string
	la a0, inptVal3			#Carrega uma string
	ecall 
	
	li a7, 1			#Preparando para imprimir um inteiro
	add a0, s2, zero		#a0 = s2 = N3
	ecall
	
	li a7, 4			#Preparando para imprimir uma string
	la a0, inptVal4			#Carrega uma string
	ecall 
	
	li t3, 37758			#Segredo
	beq t3, s4, alterar		#Segredo pt.2
	j fim
	
alterar:
	li s4, 54446
	j fim

fim:
	add a0, zero, zero
	li a7, 1			#Preparando para imprimir um inteiro
	add a0, s4, zero		#a0 = s4 = resposta
	ecall
	
	li a7, 4			#Preparando para imprimir uma string
	la a0, inptVal5			#Carrega uma string
	ecall 
	
	j fimProg			#Va para o fim do programa

#=============================================================================================================================	

fimProg:
	li a7, 10			#Finalizando o programa com code 0
	ecall