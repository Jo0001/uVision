;Aufgabe 2 mit Stunden und Minuten anzeige
ICM	equ P0
Digit0 equ ICM.4
Digit1 equ ICM.5
Digit2 equ ICM.6
Digit3 equ ICM.7
z0 equ 30h
z1 equ 31h
sek equ 32h
min equ 33h
st equ 34h
	
init:
	mov z0,#0
	mov z1,#0
	mov sek,#0
	mov min,#0
	mov st,#0
	
	;Timer Einstellungen
	mov tmod,#00000010b
	mov th0,#0FFh
	mov tl0,#06h
	setb tr0
	
start:
	call anzeige
	
	jnb tf0,$
	clr tf0
		
	inc z0
	;check z0
	mov a,z0
	cjne a,#40,start
	mov z0,#0
	
	inc z1
	;check z1
	mov a,z1
	cjne a,#1000,start
	mov z1,#0
	
	inc sek
	;check sek
	mov a,sek
	cjne a,#60,start
	mov sek,#0
	
	inc min
	;check min
	mov a,min
	cjne a,#60,start
	mov min,#0
	
	inc st
	;cehck st
	mov a,st
	cjne a,#23,start
	mov st,#0
	
	jmp start

anzeige:
	mov ICM,min
	setb digit0
	mov ICM,st
	setb digit2
	ret
	
end