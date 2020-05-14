;TEST
;Ausgabe eines periodischen Signals mittels T0 & T0-Interrupt
jmp init

org 0Bh			;Routine T0
	cpl P1.0	;Invertiere Pin
	reti
	
init:
	mov TMOD,#00000010b		;Modus 2,CT0
	mov TH0,#236			;Starten bei 236 da nur auf 20 gezählt werden soll
	mov TL0,#236
	setb ET0	;Freigabe T0 Interrupt
	setb ea		;globale I-Freigabe
	
	setb TR0

run:
	jmp run
	