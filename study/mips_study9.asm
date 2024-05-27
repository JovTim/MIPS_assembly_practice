.data
	number: .asciiz "Enter Number: "

.text
	.globl main

main:
	la $a0, number
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 1

loop_main:
	beq $t0, $zero, exit
	move $a0, $t0
	addi $t0, $t0, -1
	syscall
	j loop_main
	


exit:
	li $v0, 10
	syscall