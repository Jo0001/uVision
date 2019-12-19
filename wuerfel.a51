cube equ P0
zahl equ 6;Zahl zwischen 1 und 6
mov cube,#0

init:
	mov a,#zahl
	movc a,@a+dptr
	mov dptr,#tabelle
	mov cube,a
	ljmp init
	
tabelle:
	;--76543210
	db 00000000b;0
	db 00001000b;1
	db 01000001b;2
	db 01001001b;3
	db 01010101b;4
	db 01011101b;5
	db 11110111b;6
		
end