.data						#Define a parte de dados para o assembly
	enter: .string "\n"			#Define a string e o seu respectivo valor


.text						#Diz para o assembly que a parte abaixo é texto/código

	# t0 = entrada, t1 = num, t2 = i, s0 = maior
	
	add t0, zero, zero 			#Zerando os registradores a serem utilizados
	add t1, zero, zero
	add t2, zero, zero
	add s0, zero, zero
	
	
	li a2, 0				#Definindo a entrada padrão
	li a0, 0				#Inicializando a0 com zero
	li a7, 5				#Definindo o valor de a7 para a chamada de sistema
	ecall					#Lendo um inteiro a partir da entrada e salva em a0
	
	mv t0, a0				#Definindo o numero de entradas a serem lidas
	j for
	

	for:					#Loop
		beq t2, t0, done		#Verificação da condição
		
		li a7, 5			#Definindo o valor de a7 para a chamada de sistema
		ecall				#Lendo um inteiro a partir da entrada e salva em a0
		
		mv t1, a0			#Adiciona o numero lido para a variavel de comparação
		
		jal func_maior			#Faz a chamada de função de verificação
		
		addi t2, t2, 1			#Incremento do contador
		j for				#Mantém o loop
		
		
	func_maior:
		bge t1, s0, maior_troca		#Se num for maior que 'maior' pula para 'maior_troca'
		jr ra
	
	maior_troca:				#Realiza a troca e retorna para o local da chamada de função
		mv s0, t1
		jr ra
	
	
	done:
		mv a0, s0
		
		li a2, 1			#Definindo a saída padrão
		li  a7, 1          		#Carrega o valor para a chamada de função
		ecall				#Printa um inteiro na saida que esta em a0
		
		la a0, enter			#Carrega a palavra da label enter em a0
		li a7, 4			#Definindo o valor de a7 para a chamada de sistema
		ecall				#Imprime uma string que está em a0
		
		li a7, 10			#Carrega um imediato no registrador a7
		ecall				#Realiza a finalização do programa