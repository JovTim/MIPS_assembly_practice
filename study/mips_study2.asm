.data
    num1: .word 10           # Integer dividend
    num2: .word 3            # Integer divisor

.text
    .globl main
main:
    # Load integers
    lw $t0, num1             # Load dividend into $t0
    lw $t1, num2             # Load divisor into $t1

    # Convert integers to floating-point numbers
    mtc1 $t0, $f0            # Move $t0 to floating-point register $f0
    mtc1 $t1, $f1            # Move $t1 to floating-point register $f1
    cvt.s.w $f0, $f0         # Convert $f0 from integer to float
    cvt.s.w $f1, $f1         # Convert $f1 from integer to float

    # Perform floating-point division
    div.s $f2, $f0, $f1      # $f2 = $f0 / $f1

    # Print the floating-point result
    li $v0, 2                # Load system call code for print float (2)
    mov.s $f12, $f2          # Move the result to $f12, required by syscall
    syscall                 # Make the system call

    # Exit program
    li $v0, 10               # Load system call code for exit (10)
    syscall                 # Make the system call
