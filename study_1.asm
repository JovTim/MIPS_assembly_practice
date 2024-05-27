.data
	user_1: .asciiz "Enter First Number: "
	user_2: .asciiz "Enter Second Number: "
	
	show: .asciiz "\nYou Entered: "
	
	bruh: .asciiz " + "

	addition: .asciiz "\nAddition: "

.text
	.globl main

main:
	la $a0, user_1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	la $a0, user_2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	la $a0, show
	li $v0, 4
	syscall
	
	move $a0, $t1 # print t1
	li $v0, 1
	syscall
	
	la $a0, bruh
	li $v0, 4
	syscall
	
	move $a0, $t2 # print t2
	li $v0, 1
	syscall
	
	add $t3, $t1, $t2
	la $a0, addition
	li $v0, 4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10 # end program
	syscall