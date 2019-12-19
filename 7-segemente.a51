;27.11.2019
;Anzeige von 2-stelligen Zahlen mit einer 7-Segmente-Anzeige
einer equ 30h
zehner equ 31h
zahl equ 32h
anz_e equ P1
anz_z equ P0

init:
	mov zahl,#0
	mov einer,#0
	mov zehner,#0
loop:
	mov a,zahl
	cjne a,#100,weiter
	mov zahl,#0
weiter:
	call zerlegung
	call anzeige
	inc zahl
	jmp loop
zerlegung:
	 mov a,zahl
	 mov b,#10
	 div ab
	 mov zehner,a
	 mov einer,b
	 ret
anzeige:
	mov dptr,#tabelle
	mov a,zehner
	movc a,@a+dptr
	mov anz_z,a
	mov a,einer
	movc a,@a+dptr
	mov anz_e,a
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