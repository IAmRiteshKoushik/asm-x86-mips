# SET 1
.globl main
.text

main:
    li $t0,0

    li $v0,4
    la $a0,ninp
    syscall

    li $v0,5
    syscall
    move $t6,$v0

    # Call the process_numbers function
    jal process_numbers

    li $v0,10
    syscall

process_numbers:
    # Save return address and necessary registers
    addi $sp, $sp, -32
    sw $ra, 28($sp)
    sw $s0, 24($sp)
    sw $s1, 20($sp)
    sw $t0, 16($sp)
    sw $t4, 12($sp)
    sw $t5, 8($sp)
    sw $t6, 4($sp)

    li $s0,5
    li $s1,2

    li $t0,0
    li $t4,0
    li $t5,0
    j check

check:
    blt $t0,$t6,evenloop
    j end

evenloop:
    li $v0,4
    la $a0,msg
    syscall

    li $v0,5
    syscall
    move $t2,$v0

    div $t2,$s1
    mfhi $t3

    beq $t3,$zero,incrcounter
    j check

incrcounter:
    bge $t2,$t5,addeven
    j check

addeven:
    li $v0,1
    move $a0,$t2
    syscall

    li $v0,4
    la $a0,chose
    syscall

    move $t5,$t2
    add $t4,$t4,$t2

    addi $t0,$t0,1
    j check

end:
    li $v0,4
    la $a0,sum
    syscall

    li $v0,1
    move $a0,$t4
    syscall

    # Restore saved registers and return
    lw $ra, 28($sp)
    lw $s0, 24($sp)
    lw $s1, 20($sp)
    lw $t0, 16($sp)
    lw $t4, 12($sp)
    lw $t5, 8($sp)
    lw $t6, 4($sp)
    addi $sp, $sp, 32

    jr $ra

.data
    ninp: .asciiz "Enter Value of N: "
    msg: .asciiz "Enter number: "
    chose: .asciiz " number is chose\n\n"
    sum: .asciiz "Sum of the N choosen number: "
