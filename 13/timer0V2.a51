;T1; alle 50ms P1.1 inv

init:
	mov TMOD,#00010000b	;	 t1 auf 50
	mov th1,#03Ch	;2^16-50000		 
	mov tl1,#0B0h
	setb tr1	;timer1 starten


loop:
	jnb tf1,loop
	cpl P1.1
	mov th1,#03Ch	;nachladen	 
	mov tl1,#0B0h
	clr tf1
	jmp loop


END