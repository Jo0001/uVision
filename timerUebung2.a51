;Timer0 Mode 1
;Datum 17.06.2020
;Bei Mode 1 ist eine genaue Zeitbasis schwer

init:
	mov TMOD,#00000001b	;Timer0 Mode 1 50.000us
	mov TL0,#0B0h
	mov TH0,#3Ch
	mov R7,#20
	mov R6,#50	;50*20ms = 1s
	setb TR0
	
loop:
	jnb TF0,$
	mov TL0,#0B0h	;Rechtzeitig nachladen
	clr TF0
	mov TH0,#3Ch	;Wird erst später hochgezählt
	djnz R7, loop	;100Überlaufe abwarten
	mov R7,#20
	djnz R6,loop
	mov R6,#50
	jmp loop
	

	
	
	
	
END