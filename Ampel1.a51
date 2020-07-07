;Ampel
;9.10.2019
gruen equ P1.7
gelb equ P1.6
rot equ P1.5
gruen2 equ P1.4
rot2 equ P1.2

start:
	setb gruen
	setb rot2
	lcall warte_lang
	clr gruen
	setb gelb
	lcall warte_kurz
	clr gelb
	setb rot
	setb gruen2
	lcall warte_lang
	clr gruen2
	setb rot2
	setb gelb
	lcall warte_kurz
	clr gelb
	clr rot
	
	jmp start

warte_kurz:
	mov R7,#155
loop:
	djnz R7,loop
	ret

warte_lang:
	mov r5,#100
loop2:
	mov r6,#255
loop1:	
	mov r7,#255
loop0:	
	djnz r7,loop0
	djnz r6,loop1
	djnz r5,loop2
	ret