;
; Note: this example is written in Intel Assembly syntax
;
[BITS 16]           ; 16 bit code
[ORG  0x7c00]       ; program start at

boot:
    ; get cursor position where "printing string" start at
    mov ah, 0x03    ; number of systemcall which get position of cursor
    xor bh, bh      ; number of page -> 0
    int 0x10
    
    ; print message
    mov bp, msg     ; address of message
    mov cx, msg_len ; length of message
    mov bx, 0x07    ; font color is white
    mov ax, 0x1301  ; number of systemcall which print string
    int 0x10
    
    ; infinite loop
    jmp $

msg: db 'Hello world.'
msg_len: equ $-msg

; $   :address here
; $$  :address which this section start
times 510-($-$$) db 0

; magic number for boot sector
db 0x55
db 0xaa
