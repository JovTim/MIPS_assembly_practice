.data 
	first_input: .asciiz "Input1: "
	second_input: .asciiz "Input2: "
	sum_output: .asciiz "\nSum: "
	diff_output: .asciiz "\nDifference: "
	prod_output: .asciiz "\nProduct: "
	quot_output: .asciiz "\nQuotient: "

.text
	.globl main

main:
	la $a0, first_input # prompt first user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the first user input
	syscall
	
	move $t1, $v0 # move the first user input to t1
	
	la $a0, second_input # prompt the second user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the second user input 
	syscall
	
	move $t2, $v0 # move the second user input to t2
	
	# addition
	add $t0, $t1, $t2 
	la $a0, sum_output
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall

	# subtraction
	sub $t4, $t1, $t2
	la $a0, diff_output
	li $v0, 4
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall
	
	# multiplication
	mul $t5, $t1, $t2
	la $a0, prod_output
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	# division
	mtc1 $t1, $f12
	mtc1 $t2, $f14
	div.s $f0, $f12, $f14
		
	mov.s $f12, $f0
	la $a0, quot_output
	li $v0, 4
	syscall
	
	move $a0, $t6
	li $v0, 2
	syscall
	
	
	li $v0, 10
	syscall