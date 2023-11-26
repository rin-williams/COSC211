.kdata

overflowMsg: .asciiz "Arithmetic overflow\n"
breakMsg: .asciiz "Break instruction\n"
badAddrMsg: .asciiz "Bad address\n"

save0: .word 0

.ktext 0x80000180

.set noat #otherwise, we cannot touch $at
sw $at, save0

#use $k0 and $k1 to hold the Cause and EPC
mfc0 $k0, $13 # Move from Coprocessor 0 (Cause register)
mfc0 $k1, $14 # Move from Coprocessor 0 (EPC register)

# use a mask to determine what the cause of was for the exception
srl $k0, $k0, 2 # Shift right logical to get the ExcCode field from the Cause register
andi $k0, $k0, 0x1F # Mask out the ExcCode field from the Cause register

#and the branch to the correct part of code to handle the exception
beq $k0, 0x0C, overflow # Branch if overflow
beq $k0, 0x09, breakn # Branch if break
beq $k0, 0x05, bAddr # Branch if address error

j done

breakn:
    la $a0, breakMsg
    li $v0, 4
    syscall
    j done 

overflow:
    la $a0, overflowMsg
    li $v0, 4
    syscall
    j done

bAddr:
    la $a0, badAddrMsg
    li $v0, 4
    syscall
    j done

done:
    li $k0, 0x0 #this is the nop instruction value
    sw $k0, 0($k1) #now write is to the address in $k0

    mfc0 $k0, $14
    addiu $k0, $k0, 4  	# if this is an exception, we add 4 to EPC

    # EPC is already incremented in the exception handling code

    #update the EPC and clear the Cause registers. You may need to do something to Status as well
    mtc0 $k0, $14 # Move to Coprocessor 0 (EPC register)
    mtc0 $zero, $13 # Clear Cause register

    lw $at, save0 # restore $at
    eret # return to EPC

# startup rountine
.text
.globl __start

__start:

jal main
li $v0, 10
syscall
