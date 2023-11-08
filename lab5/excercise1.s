# data section --------------------------
    .data
firstnum:
    .asciiz "Enter first number: "
secondnum:
    .asciiz "Enter second number: "
# main program --------------------------
    .text
    .globl main
main:
    li $v0, 4
    la $a0, firstnum
    syscall

    li $v0, 5
    syscall
    add $s0, $0, $v0

    li $v0, 4
    la $a0, secondnum
    syscall

    li $v0, 5
    syscall
    add $s1, $0, $v0

    
    jal multiply

    j print_num

multiply:






exit:
    addi	$v0, $0, 10		# System call 10 - Exit
    syscall					# execute
