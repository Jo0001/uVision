;Stoppuhr mit Interrupts
;1.7.2020
jmp init

org 03h
	lcall entprellen
	cpl TR0
	reti
	
org 01bh;t1 int
	lcall t0_interrupt
	reti

init:
	mov TMOD,#00010010b	;Timer0 Mode2 Timer1 Mode1
	mov TH0,#56 ;
	mov TL0,#56
	mov r7,#4	;4*200us
	mov TH1,#0d8h	;10ms
	mov TL1,#0f0h
	setb IT0	;ExtInt0 neg Taktflanken gesteuert 	
	setb ex0	;Extern Int0 freigeben
	setb ea		;globale Int Freigabe
	
loop:
	jmp loop

entprellen:
	setb TR1
	jnb TF1,$
	clr TR1
	mov TH1,#0d8h
	mov TL1,#0f0h
	clr TF1
	ret
	
t0_interrupt:
	djnz R7,back
	mov r7,#4	;nachladen
back:
	reti
END