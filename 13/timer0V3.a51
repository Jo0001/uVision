;Timer0; alle 250us port 1.0 invertieren
;T1; alle 50ms P1.1 inv

init:
	mov TMOD,#00010010b	;to auf  250 zählen	 t1 auf 50
	mov th0,#6
	mov tl0,#6
	mov th1,#03Ch	;2^16-50000		 
	mov tl1,#0B0h
	setb tr1	;timer1 starten
	setb tr0	;timer0 starten

loop:
	jnb tf0,loop	;auf Überlauf testen
	cpl P1.0
	clr tf0		;tf löschen
	jnb tf1,loop
	cpl P1.1
	mov th1,#03Ch	;nachladen	 
	mov tl1,#0B0h
	clr tf1
	jmp loop


END