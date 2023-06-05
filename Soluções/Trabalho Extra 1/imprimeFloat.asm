.data

	valorEntrada: .float 0.00000000          #padrao 32 bits com bit de sinal e 8 bits para bias
	br: .asciiz "\n"
	sinalpst: .asciiz "+\n"
	sinalngt: .asciiz "-\n"
	bitsinal: .asciiz "0x"
	hexadecimal: .space 8
	
.text

main:
	#recebendo o float
	li $v0, 6 		
	syscall
	mfc1.d  $t0, $f0 		
	
	li $v0, 2 		
    	mov.s $f12, $f0 	
    	syscall 		
    	
    	#quebra de linha
	li $v0, 4 		
    	la $a0, br 	
    	syscall 		
	
	# pega o MSB para verificar o sinal
	addi $t1, $zero, 1	
	sll  $t1, $t1, 31	
	and  $a0, $t0, $t1	
	srl  $a0, $a0, 31	
	move $t2, $a0		
	
	#if equal 0 = printPos
	beqz $t2, Positivo
		
	#if equal 1 = printNeg	
	beq  $t2, 1, Negativo	
	
	
	#quebra de linha
	li $v0, 4 		
    	la $a0, sinalpst 		
    	syscall 		
	

Positivo:
	li $v0, 4		
	la $a0, sinalpst		
	syscall
	
	j bias		
	
Negativo:
	li $v0, 4		
	la $a0, sinalngt		
	syscall
	
	j bias		

bias:
	addi $t2, $zero, 255	
	sll  $t2, $t2, 23	
	and  $a0, $t2, $t0	
	srl  $a0, $a0, 23 	
	addi $t3, $zero, 127	
	sub  $a0, $a0, $t3	
	
	li $v0, 1		
	syscall
	
	li $v0, 4 		
    	la $a0, br 	
    	syscall 		
    	
    	li $v0, 4		
    	la $a0, bitsinal		
    	syscall
	
	
	mul  $t2, $t2, $zero		
	ori $t2, $zero, 0xffff		
	sll  $t2, $t2, 7		
	ori $t2, $t2, 0x7f		
	and  $a0, $t0, $t2		
	jal transfHexa

	
	li $v0, 4 		
    	la $a0, br 	
    	syscall 		
	
	li $v0, 10
	syscall	
	
	
	
	
	
transfHexa:
	addi $sp, $sp, -24	
	sw   $a0, 0($sp)
    	sw   $s0, 4($sp)
    	sw   $s1, 8($sp)
    	sw   $s2, 12($sp)
    	sw   $s3, 16($sp)
    	sw   $s4, 20($sp)
	move $s2, $a0		
	addi $s0, $s0, 8	
	la   $s3, hexadecimal	
	
proxLoop:
	rol  $s2, $s2, 4	
	and  $s1, $s2, 0xf	
	ble  $s1, 9, ImprimeHex	
	addi $s1, $s1, 7	
	
ImprimeHex:
	addi $s1, $s1, 48	
	sb   $s1, ($s3)		
	addi $s3, $s3, 1	
	addi $s0, $s0, -1	
	bnez $s0, proxLoop	
	
	li $v0, 4		
	la $a0, hexadecimal	
	syscall
	
	jr $ra			
	syscall
	

