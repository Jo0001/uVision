;Einf�hrung II zu Interrupts
;24.06.2020
;Bei Timer Int muss TF nicht gel�scht werden

jmp init

org 03h
	cpl P3.0
	reti

init:
	setb IT0	;Externer Int0 neg Taktflanken gesteuert (ohne gesetztes IT0 = Zustandsgesteuert ->Int ausf�hren, kurz zur�ck ins HP,Int ausf�hren...)
	setb ex0	;Extern Int0 freigeben
	setb ea		;globale Int Freigabe
	
loop:
	jmp loop
	
END