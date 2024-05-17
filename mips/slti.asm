.text
    main:
        li $t1, 2
        li $t2, 3

        slti $t3, $t1, 100 # if t1 < t2 -> t3 = 1 else 0

        li $v0, 10
    syscall
