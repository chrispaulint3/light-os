[org 0x7c00]


mov bx,hello_message
call print

mov bx,goodbye_message
call print


loop:
    jmp loop

print:
    pusha
    mov ah,0x0e
print_loop:
    mov al,[bx]
    cmp al,0
    jz retrun
    int 0x10
    inc bx
    jmp print_loop

retrun:
    mov ah, 0x03          ; 功能号 0x03: 读取光标位置
    mov bh, 0x00          ; 页面号
    int 0x10              ; 调用中断 0x10

    mov ah, 0x02          ; 功能号 0x02: 设置光标位置
    inc dh                ; 将光标下移一行
    mov dl, 0x00          ; 将光标移动到行首（列 0）
    int 0x10              ; 调用中断 0x10
    popa
    ret

hello_message:
    db "hello world",0
goodbye_message:
    db "goodbye world",0
times 510-($-$$) db 0
dw 0xaa55

