.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\nYour age is: "
	
.text
	.globl main

main:
	# prompt the user to enter age.
	li $v0, 4
	la $a0, prompt
	syscall
	
	# get the user's age user input
	li $v0, 5
	syscall
	
	# Store the age in the $t0
	move $t0, $v0
	
	# Display message
	li $v0, 4
	la $a0, message
	syscall
	
	# Print or show the age
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
	
	
	