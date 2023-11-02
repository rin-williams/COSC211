#-----------------------------------------------------------------
#Assingment 4 excercise 3
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data
enter: 
    .asciiz "Enter the number of disks: "
    .space 12
# i have implemented vars instead of arrays to reduce 
# complexity of the code and to make it easier to debug
# and since the number of array is just 3, this should not be a problem
tower1:
    .space 4
tower2:
    .space 4
tower3:
    .space 4

#code section ----------------------------------------------------
    .text
    .globl main
main:
    li $v0, 4
    la $a0, enter
    syscall

    li $v0, 5
    syscall
    addi $s0, $v0, 0 # $s0 = number_of_disks

    # initialize the array
    move $a0, $v0
    la $a1, tower1
    # store number of disks in tower1
    sw $s0, ($a1)
    la $a2, tower2
    la $a3, tower3

    # make stack room for 5 items so we dont lose the values
    # when jumping to print_towers()
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)
    
    jal print_towers

    # restore the stack
    lw $ra, 0($sp)
    # $a0 = number_of_disks
    lw $a0, 4($sp)
    # $a1 = tower1
    lw $a1, 8($sp)
    # $a2 = tower2
    lw $a2, 12($sp)
    # $a3 = tower3
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    # make space for $ra
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal hanoi

    # restore $ra
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    j exit

hanoi:
    # recall vars:
    # $a0 = number_of_disks
    # $a1 = tower1 
    # $a2 = tower2 
    # $a3 = tower3 

    # if number of disks is 1,
    # increment the last tower and decrement the first tower
    beq $a0, 1, izOne

    # store items on the stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    # hanoi(n - 1, src, dest, helper);
    # number_of_disks[src]--;
    # number_of_disks[dest]++;
    addi $a0, $a0, -1
    la $t0, ($a2)
    move $a2, $a3
    move $a3, $t0

    jal hanoi

    # restore the stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    # dec tower 2 and inc tower 1
    lw $t0, ($a2)
    addi $t0, $t0, 1
    sw $t0, ($a2)
    lw $t0, ($a1)
    addi $t0, $t0, -1
    sw $t0, ($a1)
    
    # store items on the stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    jal print_towers

    # restore the stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    # store items on the stack again to call hanoi 2nd time
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    # hanoi(n - 1, helper, src, dest);
    # increment tower3 and dec tower2
    addi $a0, $a0, -1
    la $t0, ($a1)
    move $a1, $a3
    move $a3, $t0

    jal hanoi

    # restore the stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    jr $ra
izOne:
    # since its one, we increment the last tower and 
    # decrement the first tower.
    # load the value of the first tower and dec
    lw $t1, ($a2)
    addi $t1, $t1, 1
    sw $t1, ($a2)
    lw $t1, ($a1)
    addi $t1, $t1, -1
    sw $t1, ($a1)
    lw $t1, ($a2)

    # store items on the stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    jal print_towers

    # restore the stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    # jump back to ra
    jr $ra
print_towers:
    # print line feed
    li $v0, 11
    li $a0, 0xA
    syscall

    # print open square brackets
    li $v0, 11
    li $a0, 0x5B
    syscall

    # print tower 1
    li $v0, 1
    lw $a0, tower1
    syscall

    # print the comma
    li $v0, 11
    li $a0, 0x2C
    syscall

    # print tower 3
    li $v0, 1
    lw $a0, tower3
    syscall

    # print the comma
    li $v0, 11
    li $a0, 0x2C
    syscall

    # print tower 2
    li $v0, 1
    lw $a0, tower2
    syscall

    # print open square brackets
    li $v0, 11
    li $a0, 0x5D
    syscall

    # jump back to ra
    jr $ra
exit: 
    li $v0, 4
    addi $v0, $0, 10
    syscall