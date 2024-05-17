
# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 25
    li $t1, 10
    sub $t2, $t0, $t1 # $t2 contains 35
    li $v0, 10
    syscall # -> uses syscall-code from $v0

# How do we exit the program ? - Through system calls
# Many calls are there and we pick appropriate one! 10 is the 
# code for the exit so, place it in $v0! you are all done!
