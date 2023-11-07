.data
	MAIS: .asciz "+\n"
	MENOS: .asciz "-\n"
	ENTER: .asciz "\n"
	
.text
main:
	li a2, 0			#Definindo a entrada padrão (stdin)
	li a7, 6			#Definindo ecall (Ler string)
	ecall
	
	fmv.x.s t1, fa0			#Transfere todos os bits para t1
	
	li a2, 1			#Define saida padrao (stdout)
	li a7, 2			#Printa o numero em float
	ecall
	
	li a7, 4			#Printa a quebra de linha
	la a0, ENTER
	ecall
	
	addi s0, s0, 1			#Variavel para verificação de negativo
	srli t2, t1, 31			#Shift para saber o valor do sinal
	
	beqz t2, positivo		#Se o bit 31 for 0 o numero é positivo
	beq t2, s0, negativo		#Se senão é negativo
	
	
positivo:
	la a0, MAIS			#Carrega a string de sinal
	li a7, 4
	ecall
	
	srli t2, t1, 23			#Faz o shift para obter os bits do expoente
	andi t2, t2, 0xFF		#Realiza uma mascara 
	addi a0, t2, -127		#Subtrai a BIAS de excesso
	
	li a7, 1			#Imprime um inteiro
	ecall
	li a7, 4			#Imprime uma quebra de linha
	la a0, ENTER
	ecall
	
	slli t2, t1, 9			#Shift para tirar os 9 primeiros bits
	srli a0, t2, 9			#Retorna para o local inicial
		
	li a7, 34			#Printa a mantissa em Hexadecimal
	ecall
	li a7, 4			#Imprime uma quebra de linha
	la a0, ENTER	
	ecall
	
	j EXIT

negativo:
	la a0, MENOS			#Carrega a string de sinal
	li a7, 4
	ecall
	
	srli t2, t1, 23			#Faz o shift para obter os bits do expoente
	andi t2, t2, 0xFF		#Realiza uma mascara 
	addi a0, t2, -127		#Subtrai a BIAS de excesso
	
	li a7, 1			#Imprime um inteiro
	ecall
	li a7, 4			#Imprime uma quebra de linha
	la a0, ENTER
	ecall
	
	slli t2, t1, 9			#Shift para tirar os 9 primeiros bits
	srli a0, t2, 9			#Retorna para o local inicial
		
	li a7, 34			#Printa a mantissa em Hexadecimal
	ecall
	li a7, 4			#Imprime uma quebra de linha
	la a0, ENTER	
	ecall
	
	j EXIT
	
EXIT:
	li   a7, 10          	# Código do sistema para sair (syscall number 10)
    	ecall
	
	