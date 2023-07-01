.section .data
msg: .ascii "Enter an age (0-100): "
lenMsg = . - msg
msg1: .ascii "Mau giao\n"
lenMsg1 = . - msg1
msg2: .ascii "Tieu hoc\n"
lenMsg2 = . - msg2
msg3: .ascii "Trung hoc co so\n"
lenMsg3 = . - msg3
msg4: .ascii "Trung hoc pho thong\n"
lenMsg4 = . - msg4
msg5: .ascii "Het giao duc pho thong\n"
lenMsg5 = . - msg5
msgE: .ascii "Nhap sai. Chi nhap input tu 0 den 100\n"
lenMsgE = . - msgE

.section .bss
    .lcomm age, 4

.section .text
    .globl _start

_start:
    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $lenMsg, %edx
    int $0x80

    # get input from user
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $3, %eax
    movl $0, %ebx
    movl $age, %ecx
    movl $4, %edx
    int $0x80

    # convert string to integer
    movl $age, %ebx
    xorl %eax, %eax
    movl $0, %ecx
convertLoop:
    movb (%ebx), %dl
    cmpb $0xa, %dl
    je convertExit
    subb $0x30, %dl
    imul $10, %eax
    addl %edx, %eax
    incl %ebx
    jmp convertLoop
convertExit:
    movl %eax, age

    # check age in range 0 to 5
    cmpl $5, age
    jg .n1

    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg1, %ecx
    movl $lenMsg1, %edx
    int $0x80
    jmp .exit

.n1:
    # check age in range 6 to 10
    cmpl $10, age
    jg .n2

    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg2, %ecx
    movl $lenMsg2, %edx
    int $0x80
    jmp .exit

.n2:
    # check age in range 11 to 14
    cmpl $14, age
    jg .n3

    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg3, %ecx
    movl $lenMsg3, %edx
    int $0x80
    jmp .exit

.n3:
    # check age in range 15 to 17
    cmpl $17, age
    jg .n4

    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg4, %ecx
    movl $lenMsg4, %edx
    int $0x80
    jmp .exit

.n4:
    # check age in range 18 to 100
    cmpl $100, age
    jg .n5

    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msg5, %ecx
    movl $lenMsg5, %edx
    int $0x80
    jmp .exit

.n5:
    # print text
    movl $4, %eax
    movl $1, %ebx
    movl $msgE, %ecx
    movl $lenMsgE, %edx
    int $0x80

.exit:
    # exit program
    movl $1, %eax
    int $0x80
