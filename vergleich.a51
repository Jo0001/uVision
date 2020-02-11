;Autor: Jonas Knitz
;Datum: 23.10.2019
;Beschreibung: Vergleich von Zahlen
	
init:
	mov R7,#49
	mov 30h,#0
	cjne R7, #45, ungleich
	;zahlen sind gleich
	mov 30h,#1

	jmp init

ungleich:
	jnc groeser
	;zahl ist kleiner
	mov 30h,#2
	ljmp init
	
	
groeser:
	;zahl ist größer
	mov 30h,#3
	ljmp init
	
	end