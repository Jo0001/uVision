;Ampel
ampel equ P0
taster equ ampel.7
	
gruenAuto equ ampel.0
gelbAuto equ ampel.1
rotAuto equ ampel.2
gruenFus equ ampel.3
rotFus equ ampel.4

;reset Port
init:
	mov ampel,#0
	setb taster
	setb gruenAuto
	setb rotFus

start:
    ;Tasterabfrage
	jb taster, start

	setb gruenAuto
	setb rotFus
	
	lcall zeitlang
	
	setb gelbAuto
	clr gruenAuto
	setb rotAuto
	clr gelbAuto
	
	lcall zeitkurz
	
	setb rotAuto
	setb gruenFus
	clr rotFus
	
	lcall zeitlang
	
	setb gelbAuto
	clr rotAuto
	;setb rotFus
	clr gruenFus
	clr gelbAuto
	
	setb gruenAuto
	setb rotFus
	
	lcall zeitkurz
	
	ljmp start
		
zeitlang:
	nop
	nop
	nop
	ret
zeitkurz:
	nop
	ret

end