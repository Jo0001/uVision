;Z�hler der nach 10 Teilen das Flie�band stoppt
;Lichtschranke unterbrochen = 0
tstart equ P1.0
band equ P1.1
lichtschranke equ P3.2
	
init:
	mov TMOD,#00000110;Modus 2
	mov TH0,#246;Soll 10Teile z�hlen ->256-10= 246
	mov TL0,#246

start:
	jnb tstart,$ ;Warte bis TStart bet�tigt
	setb band;Motor starten
	jnb lichtschranke,$;Warte bis Lichtschranke nicht mehr unterbrochen
	setb TR0;Starte den Z�hler
	jnb TF0,$; warte auf �berlauf
	clr band; Motor aus
	clr TF0; �berlaufflag l�schen
	jmp start;Spring zu start und warte auf TStart bet�tigt
		
END