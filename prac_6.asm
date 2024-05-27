.text
	.globl main

main:
	li $t1, 120 #fahrenheit
	li $t2, 32
	sub $t0, $t1, $t2
	
	li $t3, 5
	mult $t0, $t3
	
	mflo $t4
	
	li $t5, 9
	div $t4, $t5
	
	mflo $t6
	
	move $a0, $t6
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	