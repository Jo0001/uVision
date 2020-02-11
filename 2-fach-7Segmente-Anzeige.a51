; 22.01.2020
;Ansteuerung von 2 7-Segmente Anzeigen
anz1 equ P3.6
anz2 equ P3.7
wert equ P0
zaehler1 equ 30h
zaehler2 equ 31h
zaehler3 equ 32h

init:
	clr anz1
	clr anz2
	mov zaehler1,#0
	mov zaehler2,#0
	mov zaehler3,#3

start:
	call anzeigen
	setb anz1
	call warte
	clr anz1
	
	
	call anzeigen2
	setb anz2
	call warte
	clr anz2
	
	
	djnz zaehler3, start
	
	mov zaehler3,#2
	
	inc zaehler1
	
	mov a,zaehler1
	cjne a, #10,nein1
	
	mov zaehler1,#0
	
	inc zaehler2
		
		
nein1:
	mov a,zaehler2
	cjne a,#6,start
	mov zaehler2, #0
	
	;inc zaehler1
	;mov a,zaehler1
	;cjne a,#10, start
	;mov zaehler1,#0
	ljmp start
	
anzeigen:	
	mov dptr,#tabelle
	mov a,zaehler1
	movc a,@a+dptr
	mov wert,a
	ret
	
anzeigen2:	
	mov dptr,#tabelle
	mov a,zaehler2
	movc a,@a+dptr
	mov wert,a
	ret
	
warte:
	nop
	nop
	ret
	
tabelle:
	db 01111110b ;0
	db 00010010b ;1
	db 10111100b ;2
	db 10110110b ;3
	db 11010010b ;4
	db 11100110b ;5
	db 11101110b ;6
	db 00110010b ;7
	db 11111110b ;8
	db 11110110b ;9