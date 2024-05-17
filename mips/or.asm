.text
    main:
        li $t1, 1
        li $t2, 0
        or $t0, $t1, $t2
        li $v0, 10
    syscall
