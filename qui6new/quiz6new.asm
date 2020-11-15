		#include<p18F4550.inc>


			org	0x00
			goto start
			org	0x08
			retfie
			org	0x18
			retfie

loop_cnt	equ	0x00
loop_cnt1	equ	0x01
			
			
dup_nop		macro kk		
			variable i
i=0
			while i < kk
			nop
i+=1
			endw
			endm

;******************************************
;Subroutine for 56ms delay.
;******************************************

Delay56ms	movlw	D'80'
			movwf	loop_cnt1,A
show5		movlw	D'50'
			movwf	loop_cnt,A
show6		dup_nop	D'67'	
			decfsz  loop_cnt,F,A			
			bra		show6			
			decfsz  loop_cnt1,F,A			
			bra		show5
			nop			
			return

;*********************************************
;My Main Program.
;********************************************

start		clrf	TRISD,A

studentID	call	show5
			call	Delay56ms

			call	show6
			call	Delay56ms

			bra		studentID	
			end

;SORRY SIR I CANNOT MAKE ZIP FILE SINCE I HAVE SOME PROBLEM
; BUT HERE IS THE CODING AND 
;BUILD SUCEEDED.