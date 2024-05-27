.text
	.globl main
	
main:
	li $t1, 20
	li $t2, 8
	sub $t0, $t1, $t2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall