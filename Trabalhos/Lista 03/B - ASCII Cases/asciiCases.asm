.data
	str1: .space 1000			#Separando um buffer para a string
	NW: .asciz "\n"				#New Line
	fim_str: .asciz "\0"			#Terminador
	.

.text						#M = 77 // m = 109 // c = 99
	addi s2, zero, 77			#s2 = M = 77
	addi s3, zero, 109			#s3 = m = 109
	addi s4, zero, 99			#s4 = c = 99
	add t0, zero, zero

	li a2, 0			#Definindo a entrada padrão
	li a0, 0			#Inicializando a0 com zero

	li a7, 12			#Ler um Char
	ecall
	mv t0, a0			#t0 = tipo_Operação


	li a7, 5			#Ler um inteiro
	ecall
	
	addi a1, a0, 2			#Definindo a qtd de caracteres da string
	li a7,  8			#Lendo uma string
	la a0, str1			#Indicando o local do buffer
	ecall
	
	beq t0, s2, maiuscula		#Se t0 == 'M' vá para maiuscula
	beq t0, s3, minuscula		#Se t0 == 'm' vá para minuscula
	beq t0, s4, capital		#Se t0 == 'c' vá para capital

	j fim				#Se não for nenhuma das anteriores vá para o fim do programa
	

maiuscula:
        lb t1, 0(a0)        		# Carrega o byte da string em t0
        beqz t1, fim    		# Se chegou ao final da string, sai do loop

        # Verifica se o caractere é uma letra minúscula
        li t2, 'a'           		# Valor ASCII de 'a'
        li t3, 'z'           		# Valor ASCII de 'z'
        blt t1, t2, nao_minusculo
        bgt t1, t3, nao_minusculo

        # Converte o caractere para maiúscula
        li t4, 'A'           		# Valor ASCII de 'A'
        sub t1, t1, t2       		# Calcula a diferença entre o caractere e 'a'
        add t1, t4, t1       		# Adiciona a diferença a 'A'

        # Armazena o caractere modificado de volta na string
        sb t1, 0(a0)

nao_minusculo:
        addi a0, a0, 1       		# Avança para o próximo caractere
        j maiuscula


minuscula:
        lb t1, 0(a0)        		# Carrega o byte da string em t0
        beqz t1, fim  			# Se chegou ao final da string, sai do loop

        # Verifica se o caractere é uma letra maiúscula
        li t2, 'A'           		# Valor ASCII de 'A'
        li t3, 'Z'           		# Valor ASCII de 'Z'
        blt t1, t2, nao_maiusculo
        bgt t1, t3, nao_maiusculo

        # Converte o caractere para minúscula
        li t4, 'a'           		# Valor ASCII de 'a'
        sub t1, t1, t2       		# Calcula a diferença entre o caractere e 'A'
        add t1, t4, t1       		# Adiciona a diferença a 'a'

        # Armazena o caractere modificado de volta na string
        sb t1, 0(a0)

nao_maiusculo:
        addi a0, a0, 1       		# Avança para o próximo caractere
        j minuscula


capital:
    	li t3, 'a'           		# Valor ASCII de 'a'
   	li t4, 'z'           		# Valor ASCII de 'z'
   	li t5, 'A'           		# Valor ASCII de 'A'
    	li t6, 'Z'           		# Valor ASCII de 'Z'
    	li s9, ' '           		# Valor ASCII de ' '

    	lb t0, 0(a0)        		# Carrega o byte da string em t0
    	beqz t0, fim			# Verifica o fim de linha

	# Verifica se o caractere é uma letra minúscula
    	blt t0, t3, prox_c		# Vá para o prox char se for menor que 'a'
    	bgt t0, t4, prox_c		# Vá para o prox char se for maior que 'z'

   	# Converte o caractere para maiúscula
    	sub t0, t0, t3       		# Calcula a diferença entre o caractere e 'a'
    	add t0, t5, t0       		# Adiciona a diferença a 'A'
    	
    	sb t0, 0(a0)			# Armazena o caractere modificado de volta na string

    	j prox_c			# Vai para o proximo caractere


min:
    	lb t0, 0(a0)			# Carrega o byte da string em t0
    	beqz t0, fim			# Verifica o fim de linha
	
	# Verifica se o caractere é uma letra maiúscula
    	blt t0, t5, prox_c		# Vá para o prox char se for menor que 'A'
    	bgt t0, t6, prox_c		# Vá para o prox char se for maior que 'Z'

	# Converte o caractere para minusculo
    	sub t0, t0, t5       		# Calcula a diferença entre o caractere e 'A'
    	add t0, t3, t0      		# Adiciona a diferença a 'a'
    	
    	sb t0, 0(a0)			# Salva o byte em a0
    	j prox_c			# Vá para o proximo caractere

maiu:
    	addi a0, a0, 1			# Anda para o proximo caractere
    	lb t0, 0(a0)			# Carrega o byte 
    	beqz t0, fim			# Verifica o fim de string

    	# Verifica se o caractere é uma letra minúscula
    	blt t0, t3, prox_c		# Vá para o prox char se for menor que 'a'
    	bgt t0, t4, prox_c		# Vá para o prox char se for maior que 'z'

    	# Converte o caractere para maiúscula
    	sub t0, t0, t3       		# Calcula a diferença entre o caractere e 'a'
    	add t0, t5, t0       		# Adiciona a diferença a 'A'

    	sb t0, 0(a0)			# Salva o byte em a0

    	j prox_c			# Vá para o proximo caractere

prox_c:
    	addi a0, a0, 1			# Anda para o proximo caractere
    	lb t0, 0(a0)			# Carrega o byte em t0
	
    	beqz t0, fim			# Verifica o fim de string

    	sb t0, 0(a0)			# Salva o valor do byte
    	beq t0, s9, maiu		# Se for espaço vá para maiu
    	j min				# Se não for nenhuma das opções vá para min


fim:
	la a0, str1			#Indicando o local do buffer	
	li a7, 4			#Imprime a string formatada
	ecall
	
	add a0, zero, zero		#Limpando a0
	la a0, NW			#Carregando o caracter de nova linha
	ecall				#Printando o '\n'
	
	li a7, 10			#Carrega um imediato no registrador a7
	ecall				#Realiza a finalização do programa			
