.data
	msg1: .asciiz "Enter number of Iteration: "
	msg2: .asciiz "\nFirst Time in MIPS"

.text
	.globl main

main:
	la $a0, msg1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2

loop_printing:
	beq $t0, $zero, exit # if t0 is equal to zero then exit else
	addi $t0, $t0, -1
	syscall # print the msg2
	j loop_printing

exit:
	li $v0, 10
	syscall