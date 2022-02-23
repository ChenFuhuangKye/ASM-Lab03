; FIBNum.asm - Computer F(1) to F(30)
; Lab3 Homework 
; made by Huang, Chen Fu
; date 2020.2.23

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data 
  FIBNum    DWORD 50 DUP(?)                ;  Declare  FIBNum array  

.code
main proc ;
  ;Set FIBNum number  F(1) = 1,  F(2) = 1                          
	mov [ FIBNum ] ,1                      ;  F(1) = 1
	mov [ FIBNum +4] ,1                    ;  F(2) = 1
  
  ;print f(0), f(1)
	mov eax, 1
	call WriteDec
	call Crlf
	call WriteDec
	call Crlf
	
  ;Set loop  30 times and print F(3) to F(30)
	mov  esi, OFFSET FIBNum				  ; esi = FIBNum first virtual memory address = F(1) address
	mov ecx, 28                           ; print FIBNum to  F(30)
L1:
	mov eax, [ esi ]					  ; eax = A(n)
	add eax, [ esi + 4]                   ; A(n+2) = An + A(n+1)
	mov [ esi + 8 ], eax                  ; set F(n+2) = A(n+2)   
  
	call WriteDec                         ;print A(n+2)
	call Crlf							  ;chang line
	add esi,4

	loop L1                               ;loop end
  
	invoke ExitProcess,0
main endp
end main