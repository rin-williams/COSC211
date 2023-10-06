#-----------------------------------------------------------------
#Assingment 3 excercise 2
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data
prompt:
    .asciiz "Enter your number (base 10): "
str_base2:
    .asciiz "The number in base 2 is: "
br:
    .asciiz "\n"
range:
    .asciiz "input must be in range [0, 255] !"
#-----------------------------------------------------------------	
# code section
    .text
    .globl main
main:
    # load prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # ask for input
    li $v0, 5
    syscall

    move $s0, $v0
    # $s0 now contains the input from 0-255.
    
    # if input is 255, is 255<256? yes, then return  1, if return 1, it will continue.
    slti $t0, $s0, 256
    beq $t0, 0, notInRange
    
    # if input is 0, is -1<-0? yes, then return  1, if return 1, it will continue.
    li $t0, -1
    slt $t0, $t0, $s0
    beq $t0, 0, notInRange

    # print line break
    li $v0, 11
    la $a0, 10
    syscall

    li $v0, 4
    la $a0, str_base2
    syscall

    li $t0, 7
    # make a dupe of $s0
    move $t1, $s0
loop:
    # recall that $t1 contains $s0 aka user integer input
    # if loop index is < 0, exit
    blt $t0, 0, exit
    # if $t1 contains 1111 1111, then shift right by $t0 pos will be
    # 0000 0001 (since $t0 starts at 7)
    srlv $t2, $t1, $t0
    # anding 0000 0001, with 1 will just be 0000 0001.
    and $t2, $t2, 1

    # print the char out
    li $v0, 1
    move $a0, $t2
    syscall
    # decrement the loop index
    sub $t0, $t0, 1
    # if its at null term
    j loop
notInRange:
    li $v0, 4
    la $a0, range
    syscall
    j exit
exit:
    addi	$v0, $0, 10		# System call 10 - Exit
    syscall					# execute
