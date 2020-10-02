.data
	ms1: .asciiz "Ingrese un numero: "
	ms2: .asciiz "Los numeros impares hasta "
	ms3: .asciiz " son: "
.text
main:
	li $v0, 4
	la $a0, ms1
	syscall

	li $t1,0
	li $t2,0
	li $t3,1
	li $t4,2
	
	li $v0,5 
	syscall
	move $t2, $v0

	li $v0, 4
	la $a0, ms2
	syscall

	move $a0, $t2
	li $v0,1
	syscall

	li $v0, 4
	la $a0, ms3
	syscall

	div $t4, $t2, $t4	

	Loop:
		beq $t4, $t1, Exit

		move $a0, $t3
		li $v0,1
		syscall

		li $v0, 11 
		la $a0, 32 #para el espacio
		syscall

		add $t3, $t3, 2

	add $t1, $t1, 1
	j Loop
	Exit:
jr $ra