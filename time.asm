;==========================================
;   TIME
;------------------------------------------

mov ax, 0                           ; set ACCUMULATOR REGISTER to 0
mov ds, ax                          ; set DATA SEGMENT to 0
mov es, ax                          ; set EXTRA SEGMENT to 0
mov ss, ax                          ; set STACK SEGMENT to 0
mov bp, 0x7c00                      ; set STACK BASE to 0x0000_7c00
mov sp, bp                          ; set STACK POINTER to 0x0000_7c00

; Set video mode to 80x25 text mode (change the value of al)


mov ah, 0x0e   ; BIOS teletype output

mov al, '>'
int 0x10

mov al, ' '
int 0x10

mov al, '-'
int 0x10

mov al, '-'
int 0x10

mov al, ':'
int 0x10

mov al, '-'
int 0x10

mov al, '-'
int 0x10

mov al, ' '
int 0x10

mov al, 'A'
int 0x10

mov al, 'M'
int 0x10




; Set background color to white and text color to black
mov ah, 0x0b
mov bh, 0      ; Page number
mov bl, 0x0C   ; Text color: black (lower 4 bits), Background color: white (higher 4 bits)
mov cx, 0      ; Starting column
mov dx, 0      ; Ending column
int 0x10

; Wait for a keypress
mov ah, 0
int 0x16

; Clear the screen
mov ah, 0x06
mov al, 0
mov bh, 0
mov cx, 0
mov dh, 24
int 0x10

message db 'Time Feature Not Availible Yet in Beta Version', 0

; Jump back to the shell
jmp 0x0000:0x7e00


