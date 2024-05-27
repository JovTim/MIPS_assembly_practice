.data
	prompt1: .asciiz "Enter 1st Number: "
	prompt2: .asciiz "Enter 2nd Number: "
	print_equal: .asciiz "Both inputs are equal!"
	print_less: .asciiz "Input1 is less than Input2!"
	print_great: .asciiz "Input2 is greater than Input2"
	
	promp3: .asciiz "\n\nTry again?[0-No|1-Yes]: "

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

retry:
	la $a0, promp3
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	beq $zero, $t1, exit
	bne $zero, $t1, main
	
equal:
	li $v0, 4
	la $a0, print_equal
	syscall
	
	j retry
	
greater:
	li $v0, 4
	la $a0, print_great
	syscall
	
	j retry

less:
	li $v0, 4
	la $a0, print_less
	syscall
	
	j retry
	
exit:
	li $v0, 10
	syscall