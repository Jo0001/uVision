;Einstiegsaufgabe zum Interrupt
	jmp init

org 03h
	cpl P1.0	;Invertiere Pin
	reti		;Zurück ins Hauptprogramm
	
init:
	setb ex0	;Freigabe externer Interrupt0
	setb ea		;globale I-Freigabe
	setb IT0
	
loop:
	jmp loop