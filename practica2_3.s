.data
	ms1: .asciiz "Ingrese un elemento del vector 1: " 
	ms2: .asciiz "Ingrese un elemento del vector 2: " 
	ms3: .asciiz "\nEl producto escalar es: " 
	array_1: .word 1:3
	array_2: .word 1:3
.text
main:
	la $t0, array_1
	la $t1, array_2
loop1:
	beq $t2, 3 end_loop1

	li $v0, 4
	la $a0, ms1
	syscall

	li $v0, 5
	syscall
	move $a0, $v0

	sw $a0 ,0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	j loop1

end_loop1:

	li $t2, 0

loop2:
	beq $t2, 3 end_loop2

	li $v0, 4
	la $a0, ms2
	syscall

	li $v0, 5
	syscall
	move $a0, $v0

	sw $a0 ,0($t1)
	add $t1, $t1, 4
	add $t2, $t2, 1
	j loop2

end_loop2:

	li $t2, 0
	la $t0, array_1
	la $t1, array_2
	li $t6,0

loop3:
	beq $t2, 3 end_loop3
	lw $t3, 0($t0)
	lw $t4, 0($t1)
	mult $t3, $t4
	mflo $t5
	add $t6, $t6, $t5

	add $t0, $t0, 4
	add $t1, $t1, 4

	add $t2, $t2, 1
	j loop3

end_loop3:
	li $v0,4
	la $a0, ms3
	syscall

	li $v0, 1
	move $a0, $t6
	syscall

jr $ra