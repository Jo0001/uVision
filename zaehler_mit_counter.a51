;Zähler der nach 10 Teilen das Fließband stoppt
;Lichtschranke unterbrochen = 0
tstart equ P1.0
band equ P1.1
lichtschranke equ P3.2
	
init:
	mov TMOD,#00000110b;Modus 2
	mov TH0,#246;Soll 10Teile zählen ->256-10= 246
	mov TL0,#246

start:
	jnb tstart,$ ;Warte bis TStart betätigt
	setb band;Motor starten
	jnb lichtschranke,$;Warte bis Lichtschranke nicht mehr unterbrochen
	setb TR0;Starte den Zähler
	jnb TF0,$; warte auf Überlauf
	clr band; Motor aus
	clr TF0; Überlaufflag löschen
	jmp start;Spring zu start und warte auf TStart betätigt
		
END
