;Zur Erkennung von positiven und negativen Flanken
;8.1.2020
init:
	eingang equ P1.0
	merker equ 0
	mov c,eingang
	mov merker,c
	
start:	
	;vergleich merker=1
	jnb merker, z0;nein
	;ja:
	jnb eingang, z2;nein
	;ja:
	ljmp z1
	
z0:
	;vergleich eingang = 1
	jnb eingang, z1;nein
	;ja:
	ljmp z2

;neg Flanke
z1:
	nop
	ret

;pos Flanke (verschied.)
z2: 
	mov c,eingang
	mov merker,c
	nop
	ret