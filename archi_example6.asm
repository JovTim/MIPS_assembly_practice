.data
	prompt1: .asciiz "Enter 1st Number: "
	prompt2: .asciiz "Enter 2nd Number: "
	print_equal: .asciiz "Both Input are equal!"
	print_less: .asciiz "Input1 less than Input2!"
	print_great: .asciiz "Input1 greater than Input2!"
	
.text
	.globl main

main:
	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $a0, prompt2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	
	beq $t0, $t1, equal
	bgt $t0, $t1, greater
	blt $t0, $t1, less
	

equal:
	li $v0, 4
	la $a0, print_equal
	syscall
	
	j exit
	
greater:
	li $v0, 4
	la $a0, print_great
	syscall
	
	j exit

less:
	li $v0, 4
	la $a0, print_less
	syscall
	
	j exit
	
exit:
	li $v0, 10
	syscall