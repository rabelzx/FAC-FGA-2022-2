main:
	#LEITURA DE N
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	#LEITURA DO PRIMEIRO VALOR
	li $v0, 5
	syscall
	add $t2,$v0,$zero
	
	#CONTADOR
	li $t4,1
	add $t1,$t1,$t4


	
Laco:
	beq $t1, $t0, Imprimir #CONDICAO PARA SAIR DO LACO
	li $v0, 5
	syscall
	
	bgt $v0, $t2, Maior
	
	continua:		
	addi $t1, $t1, 1 #INCREMENTA O CONTADOR
	j Laco

Maior:
	move $t2, $v0 #ADICIONA O NOVO MAIOR NUMERO NO REGISTRADOR
	j continua

Imprimir:

	#IMPRIMIR MAIOR NUMERO
	li $v0, 1
	la $a0, ($t2)
	syscall

	li $v0, 10
	syscall
	
