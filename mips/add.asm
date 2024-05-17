.data
number1: .word 1
number2: .word 2

.text
    main:
        li $v0, 1
        lw $t0, number1
        lw $t1, number2

        add $a0, $t1, $t0
        add $a1, $t1, $t0
        syscall

        li $v0, 10
        syscall

