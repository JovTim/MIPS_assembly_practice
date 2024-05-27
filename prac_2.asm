.data
	my_name: .asciiz "Enter your name: "
	msg_1: .asciiz "Your name is: "
	
.text
	.globl main
	
main:
	la $a0, my_name
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	la $a0, msg_1
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall