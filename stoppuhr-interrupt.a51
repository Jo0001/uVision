;Stoppuhr mit 3 Bedientasten
treset equ P1.2
tmp equ R2
	
jmp init
	
org 03h
	setb TR0
	reti
	
org 013h
	clr TR0		;Stoppe Zähler
	call anzeige
	reti

init:
	mov TMOD,#00000010b		;Modus 2,CT0
	mov TH0,#6				;Starten bei 6 da nur auf 250 gezählt werden soll
	mov TL0,#6
	
	setb ex0	;Freigabe externer Interrupt0
	setb ex1	;Freigabe externer Interrupt1
	setb ea		;globale I-Freigabe
	setb IT0	;Interrupt0-Routine nur 1x ausführen
	
initR:
    mov tmp,#4
	mov R3,#10
	mov R4,#10
	mov R5,#10
	mov R6,#10
	mov R7,#10

		
start2:
	jnb TF0,$;warten auf Überlauf
	clr TF0; Überlaufflag löschen
	djnz tmp,$;warte 4Überläufe ab
	mov tmp,#4;Reset auf 4
	djnz R7,start3
	mov R7,#10
	call anzeige
	djnz R6,start3
	mov R6,#10
	djnz R5,start3
	mov R6,#10
	djnz R4,start3
	mov R6,#10
	djnz R3,start3
	mov R6,#10
	
start3:
	jb treset,init;Wenn Reset betätigt resete Register
	jmp start2
	
anzeige:
	ret	
	
END