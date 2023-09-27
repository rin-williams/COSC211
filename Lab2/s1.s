#Assingment 2
#cosc211, stuid 51940633
#
#
#Register Usage:
#$s0, address of the data "len"
#$t0, address of the next character in "buffer"
#$t1, the number of characters so far   	
#-----------------------------------------------------------------

#-----------------------------------------------------------------	
#code section
      .text  		# directive for code section
      .globl main  	# directive: main is visible to other files 
main: 
      li $v0, 4    	# load system call code to $v0, 4 for print-string
      la $a0, str  	# load address of the "str" to 1st arg 
      syscall		# syscall to print	

      li $v0, 8     	# 8: code reading string system call
      la $a0, buffer
      li $a1, 12
      syscall

      	
      la $t0, buffer 
      la $s0, len	
      lw $t1, ($s0)	

loop: lbu  $t2, ($t0)	    #loops through the buffer 
      beq  $t2, 0, exit     #null character
      beq  $t2, 0xa, exit   #\n symbol 	
      addi $t0, $t0, 1	
      addi $t1, $t1, 1	
      j    loop	

exit: sw $t1, ($s0)
	
      li $v0, 1
      lw $a0, ($s0)
      syscall	

      jr $ra  # return to start-up caller in SPIM (in exception.s)  

      li $v0, 10
      syscall  
#-------------------------------------------------------------------
#data section

     .data   #directive for

len:
     .word 0
buffer:
     .space 10
     .align 4
str:
     .asciiz "Hello, Your ID = "  #directive for non-terminated string