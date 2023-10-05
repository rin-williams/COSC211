#-----------------------------------------------------------------
#Assingment 3 excercise 2
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
#-----------------------------------------------------------------	
# code section
    .text
    .globl main
main:
    li $s0, 150 # 1001 0110
    li $t0, 7
    move $t1, $s0

    srlv $t2, $t1, $t0
    and $t2, $t2, 1

    li $v0, 1
    move $a0, $t2
    syscall

    li $t0, 6
    move $t1, $s0

    srlv $t2, $t1, $t0
    and $t2, $t2, 1

    li $v0, 1
    move $a0, $t2
    syscall

    li $t0, 5
    move $t1, $s0

    srlv $t2, $t1, $t0
    and $t2, $t2, 1

    li $v0, 1
    move $a0, $t2
    syscall

    addi	$v0, $0, 10		# System call 10 - Exit
    syscall					# execute
