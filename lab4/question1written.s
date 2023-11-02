#--------------------------
#Assingment 4 question 1 written
#cosc211, stuid 51940633
#--------------------------
    .text
    .globl main
main:
    addi    $s0, $zero, 100 #intialize my_global
    addi    $s0, $s0, 1     #increment my_global
    addi    $s1, $zero, 0   #init z.
    jal     leaf_function   #call leaf_function
    lw      $s1, 0($sp)     #store the return value in z
    addi    $sp, $sp, 4     
    j       exit
leaf_function:
    # accepts x as an argument
    addi    $sp, $sp, -20
    sw      $ra, 0($sp)
    sw      $a0, 4($sp)
    sw      $s0, 8($sp)
    sw      $s1, 12($sp)
    sw      $v0, 16($sp)
    #store x in $s1
    addi    $s1, $a0, 0
    #store x+1 in $v0
    #store the return value in z
    addi    $v0, $s1, 1
    sw      $v0, 16($sp)
    lw      $s1, 12($sp)
    lw      $s0, 8($sp)
    lw      $a0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 16
    jr      $ra
exit:
    addi $v0, $0, 10
    syscall