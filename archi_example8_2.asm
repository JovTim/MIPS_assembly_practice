.text 
	.globl main

main:
	li $a1, 5
	li $a2, 9
	
	jal addNumbers
	
	li $v0, 1
	move $a0, $v1
	syscall
	
	li $v0, 10
	syscall
	
addNumbers:
	addu $v1, $a1, $a2
	jr $ra