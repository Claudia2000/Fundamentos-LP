.data 
    	ms1: .asciiz "Ingrese un numero: "
    	ms2: .asciiz "Los elementos en orden inverso son:\n"
	array_1: .word	1:5 
    
.text 
main: 
	li $t0, 0
    	li $t2, 0
    	la $t1, array_1
loop1:
    	bge $t0, 5, end_loop1
    
    	li $v0, 4
    	la $a0, ms1
    	syscall
    
    	li  $v0,5 
    	syscall
    	move $t2, $v0
    
    	sw $t2, 0($t1) 
    	add $t1, $t1, 4 # increment pointer
    	add $t0, $t0, 1 
    	j loop1

end_loop1:

    	sub $t1, $t1,4
    	li $t0, 0
    	
    	li $v0, 4
    	la $a0, ms2
    	syscall

loop2:
    	bge $t0, 5, end_loop2
    	lw $t2, 0($t1)
    	sub $t1, $t1, 4

    	li $v0, 1      
    	move $a0, $t2
    	syscall

    	li $a0, 32

    	li $v0, 11
    	syscall
    	add $t0, $t0, 1	#i++

    	j loop2

end_loop2:

    	jr $ra