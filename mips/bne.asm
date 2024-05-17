.text
    main:
        li $t1, 5
        li $t2, 3

        bne $t1, $t2, end # If they are equal, go to end
        addi $t3, $t2, 5 # If they are not equal, come to this instruction

    end:
        li $v0, 10
    syscall

# Other instructions
# bgt $1, $2, 100 (PC + 4 + 100)
# bge $1, $2, 100 (PC + 4 + 100)
# blt $1, $2, 100 (PC + 4 + 100)
# ble $1, $2, 100 (PC + 4 + 100)
