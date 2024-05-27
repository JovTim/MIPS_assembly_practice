.data
	added: .asciiz "Added: "
	subtrac: .asciiz "\nSubtracted: "
	multip: .asciiz "\nMultiplied: "
	divide: .asciiz "\nDivided: "

.text
	.globl main

main:
	la $a0, added
	li $v0, 4
	syscall

	li $t1, 5
	li $t2, 6
	add $t0, $t1, $t2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, subtrac
	li $v0, 4
	syscall
	
	sub $t0, $t1, $t2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, multip
	li $v0, 4
	syscall
	
	mul $t0, $t1, $t2
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, divide
	li $v0, 4
	syscall
	
	mtc1 $t1, $f0
	mtc1 $t2, $f1
	cvt.s.w $f0, $f0
	cvt.s.w $f1, $f1
	
	div.s $f2, $f0, $f1
	
	li $v0, 2
	mov.s $f12, $f2
	syscall
	
	
	li $v0, 10
	syscall