[org 0x7c00]

mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl ; newline

mov dx, 0x125e
call print_hex

jmp $

; include functions and subroutines from other files
%include "boot_sector_print.asm"
%include "boot_sector_print_hex.asm"


; DATA

HELLO:
    db 'Interior Crocodile Alligator', 0

GOODBYE:
    db 'I DRIVE A CHEVROLET MOVIE THEATER', 0

; padding
times 510-($-$$) db 0
dw 0xaa55
