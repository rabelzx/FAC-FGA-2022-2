.data
	ehPrimo: .asciiz "sim"
	nEhPrimo: .asciiz "nao"
	invaPrimo: .asciiz "Entrada invalida."
.text
main:
	li $v0,5 
	syscall
	
	move $t0, $v0 
	
	move $t1, $zero 
	
	addi $t1,$t1,2 
	
	addi $t5,$t5,1
	beq  $t0,$t5,nPrimo
	
	blt $t0,$t1,saidaInvalida 
	
	mtc1 $t0, $f1 
	
	cvt.s.w $f1,$f1 
	
	sqrt.s $f2,$f1 
	
	floor.w.s $f2,$f2
	
	mfc1 $t3,$f2
	
	addi $t4,$t4,1
	addi $t6,$t6,1
	
	loop:
		ble $t3,$t4,sPrimo
		
		div $t7,$t0, $t3
		
		mfhi $s0
		
		beqz $s0, nPrimo
		
		sub $t3,$t3,$t6
		j loop
	
	sPrimo:
		li $v0,4 
		la $a0, ehPrimo 
		syscall
		
		j saida
	nPrimo:
		li $v0,4 
		la $a0, nEhPrimo 
		syscall
		
		j saida
	saida:
		li $v0,10 # Finaliza o Programa
		syscall
		
	saidaInvalida:
		li $v0,4 
		la $a0, invaPrimo
		syscall
		
		li $v0,10 # Finaliza o Programa
		syscall
