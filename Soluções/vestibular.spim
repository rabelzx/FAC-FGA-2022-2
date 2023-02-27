.data
brk: .asciiz "\n"
gabarito: .space 1024
aluno: .space 1024
  
.text
main:
   #lendo inteiro n 
   addi $v0, $0, 5 
   syscall
   move $s0, $v0 
   
   #lendo string gabarito
   addi $v0, $0, 8
   la $a0, gabarito
   li $a1, 1024
   syscall 
   la $s1, gabarito
   
   #lendo string aluno
   addi $v0, $0, 8 
   la $a0, aluno
   li $a1, 1024
   syscall 
   la $s2, aluno
   
inicializando:
   #contador
   move $t0, $zero 
   #quantidade de acertos a ser printada no fim da execucao
   move $s3, $zero 
   
loop:
   #se o contador atingir o mesmo valor da quantidade de questoes, saia do loop
   beq $t0, $s0, end 
   lb $t4, 0($s1)
   lb $t5, 0($s2)
   jal verificar
   
   #incrementa o contador
   addi $t0, $t0, 1 
   
   #incrementa os ponteiros
   addi $s1, $s1, 1 
   addi $s2, $s2, 1 
   j loop
   
verificar:
   #verifica se os caracts sao iguais, se nao, retorna pra onde a funcao foi chamada, se sim, incrementa o contador da quantidade de acertos
   bne $t4, $t5, return 
   addi $s3, $s3, 1 
   
return:
   jr $ra 
   
end:
   #printa total de acertos
   addi $v0, $0, 1 
   add $a0, $0, $s3
   syscall 
   
   #quebra de linha
   li $v0, 4 
   la $a0, brk
   syscall 
   
   #finaliza programa
   li $v0, 10 
   syscall