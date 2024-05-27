.globl main

.text
main:
	li $t1, 4
	li $t8, 0x10010010 # must be word length (4 bytes) and a factor of 4
	lw $t2, fix_val
	add $t3, $t1, $t2
	sub $t4, $t1, $t2
	sw $t4, 0($t8)
	
	li $v0, 10
	syscall
	
	fix_val: .word 2