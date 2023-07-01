.section .data 
	msg: .ascii "Enter a string (3 characters): "
	lenMsg = .-msg
.section .bss
	.lcomm value, 3
.section .text
	.globl _start
_start:
	# print text for inputting
	movl $4, %eax
	movl $1, %ebx
	movl $msg, %ecx
	movl $lenMsg, %edx
	int $0x80
	
	#get user input
	movl $3, %eax
	movl $0, %ebx
	movl $value, %ecx
	movl $3, %edx
	int $0x80
	
	# check first character
	movl $value, %eax
	mov 0(%eax), %bl
	cmp $90, %bl
	jg .n1
	cmp $65, %bl
	jl  .n1
	add $32, %bl
	mov %bl, 0(%eax)
.n1:
	# check second character
	mov 1(%eax), %cl
	cmp $90, %cl
	jg .n2
	cmp $65, %cl
	jl .n2 
        add $32, %cl
        mov %cl, 1(%eax)
.n2:
	# check third character
	mov 2(%eax), %dl
	cmp $90, %dl
	jg .n3
	cmp $65, %dl
	jl .n3
        add $32, %dl
        mov %dl, 2(%eax)
.n3:
	# print the modified text
	movl $4, %eax
	movl $1, %ebx
	movl $value, %ecx
	movl $3, %edx
	int $0x80

	movl $1, %eax
	int $0x80
