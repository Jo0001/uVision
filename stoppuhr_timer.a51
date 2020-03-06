;Stoppuhr mit Timer
tstart equ P1.0
tstopp equ P1.1
treset equ P1.2
counter equ 30h

init:
	mov tmod,#00000010b;mode 2
	mov th0,#6;da immer auf 250 gezählt werden soll
	mov tl0,#6
	mov counter,#40
	
start:
	jb tstart,$
	setb tr0
ziel0:
	jnb tf0,$
	clr tf0
	jnb tstopp,ziel1
	jnb treset,init
	djnz counter,ziel0
	mov counter,#40
ziel1:
	call anzeige
	jmp start

anzeige:
	ret
	
END