.text
	.globl main

main:
	li $t1, 2
	li $t2, 3
	
	slti $t3, $t1, 3
	
	li $v0, 10
	syscall