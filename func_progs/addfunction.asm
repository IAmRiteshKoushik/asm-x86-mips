.text
.globl main

main:
  # Save return address and frame pointer
  addi $sp, $sp, -8        # Make space on the stack
  sw $ra, 4($sp)           # Save return address
  sw $fp, 0($sp)           # Save frame pointer
  move $fp, $sp             # Set frame pointer

  # Get input for t1
  li $v0, 4                # Load syscall code for print_string
  la $a0, prompt1           # Load address of prompt1
  syscall                   # Print the prompt

  li $v0, 5                # Load syscall code for read_int
  syscall                   # Read integer into $v0
  move $a1, $v0             # Move input to $a0

  # Get input for t2
  li $v0, 4                # Load syscall code for print_string
  la $a0, prompt2           # Load address of prompt2
  syscall                   # Print the prompt

  li $v0, 5                # Load syscall code for read_int
  syscall                   # Read integer into $v0
  move $a2, $v0             # Move input to $a1

  # Call addfunc
  jal addfunc               # Jump and link to addfunc

  move $t0, $v0             # Move result from $v0 to $t0

  # Print result message
  li $v0, 4                # Load syscall code for print_string
  la $a0, result_msg        # Load address of result_msg
  syscall                   # Print the result message

  # Print result value
  li $v0, 1                # Load syscall code for print_int
  move $a0, $t0             # Move result to $a0
  syscall                   # Print the result

  # Restore return address and frame pointer
  lw $fp, 0($sp)           # Restore frame pointer
  lw $ra, 4($sp)           # Restore return address
  addi $sp, $sp, 8          # Deallocate stack space
  jr $ra                    # Return to caller

# Function addfunc
addfunc:
  # Save return address and frame pointer
  addi $sp, $sp, -16       # Make space on the stack
  sw $ra, 12($sp)           # Save return address
  sw $fp, 8($sp)            # Save frame pointer
  sw $a2, 4($sp)           # Save argument $a0 (commented out)
  sw $a1, 0($sp)           # Save argument $a1 (commented out)
  move $fp, $sp             # Set frame pointer

  # Perform addition (unsigned)

  addu $t5, $a2, $a1        # Add arguments and store result in $v0
  move $v0,$t5

  # Restore saved registers and frame pointer (commented out)
  lw $a2, 4($sp)           # Restore argument $a0
  lw $a1, 0($sp)           # Restore argument $a1
  lw $fp, 8($sp)            # Restore frame pointer
  lw $ra, 12($sp)           # Restore return address
  addi $sp, $sp, 16       # Deallocate stack space
  jr $ra                    # Return to caller

.data
  prompt1: .asciiz "Enter value for t1: "
  prompt2: .asciiz "Enter value for t2: "
  result_msg: .asciiz "Result of addition is: "
