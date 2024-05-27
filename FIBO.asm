.data
	input: .asciiz "Input Range: "
	comma: .asciiz ", "

.text
	.globl main

main:
	la $a0, input
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0
	li $t2, 1
	
	li $t5, 0
	
	ble $t0, $t1, if_zero
	beq $t0, $t2, if_one
	
	addu $t0, $t0, -1
	
	j fibonacci
	
	if_zero:
		move $a0, $t1
		li $v0, 1
		syscall
		
		j exit
		
	if_one:
		move $a0, $t2
		li $v0, 1
		syscall
		
		j exit
		
	fibonacci:
		move $a0, $t2
		li $v0, 1
		syscall
		
		looping:
			beq $t5, $t0, exit
			
			la $a0, comma
			li $v0, 4
			syscall
			
			addu $t5, $t5, 1
			
			calculation:
				add $t3, $t1, $t2
				
				move $a0, $t3
				li $v0, 1
				syscall
				
				move $t1, $t2
				move $t2, $t3
			
			
				j looping
		

exit:
	li $v0, 10
	syscall