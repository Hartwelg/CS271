.data
m: .byte 3
b: .byte -12
.align
x: .word 100
y: .word

.text
_start:
LDR r1, =m		@load r1 with address of m
STR r2, [r1]	@load r2 with value of m
LDR r3, =b		@load r3 with address of b
STR r4, [r3]	@load r4 with value of b
MUL r5, r3, r1	@multiply r3 and r1 together, and store value in r5
LDR r6, =x		@load r6 with address of x
LDR r7, [r6]	@load r7 with value of x
LDR r8, =y		@load r8 with address of y
ADD r8, r6, r5	@add r5 to r6 and store in variable y
