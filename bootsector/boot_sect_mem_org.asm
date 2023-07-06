[org 0x7c00] ; global offset instead of offsetting everywhere with 0x7c00

mov ah, 0x0e

; attempt 1
; fails because it is addressing the pointer instead of the data it points to

mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; attempt 2
; offset problem solved - this prints expected output
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; attempt 3
; 0x7c00 is added twice - so this doesn't work
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; attempt 4
; This still works because of the lack of memory references to pointers
; 'org' mode is never applied. This directly addresses memory by counting bytes. this always 
; works but it's also inconvenient
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $

the_secret:
    db "X"

times 510-($-$$)db 0
dw 0xaa55
