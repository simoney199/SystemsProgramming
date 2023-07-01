.section .data
msg: .ascii "Enter an integer (0-9): "
lenMsg = . - msg
msgCount2x: .ascii "Count 2x: "
lenMsgCount2x = . - msgCount2x
.section .bss
    .lcomm value1, 2
    .lcomm value2, 2
    .lcomm value3, 2
    .lcomm value4, 2
    .lcomm value5, 2
    .lcomm count2x, 2
.section .text
    .globl _start

_start:
    movl $48, %esi

    # print text for input 1
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input 1 from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $value1, %ecx
    movl $3, %edx
    int $0x80

    # print text for input 2
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input 2 from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $value2, %ecx
    movl $3, %edx
    int $0x80
    
    # print text for input 3
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input 3 from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $value3, %ecx
    movl $3, %edx
    int $0x80
    
    # print text for input 4
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input4 from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $value4, %ecx
    movl $3, %edx
    int $0x80
    
    # print text for input 5
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input 5 from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $value5, %ecx
    movl $3, %edx
    int $0x80
    

    # check value 1 is 2x or not (if it is 2x count2x++)
    movl value1, %eax
    andl $1, %eax
    cmpl $1, %eax
    jz .n1
    add $1, %esi

.n1:    
    # check value 2 is 2x or not (if it is 2x count2x++)
    movl value2, %eax
    andl $1, %eax
    cmpl $1, %eax
    jz .n2
    add $1, %esi
    
.n2:
    # check value 3 is 2x or not (if it is 2x count2x++)
    movl value3, %eax
    andl $1, %eax
    cmpl $1, %eax
    jz .n3
    add $1, %esi

.n3:    
    # check value 4 is 2x or not (if it is 2x count2x++)
    movl value4, %eax
    andl $1, %eax
    cmpl $1, %eax
    jz .n4
    add $1, %esi

.n4:    
    # check value 5 is 2x or not (if it is 2x count2x++)
    movl value5, %eax
    andl $1, %eax
    cmpl $1, %eax
    jz .exit
    add $1, %esi
    

.exit:
    
    # print message
    movl $4, %eax
    movl $1, %ebx
    movl $msgCount2x, %ecx
    movl $lenMsgCount2x, %edx
    int $0x80
    
    # print count2x value
    movl %esi, (count2x)
    movl $4, %eax
    movl $1, %ebx
    movl $count2x, %ecx
    movl $2, %edx
    int $0x80
    
    # exit program
    movl $1, %eax
    int $0x80
