;Stoppuhr mit Interrupts + Zeitauflösung in ms (4Stellen) & sec (1Stelle->max. 256)
;5.7.2020
ms equ 30h
msZehner equ 31h
msHundert equ 32h
sekunde equ 33h
jmp init

org 03h
	lcall entprellen
	cpl TR0
	reti
	
org 01bh	;t1 int
	lcall t0_interrupt
	reti

init:
	mov TMOD,#00010010b	;Timer0 Mode2 Timer1 Mode1
	mov TH0,#6 ;
	mov TL0,#6
	mov R2,#4	;4*250us= 1ms

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
	mov R7,#4	;nachladen
	
	inc ms
	mov a,#ms
	cjne a,#10,back	;vergleiche ob ms = 10
	mov ms,#0	;setze ms zurück
	inc msZehner
	
	mov a,#msZehner
	cjne a,#10,back	;vergleiche ob msZehner = 10
	mov msZehner,#0	;setze msZehner zurück
	inc msHundert
	
	mov a,#msHundert
	cjne a,#10,back	;vergleiche ob msHundert = 10
	mov msHundert,#0	;setze msHundert zurück
	inc sekunde
	
	
back:
	ret


END