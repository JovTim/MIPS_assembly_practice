.text
	.globl main

main:
	li $t0, 10
	li $t1, 5
	
	addu $t2, $t0, $t1
	

print_integer:
	li $v0, 1
	syscall
	
exit:
	li $v0, 10
	syscall