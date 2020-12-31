.data
buffer:	.word 80
.align
apple:	.asciz "apple"
.align
banana:	.asciz "banana"
.align
.text
_start:
MOV r7, #'A'
LDR r1, =buffer
CMP r7, #'A'
BEQ A
CMP r7, #'B'
BEQ B
exit:
SWI 0x11
A:
LDR r1, =apple
LDR r2, =buffer
LDR r2, [r1]
B exit
B:
LDR r1, =banana
LDR r2, =buffer
LDR r2, [r1]
B exit