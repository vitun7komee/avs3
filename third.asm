
;b/a + 20, a > b
;110, a = b
;(a - b) / a, a < b
.MODEL tiny
org 100h
.data
 a dw 2  ;a = 1, b = 1
 b dw 1
 x dw 0 
.code
;-----------------------------
mov ax, a
mov bx, b
cmp ax, bx
jl jmp label1
jg jmp label2
je jmp label3
;-----------(a<b)-------------
label1:
mov ax, a
mov bx, b
sub ax,bx
mov bx,a
cwd
idiv bx
jmp short ending
;-----------(a>b)-------------
label2:
mov ax, b
mov bx, a
cwd 
idiv bx 
add ax,20
jmp short ending
;-----------(a=b)------------- 
label3:
mov ax, 110
jmp short ending
;-----------------------------
ending:
mov x, ax
ret



