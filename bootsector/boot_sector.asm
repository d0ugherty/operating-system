; the boot sector is section of memory containing
; boot instructions for the operating system. The boot sector must be placed in a known,
; standard location. So logically, it will be the very first sector of the disk. It holds
; 512 bytes. The BIOS will check that bytes 511 and 512 of the sector are bytes 0xAA55.

; This could either be written in binary or with a small assembly like this

; this is an infinite loop

loop:
    jmp loop


; times repeats the specified expression multiple times
; $ represents the current location counter, $$ represents the beginning of the current section
; so ($-$$) calculates the size of the code that has been assembled so far. subtracting that size from 510 gives the number of remaining bytes to be filled with zeros`
times 510-($-$$) db 0

; "magic number"
dw 0xaa55
