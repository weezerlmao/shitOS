# ShitOS
i don't know why the fuck i made this but yes its shit i don't know anything yesss  
  

  
## How it's made  
it's made in assembly (😱)  
with love  
weeeeee  

## idk
anyways here is hello world in assembly
```assembly
section .data
  msg db `hi\n`
  msg_len equ $ - msg

section .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, msg_len
  int 80h

  mov eax, 1
  mov ebx, 0
  int 80h
```
(i hope it works)
