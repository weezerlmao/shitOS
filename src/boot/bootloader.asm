org 0x7C00 ; adress of the starting point
bits 16

main:
   ; initialize important registers
   mov ax, 0
   mov ds, ax ; data segment (memory adresses)
   mov es, ax ; extra segment (important)
   mov ss, ax ; stack segment (stack address)

   mov sp, 0x7C00 ; gives the program e
   mov si, boot_msg 
   call print

   mov si, idk
   call print

   hlt
; if hlt gets bypassed somehow
halt:
   jmp halt

; funcs
; print func
print:
   push si
   push ax
   push bx

print_loop:
   lodsb ; loads the char ys
   or al, al
   jz print_done 
   ; 0 or 0 equals 0, 0 is the last char of a string

   ; video syscall
   mov ah, 0x0E
   mov bh, 0
   int 10h ; bios video services software interrupt syscall

   jmp print_loop

print_done:
   pop dx
   pop ax
   pop si
   ret

; vars
boot_msg: db 'Started os', 0x0D, 0x0A, 0
idk: db 'cock', 0x0D, 0X0A, 0

; bios os signature
times 510-($-$$) db 0
dw 0AA55h
