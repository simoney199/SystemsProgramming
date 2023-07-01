.section .data
str: .string "Love UIT"
str_length = . -str
# get string

.section .bss
	.lcomm length, 4

.section .text
	.globl _start

_start:
	# find the length of the string        
	movl $str_length, %esi      
	subl $1, %esi              
	addl $48, %esi             
	movl %esi, length   
	
	# print the length
    	movl $4, %eax               
	movl $1, %ebx			   
	movl $length, %ecx  
	movl $1, %edx                     
	int $0x80                   
 
	movl $1, %eax
	int $0x80
