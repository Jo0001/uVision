;Stoppuhr mit 3 Bedientasten
tstart equ P1.0
tstopp equ P1.1
treset equ P1.2
tmp equ R2

init:
	mov TMOD,#00000010;Modus 2,CT0
	mov TH0,#6;Starten bei 6 da nur auf 250 gez�hlt werden soll
	mov TL0,#6
initR:
    mov R2,#4
	mov R3,#10
	mov R4,#10
	mov R5,#10
	mov R6,#10
	mov R7,#10

	jnb tstart,$;warte bis start bet�igt
start:
	setb TR0
start2:
	jnb TF0,$;warten auf �berlauf
	clr TF0; �berlaufflag l�schen
	djnz tmp,$;warte 4�berl�ufe ab
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
	jnb tstopp,	start2;Wenn nicht bet�tigt springe zu start2
	clr TR0;Stoppe Z�hler
	call anzeige
start4:
	jb tstart,start;Wenn Start bet�tigt springe zu start
	jb treset,initR;Wenn Reset bet�tigt resete Register
	jmp start4
	
anzeige:
	ret	
END