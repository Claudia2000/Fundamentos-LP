.data
	ms1: .asciiz "Ingrese el numero: "
	ms2: .asciiz "No es primo"
	ms3: .asciiz "Es primo"

.text
main:	
	la $a0, ms1
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $t0, $v0
	li $t1, 2
	
loop:   beq $t0, $t1, es_primo
	div $t0, $t1
	mfhi $t2
	beqz $t2, no_es_primo
	addi $t1, $t1, 1
	b loop
	
no_es_primo:
	li $v0, 4
	la $a0, ms2
	syscall
	b exit
	
es_primo:
	li $v0, 4
	la $a0, ms3
	syscall
	b exit
	
exit:	li $v0, 10
	syscall

j $ra