.data 
	my_name: .asciiz "My name is Jovan Timosa"

.text
	.globl main
	
main:
	la $a0, my_name
	
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall