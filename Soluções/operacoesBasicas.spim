.data

str1: .asciiz "ADD: "
str2: .asciiz "SUB: "
str3: .asciiz "AND: "
str4: .asciiz "OR: "
str5: .asciiz "XOR: "
str6: .asciiz "MASK: "
str7: .asciiz "SLL("
str8: .asciiz "): "
str9: .asciiz "SRL("
brk: .asciiz "\n"

.text

main:
 li $v0, 5 
 syscall 
 move $t0, $v0  
 
 li $v0, 5  
 syscall
 move $t1, $v0  
 
 li $v0, 5  
 syscall
 move $t2, $v0  

#ADD
 add $s1, $t0, $t1  
 
 li $v0, 4
 la $a0, str1
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#SUB
 sub $s1, $t0, $t1 
 
 li $v0, 4
 la $a0, str2
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall
 
 #AND
 and $s1, $t0, $t1 
 
 li $v0, 4
 la $a0, str3
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#OR
 or $s1, $t0, $t1 
  
 li $v0, 4
 la $a0, str4
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#XOR
 xor $s1, $t1, $t0 
 
 li $v0, 4
 la $a0, str5
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#MASK
 andi $s1, $t2, 31 
 move $t3, $s1
 
li $v0, 4
 la $a0, str6
 syscall
 
 li $v0, 1
 move $a0, $t3
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#SLLV
 sllv $s1, $t0, $t3
 
 li $v0, 4
 la $a0, str7
 syscall
 
 li $v0, 1
 move $a0, $t3
 syscall
 
 li $v0, 4
 la $a0, str8
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
 
 li $v0, 4
 la $a0, brk
 syscall

#SLRV
 srlv $s1, $t1, $t3
 
 li $v0, 4
 la $a0, str9
 syscall
 
 li $v0, 1
 move $a0, $t3
 syscall
 
 li $v0, 4
 la $a0, str8
 syscall
 
 li $v0, 1
 move $a0, $s1
 syscall
  
li $v0, 10 #Finaliza programa
syscall
	
