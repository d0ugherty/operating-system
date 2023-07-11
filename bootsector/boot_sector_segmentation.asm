 ; exercise in segmentaton
 ;
 ; segmentation specifies an offset for ALL DATA that is referenced
 ; segmentation is done using registers:
 ; cs - code segmentation
 ; ds - data segmentation
 ; ss - stack segmentation
 ; es - extra (user-defined) segmentation

; once a value is set in ds for example, then ALL memory access will be offset by ds

mov ah, 0x0e    ;tty

mov al, [the_secret]
int 0x10 ; doesn't work !

mov bx, 0x7c0 ; the segment is bit-shifted << 4 
mov ds, bx
mov al, [the_secret]
int 0x10

; doesn't work, es register hasn't been initialized
mov al, [es:the_secret]
int 0x10



mov bx, 0x7c0
mov es, bx      ; intialize the es register
mov al, [es:the_secret]
int 0x10

jmp $

the_secret:
    db "X"
        
times 510 - ($-$$) db 0
dw 0xaa55
