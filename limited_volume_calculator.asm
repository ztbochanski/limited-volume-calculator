TITLE limited_volume_calculator     (limited_volume_calculator.asm)

; ------------------------------------------------------------------------
; Author: Zachary Bochanski
; Last Modified: 2021.07.03
; Description: This program accepts two integers and calculates the volumes of 
; 				a prism, pyramid, and two spheres based on two different radii.
; ------------------------------------------------------------------------


INCLUDE Irvine32.inc

DIVISOR = 3
SPHER_CONST = 12564
SPHER_DIV = 3000

; ------------------------------------------------------------------------
; Data Section - initialize variable definitions

; Definition needs:
;	1st define => strings to display
;	2nd define => empty locations to store numbers
; ------------------------------------------------------------------------
.data
	intro				BYTE	"Welcome to Volume Calc by Zach, enter two numbers greater than zero to compute various volumes", 0
	askForNum1	BYTE	"Enter base area/radius: ", 0
	askForNum2	BYTE	"Enter base height/radius: ", 0
	outro				BYTE	"Thanks for using the calculator! goodbye!", 0
	aPrism			BYTE	"A prism ", 0
	aPyr				BYTE	"A pyramid ", 0
	aSphere			BYTE	"A sphere with radius ", 0
	areaStr			BYTE	"that has an area of ", 0
	heightStr		BYTE	" meters, and a height of ", 0
	meters			BYTE	" meters, has a volume of ", 0
	mCubed			BYTE 	" meters cubed", 0
	num1 				DWORD	?
	num2 				DWORD	?
	vol					DWORD	?
	product			DWORD	?

; ------------------------------------------------------------------------
; Code Section - instructions for logic here

; steps in program:
; 	1. introduction
; 	2. get the data from the user
; 	3. calculate 4 volumes
; 	4. print the results
; 	5. say goodby
; ------------------------------------------------------------------------
.code
main PROC
	
	; introduction
	MOV 	EDX, OFFSET intro
	CALL 	WriteString
	CALL 	CRLF

	; get the first number
	CALL 	CRLF
	MOV 	EDX, OFFSET askForNum1
	CALL 	WriteString
	CALL	ReadInt
	MOV	num1, EAX

	; get the second number
	MOV 	EDX, OFFSET askForNum2
	CALL 	WriteString
	CALL	ReadInt
	MOV	num2, EAX
	CALL 	CRLF

	; calculate a prism (num1)*(num2)
	MOV 	EAX, num1
	MOV		EBX, num2
	MUL 	EBX			; mul eax reg with what? we want to mul by ebx
	MOV		vol, EAX	; store contents of EAX in vol

	; display prism calc
	MOV 	EDX, OFFSET aPrism		; A prism
	CALL 	WriteString	
	MOV 	EDX, OFFSET areaStr	; that has an area of
	CALL 	WriteString			
	
	MOV 	EAX, num1
	CALL 	WriteDec
	MOV 	EDX, OFFSET heightStr	; meters, and a height of
	CALL 	WriteString
	CALL 	CRLF
	
	MOV 	EAX, num2	
	CALL 	WriteDec			
	MOV 	EDX, OFFSET meters		; meters, will have a volume of
	CALL 	WriteString			
				
	MOV 	EAX, vol	
	CALL 	WriteDec		
	MOV 	EDX, OFFSET mCubed		; meters cubed
	CALL 	WriteString			
	CALL	CRLF

	; calculate a pyramid ((num1)*(num2))/3
	MOV 	EAX, num1
	MOV		EBX, num2
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, DIVISOR
	DIV 	EBX		
	MOV		vol, EAX

	; display pyramid calc
	CALL	CRLF
	MOV 	EDX, OFFSET aPyr		; A pyramid
	CALL 	WriteString	
	MOV 	EDX, OFFSET areaStr	; that has an area of
	CALL 	WriteString			
	
	MOV 	EAX, num1
	CALL 	WriteDec
	MOV 	EDX, OFFSET heightStr	; meters, and a height of
	CALL 	WriteString
	CALL 	CRLF
	
	MOV 	EAX, num2	
	CALL 	WriteDec			
	MOV 	EDX, OFFSET meters		; meters, will have a volume of
	CALL 	WriteString			
				
	MOV 	EAX, vol	
	CALL 	WriteDec		
	MOV 	EDX, OFFSET mCubed		; meters cubed
	CALL 	WriteString			
	CALL	CRLF

	; calculate sphere num1 = radius (4*3141*(num1)*(num1)*(num1))/3000
	MOV 	EAX, SPHER_CONST		; 4*3141
	MOV		EBX, num1
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, num1
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, num1
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, SPHER_DIV
	DIV 	EBX		
	MOV		vol, EAX

	; display shere calc num1
	CALL	CRLF
	MOV 	EDX, OFFSET aSphere	; A sphere with radius
	CALL 	WriteString			
	
	MOV 	EAX, num1	
	CALL 	WriteDec			
	MOV 	EDX, OFFSET meters		; meters, will have a volume of
	CALL 	WriteString			
				
	MOV 	EAX, vol	
	CALL 	WriteDec		
	MOV 	EDX, OFFSET mCubed		; meters cubed
	CALL 	WriteString			
	CALL	CRLF

	; calculate sphere num2 = radius (4*3141*(num1)*(num1)*(num1))/3000
	MOV 	EAX, SPHER_CONST		; 4*3141
	MOV		EBX, num2
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, num2
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, num2
	MUL 	EBX		
	MOV		product, EAX

	MOV 	EAX, product
	MOV		EBX, SPHER_DIV
	DIV 	EBX		
	MOV		vol, EAX

	; display shere calc num2
	CALL	CRLF
	MOV 	EDX, OFFSET aSphere	; A sphere with radius
	CALL 	WriteString			
	
	MOV 	EAX, num2	
	CALL 	WriteDec			
	MOV 	EDX, OFFSET meters		; meters, will have a volume of
	CALL 	WriteString			
				
	MOV 	EAX, vol	
	CALL 	WriteDec		
	MOV 	EDX, OFFSET mCubed		; meters cubed
	CALL 	WriteString			
	CALL	CRLF

	Invoke ExitProcess,0	; exit to operating system
main ENDP

END main
