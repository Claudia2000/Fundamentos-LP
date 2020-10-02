.data
	ms1: .asciiz "Ingrese un numero: "
	ms2: .asciiz "El numero ingresado es par"
	ms3: .asciiz "El numero ingresado es impar"
.text
main: 
	addi $t0, $0, 2
	la $a0, ms1
	li $v0, 4
	syscall

	li $2,5
	syscall

	div $2, $t0 #habia un t0
	mfhi $t1
	
	beq $t1, $0, print_1
		la $a0, ms3
		li $2, 4
		syscall
	j fin
	print_1: la $a0, ms2

	li $2, 4
	syscall
	j fin
	fin: li $2, 10
	syscall
j $ra