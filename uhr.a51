;Autor: Jonas Knitz
;Datum: 27.11.2019
;Funktion: Uhr die abwechselnd die Stunden und Minuten anzeigt
einer equ 31h
zehner equ 32h
zeitStunden equ 33h
zeitMinuten equ 34h
AnzZ equ P0
AnzE equ P1
init:
	;Testuhrzeit
	mov zeitStunden, #12
	mov zeitMinuten, #30
;Hauptschleife
loop:
	call zerlegeStunden
	call anzeigen
	call zerlegeMinuten
	call anzeigen
	call zaehlen
	jmp loop

;Hochzählen
zaehlen:
	inc zeitMinuten
	mov a, zeitMinuten 
	cjne a, #60, weiter
	mov zeitMinuten, #0
	inc zeitStunden
weiter:
	mov a, zeitStunden
	cjne a, #24, weiter2
	mov zeitStunden, #0
weiter2:
	ret

zerlegeStunden:
	mov a, zeitStunden
	mov b, #10
	div ab
	mov einer, b
	mov zehner, a
	ret

zerlegeMinuten:
	mov a, zeitMinuten
	mov b, #10
	div ab
	mov einer, b
	mov zehner, a
	ret
	
anzeigen:
	mov dptr, #table
	mov a, einer
	movc a, @a+dptr
	mov anzE, a
	mov dptr, #table
	mov a, zehner
	movc a, @a+dptr
	mov anzZ, a
	ret
	
table:
	db 01111110b;0
	db 00010010b;1
	db 10111100b;2
	db 10110110b;3
	db 11010010b;4
	db 11100110b;5
	db 11101110b;6
	db 00110010b;7
	db 11111110b;8
	db 11110110b;9