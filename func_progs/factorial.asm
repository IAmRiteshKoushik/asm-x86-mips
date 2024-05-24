.text
.globl main

# main function
main:
    # Save return address and frame pointer
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $fp, 0($sp)
    move $fp, $sp

    # Get input for t1
    li $v0, 4              # syscall to print string
    la $a0, prompt1
    syscall

    li $v0, 5              # syscall to read integer
    syscall
    move $a0, $v0          # move the input to $a0

    jal fact               # call fact function

    move $t1, $v0          # store result in $t1

    # Get input for t2
    li $v0, 4              # syscall to print string
    la $a0, prompt2
    syscall

    li $v0, 5              # syscall to read integer
    syscall
    move $a0, $v0          # move the input to $a0

    jal fact               # call fact function
    
    move $t2, $v0          # store result in $t2

    # Calculate t3 = t1 + t2
    add $t3, $t1, $t2

    # Print result message
    li $v0, 4              # syscall to print string
    la $a0, result_msg
    syscall

    # Print t3 value
    move $a0, $t3
    li $v0, 1              # syscall to print integer
    syscall

    # Restore return address and frame pointer
    lw $ra, 4($sp)
    lw $fp, 0($sp)
    addi $sp, $sp, 8
    jr $ra

# fact function
fact:
    # Save return address and frame pointer
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $fp, 4($sp)
    sw $a0, 0($sp)
    move $fp, $sp

    # Initialize
    move $t0, $a0          # t0 = n
    li $t1, 1              # t1 = f = 1

fact_loop:
    blez $t0, fact_end     # if (i <= 0) goto fact_end
    mul $t1, $t1, $t0      # f = f * i
    addi $t0, $t0, -1       # i = i - 1
    j fact_loop            # repeat the loop

fact_end:
    move $v0, $t1          # return f

    # Restore return address and frame pointer
    lw $a0, 0($sp)
    lw $ra, 8($sp)
    lw $fp, 4($sp)
    addi $sp, $sp, 12
    jr $ra


.data
    prompt1: .asciiz "Enter value for t1: "
    prompt2: .asciiz "Enter value for t2: "
    result_msg: .asciiz "Result t3 = t1 + t2 is: "
