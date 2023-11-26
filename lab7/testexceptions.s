
	.text	
main:
	
	li $s0, 0x7FFFFFFF
	li $s1, 0x000FFFFF

	li $t0, 0
	li $t1, 5

loop:
	li $v0, 4		#print loop message   
	la $a0, str
    syscall

	add $s2, $s1, $s0 	#overflow
	break 20		#break n
	sw $s1, ($s0)		#bad address
	
	addi $t0, $t0, 1
	bge $t0, $t1, done
	j loop 
	
done:	jr $ra

	.data
str:	.asciiz "\n---exception loop---\n"


	


	
