/*
Stack in main:
-------------------------------
FramePointer
Relative
Address           Contents
-------------------------------
 -12              r2.width
 -8               r2.height
 -4               r1.width
 0                r1.height
*/


.text
_start:
	@allocate space on the stack for two Rectangles
	SUB   	fp, sp, #4        @fp will point to block of memory where two Rectangles are
	SUB 	sp, sp, #16
	
	@construct Rectangle r1(2, 4)
	MOV		r0, fp
	MOV		r1, #2
	MOV		r2, #4
	BL		Rectangle_Rectangle
	
	@r4 = r1.getArea()
	MOV		r0, fp
	BL		Rectangle_getArea
	MOV		r4, r0	
	
	@construct Rectangle r2(3, 3)
	SUB		r0, fp, #8
	MOV		r1, #3
	MOV		r2, #3
	BL		Rectangle_Rectangle
	
	@r2.setWidth(5)
	SUB		r0, fp, #8
	MOV r1, #5
	BL		Rectangle_setWidth
	
	@r5 = r2.getArea()
	BL Rectangle_getArea
	MOV r5, r0
	
	@deallocated stack space
	ADD		sp, sp, #16
	
	@exit
	SWI   0x11
	
	
Rectangle_Rectangle:
	PUSH {fp, lr}
	STR r2, [r0, #0]
	STR r1, [r0, #-4]
	POP {fp, lr}
	MOV pc, lr
		
Rectangle_getArea:
	PUSH {fp, lr}
	LDR r2, [r0, #0]
	LDR r1, [r0, #-4]
	MUL r0, r1, r2
	POP {fp, lr}
	MOV pc, lr
	
Rectangle_setWidth:
	PUSH {fp, lr}
	STR r1, [r0, #-4]
	POP {fp, lr}
	MOV pc, lr