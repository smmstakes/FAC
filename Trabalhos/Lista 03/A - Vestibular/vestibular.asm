.data
	STR1: .space 1000
	STR2: .space 1000
	NW: .asciz "\n"
.text
	addi s0, zero, 2	#qtd = s0
	add s1, zero, zero	#pts = s1
	
	li a2, 0		#Definindo entrada padrão (stdin)
	li a7, 5		#Leitura de inteiro
	ecall
	add s0, a0 ,s0
	add a0, zero, zero	#Limpando a0
	add a1, zero, zero	#Limpando a1
	
	la a0, STR1     	#Endereço de STR1
	mv a1, s0		#Tamanho máximo de leitura
  	li a7, 8		#Leitura de string
  	ecall
  	
  	la a0, STR2     	#Endereço de STR2
  	li a7, 8		#Leitura de string
  	ecall			
  	
  	add a0, zero, zero	#Limpando a0
	add a1, zero, zero	#Limpando a1
  	la a0, STR1		#Carregando string 1 em a0
  	la a1, STR2		#Carregando string 2 em a1
  	
  	j loop

loop:
	lb t0, 0(a0)       	#Carrega o byte da primeira string em t0
  	lb t1, 0(a1)       	#Carrega o byte da segunda string em t1
  	beq t0, t1, igual	#Se for igual vai para 'igual'
  	
  	beqz t0, fim_str	#Se for igual a '/0' acabou a comparação
  	addi a0, a0, 1		#Anda para o proximo caracter
  	addi a1, a1, 1		#Anda para o proximo caracter
  	j loop
  	
igual:
	addi s1, s1, 1		#pts = pts + 1
	
	addi a0, a0, 1		#Anda para o proximo caracter
  	addi a1, a1, 1		#Anda para o proximo caracter
	
	beqz t0, fim_str	#Se for igual a '/0' acabou a comparação
	j loop
  	
fim_str:
	add a0, zero, zero	#Limpando a0
	addi a0, s1, -2		
	li a2, 1		#Saida padrao (stdout)
	li a7, 1		#Imprimir um inteiro
	ecall
	
	li a7, 4		#Preparando para imprimir uma string
	la a0, NW		#Carregando a string de add
	ecall			#Printando o '\n'
	
	li a7, 10		#Carrega um imediato no registrador a7
	ecall			#Realiza a finalização do programa