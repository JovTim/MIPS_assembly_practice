.data
	int_1: .asciiz "Enter first: "
	int_2: .asciiz "Enter second: "
	
	output_mul: .asciiz "Mul Output: "
	output_div: .asciiz "\nDiv Output: "
	
.text
	.globl main
	
main:
	la $a0, int_1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	la $a0, int_2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	la $a0, output_mul
	li $v0, 4
	syscall
	
	mul $t0, $t1, $t2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, output_div
	li $v0, 4
	syscall
	
	mtc1 $t1, $f1
	mtc1 $t2, $f2
	cvt.s.w $f1, $f1
	cvt.s.w $f2, $f2
	
	div.s $f3, $f1, $f2
	
	mov.s $f12, $f3
	li $v0, 2
	syscall
	
	
	li $v0, 10
	syscall
	