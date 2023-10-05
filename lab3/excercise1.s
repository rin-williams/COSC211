#-----------------------------------------------------------------
#Assingment 3 excercise 1
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data
str_enter:
    .asciiz "Enter your number (1 or 0): "
str_base16:
    .asciiz "The number in base 16 is: 0x"
str_base10:
    .asciiz "The number in base 10 is: "
br:
    .asciiz "\n"
input:
    .asciiz ""

#-----------------------------------------------------------------	
# code section
    .text
    .globl main
main:
    # output str_enter
    li $v0, 4
    la $a0, str_enter
    syscall

    #read the input from user and store it inside input variable
    li $v0 8
    la $a0, input
    li $a1, 9
    syscall

    #load address of input to $t0
    la $t0, input

    # store the index
    li $t8, 7

    # var to store the total value of the binary.
    li $s0, 0

loop:
    # this is getting the index 0 of the input string
    lb $t1, ($t0)

    #if index is at null terminator, then exit because its at the end
    beqz $t1, calculateBase16

    # if $t1 contains '0', it will be 48 in asc, if '1', it will be 49,
    # subbing it by 48 will give out their 
    # actual values which is 0 and 1
    sub $t1, $t1, 48

    # shift to get the value at 2^($t8)
    sll $t7, $t1, $t8

    # add it to a saved var as defined before loop.
    addu $s0, $s0, $t7

    #decrement index to shift
    sub $t8, $t8, 1

    #increment pointer of the current array of input 
    add $t0, $t0, 1
    j loop

calculateBase16:
    # store the int into another int
    move $s1, $s0

    # print line break
    li $v0, 11
    la $a0, 10
    syscall

    # print out str_base16 string
    li $v0, 4
    la $a0, str_base16
    syscall

    #divide $s0 by 16.
    divu $s3, $s1, 16

    # get the remainder of the first calculation because we know it is going to be < 15 for sure.
    mfhi $s4

    blt $s3, 10, is0to9first
    
    # if not, it must be A-F
    addi $s3, $s3, 55
    j printHexFirstIndex
is0to9first:
    addi $s3, $s3, 48
    # s3 now contains character '0-9'
    j printHexFirstIndex
printHexFirstIndex:
    li $v0, 11
    move $a0, $s3
    syscall
    j calcSecondIndex

calcSecondIndex:
    # recall that $s4 is the second remainder
    blt $s4, 10, is0to9second
    addi $s4, $s4, 55
    j printSecondIndex
is0to9second:
    addi $s4, $s4, 48
    j printSecondIndex
printSecondIndex:
    li $v0, 11
    move $a0, $s4
    syscall
    j calculateBase10
calculateBase10:
    # print a line feed (10 asciiz is LF)
    li $v0, 11
    la $a0, 10
    syscall

    # print the str_base10 string
    li $v0, 4
    la $a0, str_base10
    syscall

    # print the value of the binary in integer
    li $v0, 1
    move $a0, $s0
    syscall

    j exit
exit:
    addi $v0, $0, 10		# System call 10 - Exit
    syscall					# execute