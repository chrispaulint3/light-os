; [org 0x7c00]

; mov al,'H'
; mov cx,message
;call print
mov al,[message]
mov ah,0x0e
int 0x10

loop:
    jmp loop

; print:
;     pusha
;     mov al,[message]
;     mov ah,0x0e
;     int 0x10
;     popa
;     ret

message:
    db "tello world",0
times 510-($-$$) db 0
dw 0xaa55

