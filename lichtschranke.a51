;Lichtschranke zur Überprüfung der Fließbandgeschwindigkeit
band equ P1.0
lichtschranke equ P3.2

init:
	mov tmod,#00001001b     ;T0 gated, Mode 1
	mov tl0,#0
	mov th0,#0

start:
	jnb band,$ ;aAbfrage: Band läuft?
	jb lichtschranke,$ ;Abfrage Lichtschranke unterbrochen?
	setb tr0
	jnb lichtschranke,$ ;Abfrage Lichtschranke nicht mehr unterbrochen?
	jb lichtschranke,$ ;Abfrage Lichtschranke unterbrochen
	clr tr0
	call anzeige
	mov tl0,#0
	mov th0,#0
	jmp start
	
anzeige:
	ret
	
END