;Autor: Jonas Knitz
;Datum: 25.09.2019
;Prg-Name: Blink01.a51
;Beschreibung: Blinken einer LED
;Notizen
;setb (setBit) P1->Port, Anschluss 0
;longjump (ljmp)->springt zu fester Addresse oder Programmziel ( setzt Programmzaehler auf 0)
;nop (no operation) mache einen Takt nichts
;decrement jump not zero (djnz


start:
	setb P1.0
loop:
	djnz R7,loop
	clr P1.0
loop1:
	djnz R7,loop1
	ljmp start
	
	
	end