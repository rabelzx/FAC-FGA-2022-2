.data
	
	espaço: .asciiz "\n"
	kelvin: .asciiz "K"
	celsius: .asciiz "C"
	farh: .asciiz "F"
	float1: .float 273.15
	float2: .float 32.0
	float3: .float 9.0
	float4: .float 5.0
	float5: .float 1.8
.text
	#primeira unidade
	li $v0, 12
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, espaço
	syscall
	
	#segunda unidade
	li $v0, 12
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, espaço
	syscall
	
	#temperatura 
	li $v0, 6
	syscall

	
	lbu $t0, celsius
	lbu $t1, kelvin
	lbu $t2, farh
			
	#cescobrindo tipo de conversão	
	beq $t0, $s0, Celsius
	beq $t1, $s0, Kelvin
	beq $t2, $s0, Fahrenheit
	
	li $v0, 10
	syscall

Celsius:
	beq $t1, $s1, CtoK
	beq $t2, $s1, CtoF
	j exit
	
Kelvin:
	beq $t0, $s1, KtoC
	beq $t2, $s1, KtoF
	j exit
	
Fahrenheit:
	beq $t0, $s1, FtoC
	beq $t1, $s1, FtoK
	j exit

KtoF:
	# F = 1.8*(K-273) + 32
	
	lwc1 $f1, float1
	lwc1 $f2, float5
	lwc1 $f3, float2
	
	sub.s $f4, $f0, $f1
	mul.s $f5, $f2, $f4
	add.s $f12, $f5, $f3
	
	li $v0, 2
	syscall
	
	j exit

FtoK:
	# K = (( F ? 32)*5)/9 + float1 

	lwc1 $f1, float1
	lwc1 $f2, float3
	lwc1 $f3, float4
	lwc1 $f4, float2
	
	sub.s $f5, $f0, $f4
	mul.s $f6, $f5, $f3
	div.s $f7, $f6, $f2
	add.s $f12, $f7, $f1
	
	li $v0, 2
	syscall
	
	j exit

CtoK:
	# K = C + 273.15

	lwc1 $f1, float1
	add.s $f12, $f1, $f0
	
	li $v0, 2
	syscall
	
	j exit

KtoC:
	# C = K - 273.15
	
	l.s $f1, float1
	sub.s $f12, $f0, $f1
	
	li $v0, 2
	syscall
	
	j exit

FtoC:
	# C = ((C°- 32)*5)/9
	
	lwc1 $f2, float3
	lwc1 $f3, float4
	lwc1 $f4, float2
	
	sub.s $f5, $f0, $f4
	mul.s $f6, $f5, $f3
	div.s $f12, $f6, $f2
	
	li $v0, 2
	syscall
	
	j exit

CtoF:
	# F = (C*1.8) + 32
	
	lwc1 $f1, float2
	lwc1 $f2, float5
	
	mul.s $f3, $f0, $f2
	add.s $f12, $f3, $f1
	
	li $v0, 2
	syscall
	
	j exit

exit:
	li $v0, 10
	syscall