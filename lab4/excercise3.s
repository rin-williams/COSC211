#-----------------------------------------------------------------
#Assingment 4 excercise 3
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data
enter: 
    .asciiz "Enter the number of disks: "
number_of_disks:
    #init space for 3 indexs
    .space 12
square_open:
    .asciiz "["
comma:
    .asciiz ", "
square_close:
    .asciiz "]"
#code section ----------------------------------------------------
    .text
    .globl main
main:
    li $v0, 4
    la $a0, enter
    syscall

    li $v0, 5
    syscall
    addi $s0, $v0, 0
    # $s0 contains the input of disks

    # initialize the array.
    addi $t0, $zero, 0
    sw $s0, number_of_disks($t0) # number_of_disks[0] = $s0 (the num of disk)
    addi $t0, $zero, 4
    sw $0, number_of_disks($t0) # number_of_disks[1] = 0
    sll $t0, $t0, 1
    sw $0, number_of_disks($t0) # number_of_disks[2] = 0
    
    jal print_towers

    # else:
    jal hanoi

    j exit

hanoi:

    addi $sp, $sp, -20 # 16/4 = 5 register room in stack
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    lw $a0, number_of_disks($zero) # load value arr[0] into $t0
    add $a1, $zero, $zero # $a1 = src = 0
    addi $a2, $zero, 1 # $a2 = helper = 1
    addi $a3, $zero, 2 # $a3 = dest = 2

    # if number_of_disks[0] == 1
    beq $a0, 1, izOne
    # else:
    


izOne:
    # src = $a1 = 0, dest = $a3 = 2
    # number_of_disks[src]--
    lw $t0, number_of_disks($a1)
    addi $t0, $t0, -1
    sw $t0, number_of_disks($a1)

    # number_of_disks[dest]++ (dest is index 2, so 2*4 = 8)
    addi $t0, $zero, 8
    lw $t1, number_of_disks($t0)
    addi $t1, $t1, 1
    sw $t1, number_of_disks($t0)

    
    jal print_towers
    # free the stack
    addi $sp, $sp, 20
    j exit

print_towers:
    # print line feed
    li $v0, 11
    li $a0, 0xA
    syscall

    # print open square brackets
    li $v0, 11
    li $a0, 0x5B
    syscall

    # print the number_of_disks[0] (0)
    lw $t1, number_of_disks($0)
    li $v0, 1
    move $a0, $t1
    syscall

    # print the comma
    li $v0, 4
    la $a0, comma
    syscall

    #print the number_of_disks[1] (4)
    # add the offset
    addi $t1, $zero, 4
    lw $t2, number_of_disks($t1)
    # print
    li $v0, 1
    move $a0, $t2
    syscall

    # print the comma
    li $v0, 4
    la $a0, comma
    syscall

    # print the number_of_disks[2] (8)
    # offset to 8
    addi $t1, $zero, 8
    lw $t2, number_of_disks($t1)
    # print
    li $v0, 1
    move $a0, $t2
    syscall

    # print open square brackets
    li $v0, 11
    li $a0, 0x5D
    syscall
    jr $ra

exit: 
    addi $v0, $0, 10
    syscall