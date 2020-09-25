.data
	ms1: .asciiz "Ingrese un numero: "
	ms2: .asciiz "Los 5 primeros multiplos de "
	ms3: .asciiz " son:"
	array_1: .word	1, 2, 3, 4, 5
	ms4: .asciiz "\n"
.text
main:
	li $v0,4
	la $a0, ms1
	syscall

	li $v0,5 
	syscall

	move $t3, $v0 #4 esta en t3
	
	
	li $v0,4
	la $a0, ms2
	syscall

	move $a0, $t3

	li $v0,1
	syscall

	li $v0,4
	la $a0, ms3
	syscall

	li $t0, 0 # para el array
    	la $t1, array_1

	

	loop1:
    		bge     $t0, 5, exit
    
    		lw      $t2, 0($t1)
    		add    $t1, $t1, 4

		mul $t6, $t2, $t3 #esto no estaba

		li $v0,4
		la $a0, ms4
		syscall

    		li      $v0, 1    # syscall to print value  (unos) 
    		move    $a0, $t6 #estaba en t2
    		syscall
		
		li      $a0, 32 # printing character (space)
    		li      $v0, 11  
    		syscall
    
    		add    $t0, $t0, 1 # increment counter
    		j      loop1
	exit:

	jr $ra

	