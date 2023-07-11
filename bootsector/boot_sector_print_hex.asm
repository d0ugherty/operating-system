;   data will be received in the 'dx' register
;   example will assume dx = 0x1234

print_hex:
    pusha
    mov cx, 0 ; index variable

;   get the last character in 'dx', then convert to ASCII
;   numberic ASCII values: '0' (ASCII 0x30) to '9' (ASCII 0x39)
;   so just add 0x30 to byte N
;   alphabetical characters A-F: 'A' (0x41) to 'F' (0x46) so just add 0x40
;   Then move the ASCII byte to the correct position on the resulting string
hex_loop:
    cmp cx, 4
    je end

    ; convert last char of dx to ascii
    mov ax, dx
    and ax, 0x000f  ; 0x1234 -> 0x0004 by masking first three to zeros
    add al, 0x30    ; add 0x30 to N to convert it to ascii 'N'
    cmp al, 0x39    ; if > 9, add extra 8 to represent 'A' to 'F'
    jle step2
    add al, 7       ; 'A' is ASCII 65 instead of 58 so 65-58=7

step2:
    ; get the correct position of the string to place the ascii char
    mov bx, HEX_OUT + 5 ; base address + string length
    sub bx, cx          ; minus index of variable
    mov [bx], al         ; copy ascii char in 'al' to position pointed by 'bx'
    ror dx, 4           ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

    add cx, 1           ; increment index
    jmp hex_loop

end:
    ; prepare parameter and call function
    ; print receives parameters in 'bx'
    mov bx, HEX_OUT
    call print
    popa
    ret

HEX_OUT:
    db '0x0000', 0  ; reserve memory for new string
