; exercise with printing register contents

; i'm generally familiar with registers but I learned on MIPS architecture
; so we're going over x86 now

mov ah, 0x0e    ; 0x0e tells the interrupt to write the contents of al in tty (teletype) mode
mov al, 'H'
int 0x10        ;interupt 0x10 is the general interupt for video services such as printing to display
mov al, 'E'
int 0x10
mov al, 'L'
int 0x10
int 0x10        ; print the contents of al again
mov al, 'O'
int 0x10

jmp $           ; jump to current address = infinite loop

; padding and magic number

times 510 - ($-$$) db 0 
dw 0xaa55
