.data
input1: .asciiz "Please Ether the First integer: "
input2: .asciiz "Please Ether the First integer: "

sum: .asciiz "sum: "
difference: .asciiz "difference: "
product: .asciiz "product: "
qoutient: .asciiz "qoutient: "
newline: .asciiz"\n"

.text
.globl main

main:
    la $a0, input1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0

    la $a0, input2
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    add $t2, $t0, $t1
    la $a0, sum
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    la $a0, newline
    li $v0, 4
    syscall
    
    sub $t2, $t0, $t1
    la $a0, difference
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    la $a0, newline
    li $v0, 4
    syscall
    
    mul $t2, $t0, $t1
    la $a0, product
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    la $a0, newline
    li $v0, 4
    syscall


	div $t2, $t0, $t1
    la $a0, qoutient
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    la $a0, newline
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall