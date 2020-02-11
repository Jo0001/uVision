;Datum: 11.02.2020
;Autor: Jo0001
;Aufgabe 1 mit ICM7212
ziffer0 equ 30h
ziffer1 equ 31h
ziffer2 equ 32h
ziffer3 equ 33h

ICM	equ P0
Digit0 equ ICM.4
Digit1 equ ICM.5
Digit2 equ ICM.6
Digit3 equ ICM.7


init:
	mov ziffer0,#1
	mov ziffer1,#2
	mov ziffer2,#3
	mov ziffer3,#4
	
start:
	call anzeige
	
	inc ziffer0
	mov a,ziffer0
	cjne a, #10,weiter
	mov ziffer0,#0
	inc ziffer1
	
	
	jmp start

weiter:
	call anzeige
	jmp start

anzeige:
	mov ICM,Ziffer0
	setb digit0
	
	mov ICM,Ziffer1
	setb digit1
	
	mov ICM,Ziffer2
	setb digit2
	
	mov ICM,Ziffer3
	setb digit3

	ret
	
end