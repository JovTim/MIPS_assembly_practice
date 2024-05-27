.data	
	user: .asciiz "Enter Range: "
	new_line: .asciiz "\n"
	space: .asciiz " "
.text
	.globl main

main:
	la $a0, user
	li $v0, 4
	syscall
	
	li $v0, 5 
	syscall
	
	li $t2, 1 # outerloop count
	move $t1, $v0 # user range
	
	
	addi $t1, $t1, 1
	
	jal outerloop
	outerloop:
		li $t3, 1
		beq $t1, $t2, exit
		
		la $a0, new_line
		li $v0, 4
		syscall
		addi $t2, $t2, 1
		innerloop:
			li $t4, 1
			li $t5, 11
			
			beq $t3, $t5, outerloop
			
			mul $t4, $t4, $t2
			
			move $a0, $t4
			li $v0, 1
			syscall
			
			la $a0, space
			li $v0, 4
			syscall
			
			
			addi $t4, $t4, 1
			
			addi $t3, $t3, 1
			
			jal innerloop
			
			
	

exit:
	li $v0, 10
	syscall