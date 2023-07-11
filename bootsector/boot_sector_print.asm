; exercise for using function calls and control structures


print:
    pusha

;   while (string[i] != 0 {
;       print string[i];
;       i++;
;   }

start:
    mov al, [bx]    ; bx is the base address for the string, [bx] is the contents
    
    cmp al, 0       ; compare: does register al = 0, which is the null terminator for the string
    je done         ; je: 'jump if equal', used with 'cmp'
   
    ; print
    mov ah, 0x0e    ; tty mode
    int 0x10
    
    add bx, 1       ; increment pointer and do next iteration of the loop
    jmp start 

done:
    popa
    ret

print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a    ; newline character
    int 0x10
    mov al, 0x0d    ; carriage return
    int 0x10        ; print

    popa
    ret             ;return
