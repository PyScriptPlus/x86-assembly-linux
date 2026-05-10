; faghat variable hayi ke meghdar avvali nadard
section .bss
    myCharacter resb 1
section .data
    charac db 0xA
    madew db "Coded by MamaD", 0xA,0
    len equ $ - madew
;    num1 DD 0
;    num2 DD 0

section .text
    global _main

_main:

;    mov eax, 5
;    mov ebx, 6
;
;    mov [num1], eax
;    mov [num2], ebx
    mov eax, 0x04
    mov ebx, 1
    mov ecx, madew
    mov edx, len
    int 0x80

    mov eax, 0x04
    mov ebx, 1
    mov ecx, charac
    mov edx, 1
    int 0x80
 
.loop:
    ; sys_read
    mov eax, 0x03
    mov ebx, 0
    mov ecx, myCharacter
    mov edx, 1
    int 0x80

    ; sys_write
    mov eax, 0x04
    mov ebx, 1
    mov ecx, myCharacter
    mov edx, 1
    int 0x80

    mov eax, 0x04
    mov ebx, 1
    mov ecx, charac
    mov edx, 1
    int 0x80
    
    jmp .loop    

    ; Exit System Call
    mov eax, 0x01
    mov ebx, 0x0
    
    int 0x80
    
