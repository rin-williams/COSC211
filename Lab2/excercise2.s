#-----------------------------------------------------------------
#Assingment 2 excercise 2
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data 
str1: 
    .asciiz "Enter number 1: "
str2: 
    .asciiz "Enter number 2: "
sum:
    .asciiz "The sum of the two numbers is "
diff:
    .asciiz "The difference of the two numbers is " 
linebr:
    .asciiz "\n"
#-----------------------------------------------------------------	
#code section
    .text
    .globl main
main:
    #Load str1
    li $v0, 4
    la $a0, str1
    syscall

    #accept a num
    li $v0, 5
    syscall
    
    #store in $t0
    move $t0, $v0

    #load str2
    li $v0, 4
    la $a0, str2
    syscall

    #accept a num
    li $v0, 5
    syscall

    #store in $t1
    move $t1, $v0

    #perform summation
    add $s0, $t0, $t1

    #display the sum
    li $v0, 4
    la $a0, sum
    syscall

    #display the result of summation (int)
    li $v0, 1
    move $a0, $s0
    syscall

    #display the line break
    li $v0, 4
    la $a0, linebr
    syscall

    #perform subtraction
    sub $s1, $t0, $t1

    #display the sub
    li $v0, 4
    la $a0, diff
    syscall

    #display the result of subtraction (int)
    li $v0, 1
    move $a0, $s1
    syscall

    addi $v0, $0, 10		# System call 10 - Exit
    syscall					# execute