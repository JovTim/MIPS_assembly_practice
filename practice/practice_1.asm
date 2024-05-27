.data
	sample_1: .asciiz "Enter Number: "
	sample_2: .asciiz "Enter Number: "
	
	output: .asciiz "\nYour Output: "
	
.text
	.globl main

main:
	la $a0, sample_1
	li $v0, 4
	syscall
	 
	li $v0, 5
	syscall
	move $t1, $v0
	
	la $a0, sample_2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	add $t0, $t1, $t2
	
	la $a0, output
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	mtc1 $t1, $f1
	mtc1 $t2, $f2
	cvt.s.w $f1, $f1
	cvt.s.w $f2, $f2
	
	div.s $f4, $f1, $f2
	
	la $a0, output
	li $v0, 4
	syscall
	
	mov.s $f12, $f4
	li $v0, 2
	syscall
	
	li $v0, 10
	syscall