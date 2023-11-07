.data
	ADD: .asciz "ADD: "
	SUB: .asciz "SUB: "
	AND: .asciz "AND: "
	OR: .asciz "OR: "
	XOR: .asciz "XOR: "
	MASK: .asciz "MASK: "
	SLL: .asciz "SLL("
	SRL: .asciz "SRL("
	PAR: .asciz "): "
	ENTER: .asciz "\n"

.text
	#t0 = a, t1 = b, t2 = c, s1 = backup de 
	#s0 = c AND 31 (m), a0 = operações de ADD, SUB, AND, OR e XOR, s2 = SLL ou SRL
	
		li a2, 0		#Definindo a entrada padrão
		li a0, 0		#Inicializando a0 com zero
		
		li a7, 5		#Definindo o valor de a7 para a chamada de sistema
		ecall			#Fazendo a leitura 
		mv t0, a0		#Pegando o valor 'a'	
	
		ecall			#Lendo 
		mv t1, a0		#Pegando o valor 'b'
		
		ecall			#Lendo 
		mv t2, a0		#Pegando o valor 'c'
	
		andi s0, t2, 31		#Mascarando c e tornando em 'm'
		andi s1, t2, 31		#Copia de m
		andi s2, t2, 31
		
		j adicao		#Pula para a proxima instrução
		
		
	adicao: 
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, ADD		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		add a0, t0, t1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j subtracao		#Indo pra proxima instrução
		
		
	subtracao:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, SUB		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		sub a0, t0, t1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_and			#Indo pra proxima instrução
			
			
	f_and:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, AND		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		and a0, t0, t1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_or			#Indo pra proxima instrução	
	
	
	f_or:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, OR		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		or a0, t0, t1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_xor			#Indo pra proxima instrução
		
		
	f_xor:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, XOR		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		xor a0, t0, t1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_mask			#Indo pra proxima instrução
		
		
	f_mask:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, MASK		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		mv a0, s0		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_sll			#Indo pra proxima instrução
		
		
	f_sll:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, SLL		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		mv a0, s1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
		
		li a7, 4		#Preparando para imprimir uma string
		la a0, PAR		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1
		sll a0, t0, s1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
		
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j f_srl			#Indo pra proxima instrução
		
		
	f_srl:
		li a2, 1		#Definindo a saída padrão
		li a7, 4		#Preparando para imprimir uma string
		la a0, SRL		#Carregando a string de add
		ecall			#Printando o inicio
		
		li a7, 1		
		mv a0, s1		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
		
		li a7, 4		#Preparando para imprimir uma string
		la a0, PAR		#Carregando a string de add
		ecall			#Printando o inicio
		
		
		li a7, 1
		srl a0, t1, s2		#Adição de 'a' e 'b'
		ecall			#Printando o inteiro 'a+b'
			
		li a7, 4		#Preparando para imprimir uma string
		la a0, ENTER		#Carregando a string de add
		ecall			#Printando o '\n'
			
		j fim			#Indo pra proxima instrução
			
			
	fim:
		li a7, 10		#Carrega um imediato no registrador a7
		ecall			#Realiza a finalização do programa
		
	
	
		
			
			