;t1=50ms t0=200us
jmp init
org 00Bh
	cpl P1.0
	reti
org 01Bh
	cpl P1.1
	mov th1,#03Ch	;nachladen 
	mov tl1,#0B0h
	reti

init:
	mov TMOD,#00010010b	;to auf  250 zählen	 t1 auf 50
	mov th0,#6
	mov tl0,#6
	mov th1,#03Ch	;2^16-50000		 
	mov tl1,#0B0h

	setb et0
	setb et1
	setb ea

	setb tr1	;timer1 starten
	setb tr0	;timer0 starten

loop:
	jmp loop

END