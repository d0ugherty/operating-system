; memory referencing exercise:
; try to successfully print "X"

mov ah, 0x0e ;move value 0x0e into the ah register

; attempt 1
; fails because it tries to print the memory address as opposed to its contents



mov al, "1"
int 0x10                    ;interrupt instruction for video functions such as printing characters
mov al, the_secret
int 0x10

; attempt 2
; attempts to print memory address of 'the_secret'
; However, the BIOS places the bootsector binary at address 0x7c00
; so padding will have to be added for a third attempt

mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

;   attempt 3
; add BIOS starting offset 0x7c00 to the memory address of X
; and then derefernce the contents of that pointer
; register 'bx' is being utilized because 'mov al, [ax]' is an invalid instruction
; a register cannot be used as both a source and destination for the same commany

mov al, "3"
int 0x10
mov bx, [the_secret]
add bx, 0x7c00
mov al, [bx]
int 0x10

;   attempt 4
; try a shortcut since X is storted in byte 0x02d in the binary according to xxd file.bin

mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0
dw 0xaa55
