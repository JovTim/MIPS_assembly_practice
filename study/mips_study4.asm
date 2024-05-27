# BMI calculator

.data
	weight: .asciiz "\n\nEnter Weight[kg]: "
	height: .asciiz "\nEnter Height[m]: "
	zero_as_float: .float 0.0
	
	final_output: .asciiz "Your BMI: "
	
	continue: .asciiz "\n\nContinue?[Y-Yes|N-No]: "
	
	underweight_stat: .asciiz "underweight"
	
	overweight_stat: .asciiz "overweight"
	
	normal_stat: .asciiz "normal weight"
	
	bmi_status: .asciiz "\nBMI status: "

.text
	.globl main

main:
	lwc1 $f4, zero_as_float
	
	la $a0, weight
	li $v0, 4
	syscall
	
	li $v0, 6 # read float
	syscall
	
	add.s $f2, $f0, $f4
	
	la $a0, height
	li $v0, 4
	syscall
	
	li $v0 6
	syscall
	
	add.s $f3, $f0, $f4
	
	jal calculation
	
	la $a0, final_output
	li $v0, 4
	syscall
	
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	la $a0, bmi_status
	li $v0, 4
	syscall
	
	jal status
	
	
	j retry
	
retry:
	la $a0, continue
	li $v0, 4
	syscall
	
	li $v0, 12 # read character string
	syscall
	move $t0, $v0
	beq $t0, 89, main
	beq $t0, 78, exit
	
calculation:
	mul.s $f3, $f3, $f3
	
	div.s $f0, $f2, $f3
	
	jr $ra


status:
	li.s $f5, 18.5
	c.lt.s $f0, $f5
	bc1t underweight
	
	li.s $f5, 25.0
	c.lt.s $f0, $f5
	bc1t normal_weight
	
	la $a0, overweight_stat
	li $v0, 4
	syscall
	
	jr $ra

underweight:
	la $a0, underweight_stat
	li $v0, 4
	syscall
	
	jr $ra


normal_weight:
	la $a0, normal_stat
	li $v0, 4
	syscall
	jr $ra


exit:
	li $v0, 10
	syscall
	
	
	