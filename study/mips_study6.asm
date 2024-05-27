.data
	integer: .asciiz "Enter Number: "
	another: .asciiz "\nEnter Another: "
	output: .asciiz "Output: "
	
.text
	.globl main

main:
	la $a0, integer
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	la $a0, another
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	add $t3, $t0, $t1
	
	la $a0, output
	li $v0, 4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	