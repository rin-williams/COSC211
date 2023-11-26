# Exception Handler Framework for COSC211 Assignment 7
	.kdata
exceptionText: .asciiz "\nException occurred at PC="
breakPText: .asciiz "\nBreakpoint Exception"
arithText: .asciiz "\nArithmetic Overflow"
unalignedText: .asciiz "\nUnaligned address in store: "
save0: .word 0

# This is the exception handler
	.ktext 0x80000180

	.set noat		#otherwise, we cannot touch $at  
	sw $at, save0
	
	#use $k0 and $k1 to hold the Cause and EPC
	mfc0 $k0, $13
	mfc0 $k1, $14
	# use a mask to determine what the cause of was for the exception
	# cause of exception is at 6-2 in $13
	
	andi $at, $k0, 0x7C
	srl $at, $at, 2

	#and the branch to the correct part of code to handle the exception
	beq $at, 12, overflow
	beq $at, 9, breakn
	beq $at, 5, bAddr
	beq $at, 4, bAddr
	j done
overflow:
	# for some reason the testexception.s does not throw
	# an overflow exception.  I am not sure why.
	li $v0, 4
	la $a0, exceptionText
	syscall
	li $v0, 1
	move $a0, $k1
	syscall
	li $v0, 4
	la $a0, arithText
	syscall
	j done
breakn:
	li $v0, 4
	la $a0, exceptionText
	syscall
	li $v0, 1
	move $a0, $k1
	syscall
	li $v0, 4
	la $a0, breakPText
	syscall
	j done
bAddr:	
	li $v0, 4
	la $a0, exceptionText
	syscall
	li $v0, 1
	move $a0, $k1
	syscall
	li $v0, 4
	la $a0, unalignedText
	syscall
	j done
done:
	li $k0, 0x0 # nop instruction
	sw $k0, 0($k1) # store nop instruction at EPC

	mfc0 $k0, $14
	addiu $k0, $k0, 4  	# if this is an exception, we add 4 to EPC

	# update the EPC and clear the Cause registers.  
	# You may need to do something to Status as well
	mtc0 $k0, $14
	mtc0 $0, $13

	# mfc0 $k0, $12
	# andi $k0, 0xfffd
	# ori $k0, 0x1
	# mtc0 $k0, $12

	lw $at, save0	  	# restore $at 
	eret	              	# return to EPC	
# startup rountine
	.text
	.globl __start

__start:
	jal main
	li $v0, 10
	syscall