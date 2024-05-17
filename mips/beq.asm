.text
    main:
        li $t1, 5
        li $t2, 5

        beq $t1, $t2, end # If they are equal, go to end
        addi $t3, $t2, 5 # If they are not equal, come to this instruction

    end:
        li $v0, 10
    syscall
