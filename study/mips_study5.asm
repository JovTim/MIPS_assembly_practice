.data
	user_name: .asciiz "Enter your name: "
	output: .asciiz "Your Name: "
	buffer: .space 100
	
.text
	.globl main

main:
	la $a0, user_name
	li $v0, 4
	syscall
	
	la $a0, buffer
	li $a1, 100
	li $v0, 8
	syscall
	
	move $t0, $a0
	
	la $a0, output
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall