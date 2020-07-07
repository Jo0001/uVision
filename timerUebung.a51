;Timer0 Mode 2
;Datum 17.06.2020

init:
	mov TMOD,#00000010b	;Timer0 Mode 2 200us
	mov TL0,#56
	mov TH0,#56
	mov R7,#100	;100*200us = 20ms
	mov R6,#50	;50*20ms = 1s
	setb TR0
	
loop:
	jnb TF0,$
	clr TF0
	djnz R7, loop	;100Überlaufe abwarten
	mov R7,#100
	djnz R6,loop
	mov R6,#50
	jmp loop
	

	
	
	
	
END