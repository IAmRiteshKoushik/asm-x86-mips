# Nested functions example in MIPS Assembly

# Function Prototypes
.globl main
.globl func1
.globl func2

# Main function
main:
    # Set up the stack frame
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $fp, 0($sp)
    move $fp, $sp

    # Call func1
    jal func1

    # Restore stack frame and return
    lw $ra, 4($sp)
    lw $fp, 0($sp)
    addi $sp, $sp, 8


    li $v0, 10  # Exit system call
    syscall

# First nested function
func1:
    # Set up the stack frame
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $fp, 0($sp)
    move $fp, $sp

    # Example operation
    li $a0, 6  # Argument for func2
    jal func2

    # Example operation: print the return value from func2
    move $a0, $v0
    li $v0, 1
    syscall

    # Restore stack frame and return
    lw $ra, 4($sp)
    lw $fp, 0($sp)
    addi $sp, $sp, 8
    jr $ra

# Second nested function
func2:
    # Set up the stack frame
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $fp, 0($sp)
    move $fp, $sp

    # Example operation: double the input value
    sll $v0, $a0, 1   # $v0 = $a0 * 2

    # Restore stack frame and return
    lw $ra, 4($sp)
    lw $fp, 0($sp)
    addi $sp, $sp, 8
    jr $ra

.data
# No data needed for this example
