.data
	title_prog: .asciiz "Sample Program\n\n"
	options: .asciiz "[1]Option 1\n[2]Option 2\n[3]Option 3\n[4]Exit"
	
	user_choice: .asciiz "\n\nEnter Option: "
	
	opt_title_1: .asciiz "Welcome to Option 1!\n"
	
	goodbye: .asciiz "\nGoodbye!"

.text
	.globl main
	
main:
	la $a0, title_prog
	li $v0, 4
	syscall
	
	la $a0, options
	li $v0, 4
	syscall
	
	la $a0, user_choice
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	
	
	# options
	li $t1, 1
	li $t4, 4
	
	beq $t0, $t1, option1
	beq $t0, $t4, exit
	
option1:
	la $a0, opt_title_1
	li $v0, 4
	syscall
	
	j main
	

exit:
	la $a0, goodbye
	li $v0, 4
	syscall

	li $v0, 10
	syscall