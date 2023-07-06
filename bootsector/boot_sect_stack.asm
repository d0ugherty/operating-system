; stack pointers !
; bp register stores the base (bottom) address
; sp register stores the top address
; the stack grows downwards from the base pointer. so the stack pointer becomes decremented

mov ah, 0x0e ; teletype mode

mov bp, 0x8000 ; this is address is far way from 0x7c00 so it doesn't get overwritten
mov sp, bp ; if the stack is empty then the stack pointer points to the base


; push the chars on top of the stack
push 'A'
push 'B'
push 'C' 

; display how the stack grows downwards
mov al, [0x7ffe] ; 0x8000 - 2
int 0x10

mov al, [0x8000]
int 0x10

; access the characters using 'pop' instruction
; 'pop' can only be applied to full words so another register is needed to manipulate
; the lower byte

pop bx
mov al, bl
int 0x10 ; C

pop bx
mov al, bl
int 0x10 ; B

pop bx
mov al, bl
int 0x10 ; A

mov al, [0x8000]
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55




