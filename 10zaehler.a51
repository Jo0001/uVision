;HA: 10externe Impulse zählen

init:
	mov TMOD,#00000110b	;Mode 2 CT=1
	mov TH0,#246
	mov TL0,#246
	
	setb TR0
	
loop:
	jnb TF0,$
	;10 Impulse wurden erreicht
	clr TF0
	jmp loop
	
END