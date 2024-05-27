# Temperature Converter
.data
	prog_title: .asciiz "\n\nTemperature Converter\n\n"
	options: .asciiz "[1]Celsius\n[2]Fahrenheit\n[3]Kelvin"
	user_choice: .asciiz "\n\nChoose: "
	
	continue: .asciiz "\n\nContinue?[Y-Yes|N-No]: "
	
	user_convert: .asciiz "\n\nEnter Temperature: "
	
	cel_title: .asciiz "\n\nCelsius to..."
	
	fah_title: .asciiz "\n\nFahrenheit to ..."
	
	kel_title: .asciiz "\n\nKelvin to..."
	
	#------Sentence Output
	fah_output: .asciiz "\nFahrenheit: "
	cel_output: .asciiz "\nCelsius: "
	kel_output: .asciiz "\nKelvin: "

.text
	.globl main
	
main:
	la $a0, prog_title
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
	
	li $t1, 1
	li $t2, 2
	li $t3, 3
	
	beq $t0, $t1, celcius
	beq $t0, $t2, fahrenheit
	beq $t0, $t3, kelvin

retry:
	la $a0, continue
	li $v0, 4
	syscall
	
	li $v0, 12
	syscall
	move $t0, $v0
	beq $t0, 89, main
	beq $t0, 78, exit

celcius:
	la $a0, cel_title
	li $v0, 4
	syscall
	
	la $a0, user_convert
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t4, $v0
	
	la $a0, fah_output
	li $v0, 4
	syscall
	
	jal celcius_calculation
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	la $a0, kel_output
	li $v0, 4
	syscall
	
	move $a0, $t6
	li $v0, 1
	syscall
	
	j retry
	
	

fahrenheit:
	la $a0, fah_title
	li $v0, 4
	syscall
	
	la $a0, user_convert
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t4, $v0
	
	jal fah_calculation
	
	la $a0, cel_output
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	la $a0, kel_output
	li $v0, 4
	syscall
	
	# kelvin cal
	li $t6, 273
	add $t5, $t5, $t6
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	j retry


kelvin:
	la $a0, kel_title
	li $v0, 4
	syscall
	
	la $a0, user_convert
	li $v0,4
	syscall
	
	li $v0, 5
	syscall
	move $t4, $v0
	
	jal kel_calculation
	
	la $a0, cel_output
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	la $a0, fah_output
	li $v0, 4
	syscall
	
	move $a0, $t7
	li $v0, 1
	syscall
	
	j retry

celcius_calculation:
	# Fahrenheit
	move $t5, $t4
	
	li $t6, 9
	mul $t5, $t5, $t6
	
	li $t6, 5
	div $t5, $t5, $t6
	
	li $t6, 32
	add $t5, $t5, $t6
	
	# Kelvin
	li $t7, 273
	add $t6, $t5, $t7
	
	
	jr $ra

fah_calculation:
	# Cel
	move $t5, $t4
	
	li $t6, 32
	sub $t5, $t5, $t6
	
	li $t6, 5
	mul $t5, $t5, $t6
	
	li $t6, 9
	div $t5, $t5, $t6
	
	
	jr $ra
	
kel_calculation:
	# Cel
	
	move $t5, $t4
	
	li $t6, 273
	sub $t5, $t5, $t6
	
	move $t7, $t4
	
	li $t1, 273
	sub $t7, $t7, $t1
	
	li $t1, 9
	mul $t7, $t7, $t1
	
	li $t1, 5
	div $t7, $t7, $t1
	
	li $t1, 32
	add $t7, $t7, $t1
	
	jr $ra

exit:
	li $v0, 10
	syscall