;Geschwindigkeitsberechung der Objekte auf dem Flieﬂband mit Hilfe einer Tabelle
band equ P1.0
lichtschranke equ P3.2

init:
	mov TMOD,#00011001b     ;T1, Mode1, 16Bit/T0 gated, Mode 1
	mov TL0,#0
	mov TH0,#0
	
	mov TH1,#5Fh ;Testwerte
	mov TL1,#0D8h
	setb TR1

start:
	jnb band,$ ;aAbfrage: Band l‰uft?
	jb lichtschranke,$ ;Abfrage Lichtschranke unterbrochen?
	setb tr0
	jnb lichtschranke,$ ;Abfrage Lichtschranke unterbrochen?
	jb lichtschranke,$ ;Abfrage Lichtschranke wieder frei?
	clr tr0
	call anzeige
	mov TL0,#0
	mov TH0,#0
	jmp start
	
anzeige:
	mov a,TH0
	mov b,#0A0h
	subb a,b
	mov b,#4
	div ab
	
	mov dptr,#tabelle
	movc a,@a+dptr
	
	ret
	
	
tabelle:
	db 244,238,233,227,222,217,213,208,204,200,196,192,189,185,181,179,175,172,169,167,164,161,159,156
	
END