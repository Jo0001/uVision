;TEST
;UP1 jede ms & UP2 alle 100ms mittels T0
tmp equ 30h
jmp init

org 0Bh			;Routine T0
	call up1
	reti
	
init:
	mov tmp,#100
	mov TMOD,#00000001b		;Modus 1,CT0
	mov TH0,#0FCh			;Starten bei 64536 da nur auf 1000 gezählt werden soll
	mov TL0,#018h
	setb ET0	;Freigabe T0 Interrupt
	setb ea		;globale I-Freigabe
	
	setb TR0

run:
	jmp run
up1:
	cpl P1.0	;Invertiere Pin
	dec tmp 	;tmp--
	mov a,tmp	;schreibe tmp in den akku
	jz up2		;wenn akku == 0 springe zu up2
	ret
	
up2:
	cpl P1.1	;Invertiere Pin
	mov tmp,#100
	ret