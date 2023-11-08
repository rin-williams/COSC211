# Assignment 5-6
# STUID: 51940633
# This lab uses Method 2 of the multiplier
# data section --------------------------
    .data
firstnum:
    .asciiz "Enter first number: "
secondnum:
    .asciiz "Enter second number: "
answer:
    .asciiz "The product is: "
overflow:
    .asciiz "Error: Overflow"
# main program --------------------------
    .text
    .globl main
main:
    li $v0, 4
    la $a0, firstnum
    syscall

    li $v0, 5
    syscall
    add $t0, $0, $v0    #s0 contains multiplicand

    li $v0, 4
    la $a0, secondnum
    syscall

    li $v0, 5
    syscall
    add $t1, $0, $v0    #s1 contains multiplier

    add $t2, $0, $0     # product

multiply:
    andi $t3, $t1, 1    # check if current bit is a 1
    beqz $t3, isZero
    addu $t2, $t2, $t0
    

isZero:
    # if it is zero, we skip
    # shift the multiplicand to left
    sll $t0, $t0, 1
    # shift the multiplier to the right
    srl $t1, $t1, 1
    # if the second number is not zero after we shift left
    # then we repeat
    bnez $t1, multiply 

print_num:
    # we print result once it stops looping
    li $v0, 4
    la $a0, answer
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    j exit
swap:
    move $s0, $t0
    move $s1, $t1
    move $t0, $s1
    move $t1, $s0
    j multiply
error:
    li $v0, 4
    la $a0, overflow
    syscall
    j exit

exit:
    addi	$v0, $0, 10		# System call 10 - Exit
    syscall					# execute
