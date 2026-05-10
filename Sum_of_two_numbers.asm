section .data
    Num1 DD 4
    Num2 DD 3
    Res DB 0
    newLine DB 0xA

section .text
    global _main

_main:
    
    ; Convert to ASCII
    mov AL, [Num1]
    add AL, '0'
    add AL, [Num2]
    add [Res], AL

    mov eax, 0x04
    mov ebx, 1
    mov ecx, Res
    mov edx, 1
    int 0x80

    mov eax, 0x04
    mov ebx, 1
    mov ecx, newLine
    mov edx, 1
    int 0x80

    mov eax, 0x01
    mov ebx, 0x0
    int 0x80

    
