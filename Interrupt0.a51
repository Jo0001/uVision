;Einführung II zu Interrupts
;24.06.2020
;Bei Timer Int muss TF nicht gelöscht werden

jmp init

org 03h
	cpl P3.0
	reti

init:
	setb IT0	;Externer Int0 neg Taktflanken gesteuert (ohne gesetztes IT0 = Zustandsgesteuert ->Int ausführen, kurz zurück ins HP,Int ausführen...)
	setb ex0	;Extern Int0 freigeben
	setb ea		;globale Int Freigabe
	
loop:
	jmp loop
	
END