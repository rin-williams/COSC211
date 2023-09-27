#-------------------------------------------------------------------
# Assingment 2 excercise 2
# cosc211, stuid 51940633
#-------------------------------------------------------------------
# data section
    .data
input_str:
    .asciiz ""
prompt_str:
    .asciiz "enter a 10 character string: "
third_str:
    .asciiz "the third char is: "
fifth_str:
    .asciiz "the fifth char is: "
seventh_str:
    .asciiz "the seventh char is: "
br:
    .asciiz "\n"

#-------------------------------------------------------------------
# code section
    .text
    .globl main
main:
    # load prompt str
    li $v0, 4
    la $a0, prompt_str
    syscall

    # accept a str of 10 char and store in input_str
    li $v0, 8
    la $a0, input_str
    # strictly make sure that input is 11 char long (reserved 1 for null terminated).
    li $a1, 11
    syscall

    # print line br
    li $v0, 4
    la $a0, br
    syscall

    # print out third_str--------------------------
    li $v0, 4
    la $a0, third_str
    syscall


    # calc for third char
    la $a0, input_str
    # basically saying load the 3rd char in $a0 (which is a string) to $t1
    lb $t1, 3($a0)
    
    # print third char 
    # (storing 11 into $v0 calls for char print)
    li $v0, 11
    move $a0, $t1
    syscall

    # print line br
    li $v0, 4
    la $a0, br
    syscall

    # repeat the code above but change the num before ($a0)

    # print out fifth_str--------------------------
    li $v0, 4
    la $a0, fifth_str
    syscall


    # calc for fifth char
    la $a0, input_str
    lb $t1, 5($a0)
    
    # print fifth char
    li $v0, 11
    move $a0, $t1
    syscall

    # print line br
    li $v0, 4
    la $a0, br
    syscall

    # print out seventh_str--------------------------
    li $v0, 4
    la $a0, seventh_str
    syscall


    # calc for seventh char
    la $a0, input_str
    lb $t1, 7($a0)
    
    # print third char
    li $v0, 11
    move $a0, $t1
    syscall

    # exit
    li $v0, 10
    syscall