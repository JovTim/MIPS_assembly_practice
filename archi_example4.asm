.text
	.globl main

main:
	li $t1, 5
	li $t2, 3
	
	beq $t1, $t2, quit
	addi $t3, $t2, 5
	
	
quit:
	li $v0, 10
	syscall