# in this program, the user will have an option to choose which arithmetic operation they will perform
# in this case, just like c language, I will also perform a case switch statement in MIPS assembly

.data
	show_options: .asciiz "[1] - Division \n[2] - Multiplication \n[3] - Subraction \n[4] - Addition"
	user_option: .asciiz "\nEnter your choice: "
	
	first_input: .asciiz "\nInput 1: "
	second_input: .asciiz "Input 2: "
	
	quot_output: .asciiz "\nThe quotient is: "
	prod_output: .asciiz "\nThe product is: "
	diff_output: .asciiz "\nThe difference is: "
	sum_output: .asciiz "\nThe sum is: "
	
.text
	.globl main

main:
	la $a0, show_options # Show the options
	
	li $v0, 4 # Print the options
	syscall
	
	la $a0, user_option # Show the user options
	li $v0, 4
	syscall
	
	li $v0, 5 # Read the input of the user options
	syscall
	move $t0, $v0 # move to t0
	
	li $t1, 1
	li $t2, 2
	li $t3, 3
	li $t4, 4
	# if the user press 1, then they will go to the division method
	# if the user press 2, then they will go to the multiplication method
	# if the user press 3, then they will go to the subraction method
	# if the user press 4, then they will go to the addition method
	beq $t0, $t1, division
	beq $t0, $t2, multiplication
	beq $t0, $t3, subraction
	beq $t0, $t4, addition
	
# Division Method
division:
	la $a0, first_input # prompt first user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the first user input
	syscall
	
	move $t1, $v0 # move the first user input to t1
	
	la $a0, second_input # prompt the second user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the second user input 
	syscall
	
	move $t2, $v0 # move the first user input to t2
	
	mtc1 $t1, $f1
	mtc1 $t2, $f2
	cvt.s.w $f1, $f1
	cvt.s.w $f2, $f2
	
	div.s $f4, $f1, $f2
	
	la $a0, quot_output
	li $v0, 4
	syscall
	
	mov.s $f12, $f4
	li $v0, 2
	syscall
	
	j exit # stop the program

# Multiplication Method
multiplication:
	la $a0, first_input # prompt first user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the first user input
	syscall
	
	move $t1, $v0 # move the first user input to t1
	
	la $a0, second_input # prompt the second user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the second user input 
	syscall
	
	move $t2, $v0 # move the first user input to t2
	
	mul $t5, $t1, $t2 # multiply t1 and t2 and will insert it to t5
	la $a0, prod_output # show the sentence output
	li $v0, 4
	syscall
	
	move $a0, $t5 # show the final output
	li $v0, 1
	syscall
	
	j exit # stop the program
	
# Subraction Method
subraction:
	la $a0, first_input # prompt first user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the first user input
	syscall
	
	move $t1, $v0 # move the first user input to t1
	
	la $a0, second_input # prompt the second user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the second user input 
	syscall
	
	move $t2, $v0 # move the first user input to t2
	
	sub $t4, $t1, $t2 # subract t1 and t2 and will insert it to t4
	la $a0, diff_output # show the sentence output
	li $v0, 4
	syscall
	
	move $a0, $t4 # show the final output 
	li $v0, 1
	syscall
	
	j exit # stop the program
	
# Addition Method
addition:
	la $a0, first_input # prompt first user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the first user input
	syscall
	
	move $t1, $v0 # move the first user input to t1
	
	la $a0, second_input # prompt the second user input
	li $v0, 4
	syscall
	
	li $v0, 5 # read the second user input 
	syscall
	
	move $t2, $v0 # move the first user input to t2
	
	add $t0, $t1, $t2 # add t1 and t2 and will insert it to t5
	la $a0, sum_output # show the sentence output
	li $v0, 4
	syscall
	
	move $a0, $t0 # show the final output
	li $v0, 1
	syscall
	
	j exit # stop the program

# Method for stopping the Program
# One of the best reasons why we need an exit method or syntax overall, is because it is a good practice and to avoid looping	
exit:
	li $v0, 10
	syscall