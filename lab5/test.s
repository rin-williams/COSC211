# Exercise 1
# Your Name
# Your Student Number

    .data
prompt1: .asciiz "Please enter the first number: "
prompt2: .asciiz "Please enter the second number: "
result:  .asciiz "The product is: "
overflow: .asciiz "Error: Multiplication overflow."

    .text
    .globl main
main:
    # Read the first number
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Store the first number in $t0

    # Read the second number
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Store the second number in $t1

    # Initialize $t2 (product) to 0
    move $t2, $zero

multiply:
    andi $t3, $t1, 1  # Check if the current bit is 1
    beq $t3, $zero, skip
    addu $t2, $t2, $t0  # Add the first number to the product
    sltu $t3, $t2, $t0  # Check for overflow
    bne $t3, $zero, error  # If overflow, jump to error

skip:
    srl $t1, $t1, 1  # Shift the second number to the right
    sll $t0, $t0, 1  # Shift the first number to the left
    bne $t1, $zero, multiply  # If the second number is not zero, repeat

    # Print the result
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    j exit

error:
    # Print the error message
    li $v0, 4
    la $a0, overflow
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall
