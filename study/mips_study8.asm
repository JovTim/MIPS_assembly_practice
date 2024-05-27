.data
	float_1: .asciiz "Enter_1: "
	float_2: .asciiz "Enter_2: "
	
	output: .asciiz "Output: "
	
.text
	.globl main

main:


	la $a0, float_1
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	
	addi.s $f1, $f0, 0.0
	

	
	li $v0, 10
	syscall