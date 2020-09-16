;Timer0; alle 250us port 1.0 invertieren


init:
	mov TMOD,#00000010b	; auf  250 zählen
	mov th0,#6
	mov tl0,#6
	setb tr0	;timer0 starten

loop:
	jnb tf0,loop	;auf Überlauf testen
	cpl P1.0
	clr tf0		;tf löschen
	jmp loop


END