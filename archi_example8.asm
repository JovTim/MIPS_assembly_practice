.data
	msg: .asciiz "This is a message!"
	
.text
	.globl main

main:
	jal display_message
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	# exit
	li $v0, 10
	syscall
	

display_message:
	la $a0, msg
	li $v0, 4
	syscall
	
	jr $ra