;==========================
;        BOOTLOADER
;==========================

[bits 16]                       ; tell NASM to assemble 16-bit code
[org 0x7c00]                    ; tell NASM the code is running at 0x0000_7c00 boot sector address (bootloader)

%define BOOTSECTOR_ADDR 0x7c00   ;
%define FILES_ADDR 0x0000_7E00   ; physical memory address to load FILES at from sector 2
%define SHELL_ADDR 0x800         ; physical memory address to load SHELL at from sector 3
%define THEME_ADDR 0x0000_8400 


mov si, success_message         ; point SOURCE INDEX register to success_message variable's address
call print_string               ; print success-message to the screen

mov ah, 0x00                    ; BIOS code to read key stroke from the keyboard
int 0x16                        ; wait for any key to be pressed

mov ah, 0x00                        ; BIOS code to set video mode
mov al, 0x03                        ; 80 x 25 text mode
int 0x10                            ; set video mode

; Set background color to red and change text color to default
mov ah, 0x0b
mov bh, 0      ; Page number
mov bl, 0x04   ; Text color: blue (lower 4 bits), Background color: white (higher 4 bits)
mov cx, 0      ; Starting column
mov dx, 0      ; Ending column
int 0x10

mov ax, 0                       ; set ACCUMULATOR REGISTER to 0
mov ds, ax                      ; set DATA SEGMENT to 0
mov es, ax                      ; set EXTRA SEGMENT to 0
mov ss, ax                      ; set STACK SEGMENT to 0
mov bp, BOOTSECTOR_ADDR         ; set STACK BASE to 0x0000_7c00
mov sp, bp                      ; set STACK POINTER to 0x0000_7c00

mov si, welcome_message         ; point SOURCE INDEX register to welcome_message variable's address
call print_string               ; print welcome message to the screen
mov si, press_any_key_message   ; point SOURCE INDEX register to press_any_key_message variable's address
call print_string               ; print press any key message to the screen
mov ah, 0x00                    ; BIOS code to read key stroke from the keyboard
int 0x16                        ; wait for any key to be pressed

mov bx, FILES_ADDR              ; destination address in RAM of where data from sector 2 is going to be loaded
mov cl, 2                       ; sector 2 on USB flash drive contains file names
call read_sector                ; read sector from USB flash drive

; 0x0000_8000 is where the shell is going to be loaded
; Formula to calculate physical address = (A * 0x10) + B
; the segment we need is 0x800 because
; this is how we can obtain a physical address
; from using this segment:
; 0x0000_8000 = (0x800 * 0x10) + 0
; this is needed to init an extra segment for
; our shell to boot into and run there

mov ax, SHELL_ADDR                  ; init the segment
mov es, ax                          ; init EXTRA SEGMENT register
mov bx, 0                           ; init local offset within the segment
mov cl, 3                           ; sector 2 on USB flash drive contains shell binary executable
call read_sector                    ; read sector from USB flash drive
jmp SHELL_ADDR:0x0000               ; jump to the shell executable and run it

; procedure to print a string
print_string:
    cld                             ; clear direction flag
    mov ah, 0x0e                    ; enable teletype output for 0x10 BIOS interrupt
    mov bh, 0                        ; page number
    mov bl, 0x04                     ; text color: red (lower 4 bits), background color: black (higher 4 bits)
    
    .next_char:                     ; print next char
        lodsb                       ; read next byte from SOURCE INDEX register
        cmp al, 0                   ; match the zero terminating char of the string
        je .return                  ; return if string doesn't contain any chars anymore
        int 0x10                    ; assuming ah = 0x0e int 0x10 would print a single char
        jmp .next_char              ; repeat printing char until string is fully printed
    
    .return: ret                    ; return from procedure

; procedure to read a single sector from USB flash drive
read_sector:
    mov ah, 0x02                    ; BIOS code to READ from storage device
    mov al, 1                       ; how many sectors to read
    mov ch, 0                       ; specify cylinder
    mov dh, 0                       ; specify head
    mov dl, 0x80                    ; specify HDD code
    int 0x13                        ; read the sector from USB flash drive
    jc .error                       ; if failed to read the sector handle the error
    ret                             ; return from procedure
    
    .error:
        mov si, error_message       ; point SOURCE INDEX register to error_message string's address
        call print_string           ; print error message
        jmp $                       ; stuck here forever (infinite loop)

; messages
success_message db 'ArcadeOS(Beta) is loaded!', 10, 13, 0
welcome_message db '    ___    ____  _________    ____  ______   ____  _____', 10, 13,'   /   |  / __ \/ ____/   |  / __ \/ ____/  / __ \/ ___/', 10, 13,'  / /| | / /_/ / /   / /| | / / / / __/    / / / /\__ \ ', 10, 13,' / ___ |/ _, _/ /___/ ___ |/ /_/ / /___   / /_/ /___/ / ', 10, 13,'/_/  |_/_/ |_|\____/_/  |_/_____/_____/   \____//____/', 10, 13, 0

press_any_key_message db 10,13,'Press any key for menu...', 10, 13, 0
error_message db 'Failed to read sector from USB!', 10, 13, 0

times 510 - ($ - $$) db 0           ; fill trailing zeros to get exactly 512 bytes long binary file
dw 0xaa55                           ; set boot signature

