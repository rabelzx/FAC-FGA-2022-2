.data
	quebra_lin: .asciiz "\n"
	testatgem: .space 2048
	
.text	
main:
	#lendo o inteiro

	li $v0, 5 
   	syscall
   	move $s7, $v0  
   	
	#lendo a string

	li $v0, 8
	la $a0, testatgem
	li $a1, 2048
	syscall
	la $s1, ($a0)
	
	li $t7, 2
	div $s7,$t7
	mflo $s4
	addi $s0,$s7,-1
	add $t0,$zero,$zero
	la $s3,($s1)
	add $s1,$s1,$s0

loop:
	#condicao de parada
	beq $t0, $s4, yes
	
	lb $t1,0($s1)
	lb $t2,0($s3)
	bne $t1,$t2, naoehpalindromo
	addi $s1,$s1,-1
	addi $s3,$s3,1
	addi $t0,$t0,1
    	j loop
    	
naoehpalindromo:
	
	li $v0 , 1
	li $a0,0
	syscall
	j end
	
yes:
	
	li $v0 ,1
	li $a0, 1
	syscall
	j end	
	
end: 
    	#quebra linha
	li $v0 , 4
	la $a0 , quebra_lin
	syscall
	
	#encerrando
	li $v0, 10
	syscall

