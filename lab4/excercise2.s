#-----------------------------------------------------------------
#Assingment 4 excercise 2
#cosc211, stuid 51940633
#-------------------------------------------------------------------
#data section
    .data
answer: 
    .asciiz "the 100 primes are: "
space:
    .asciiz " "
#code section ----------------------------------------------------
    .text
    .globl main
main:
    li $v0, 4
    la $a0, answer
    syscall

    li $s0, 1

    li $s6, 0
loop:
    beq $s6, 100, exit
    jal test_prime
    addi $s0, $s0, 1
    j loop
print:
    addi $s6, $s6, 1
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, space
    syscall

    jr $ra 
test_prime:
    # $a0 will be n z
    # $v0 will be return val (0 for false and 1 for true)

    # if n < 2, return 0 it is not prime
    blt $s0, 2, isNotPrime
    # init to check at 2 forward
    li $t0, 2
check:
    # if input is 2, print it.
    beq $s0, 2, print
    # check if n is divisible by the current divisor ($t0)
    div $s0, $t0
    mfhi $t1

    # if the remainder is 0, n is not prime
    beqz $t1, isNotPrime

    # increment the divisor and continue checking
    addi $t0, $t0, 1

    # if $t0 is less than or equal to to the input number, then jump to check and loop again.
    # since this is what we want, to not be divisible by any number but itself.
    beq $s0, $t0, print
    bne	$s0, $t0, check

isNotPrime:
    j $ra
exit:
    addi $v0, $0, 10		# System call 10 - Exit
    syscall					# execute
