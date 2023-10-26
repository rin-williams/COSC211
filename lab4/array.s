#-------------------------------------------
# char ch_array[101];
# int  int_array[101];
# main(){
#   int i = 0;
#   for(i = 0; i < 101; i++){
#
#       ch_array[i] = 'a';
#       int_array[i] = i;	
#   }
# }
#-------------------------------------------

		.data
ch_array:	.space 101
		.align 4
int_array:	.space 404


		.text		

main:
	li $s1, 0x61
	li $s2, 101
	li $s0, 0
	la $s3, ch_array
	la $s4, int_array

loop:	bge $s0, $s2, exit
	add $t0, $s3, $s0   #$t0: address of ch_array[i]
	sb  $s1, ($t0)

	add $t0, $s0, $s0
	add $t0, $t0, $t0   #$t0: 4*i
	add $t0, $t0, $s4   #$t0: address of int_array[i]
	sw $s0, ($t0)	    #save i to int_array[i]	

	
	addi $s0, $s0, 1   # i = i + 1 

	j loop

exit:	li $v0, 10
	syscall


#--------------------------------------------------------------
# avoid array index based address calculation 
#	
# sw $s0, ($s4)	  #$s4: initially the base address of int_array  		
# addi $s4, $s4, 4  #$s4: address of next element of int_array
#
#------------------------------------------------------------- 	
