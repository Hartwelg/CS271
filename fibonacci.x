.data
x: .word 10 @set x to 10
y: .word 0 @set y to 0
z: .word 0 @set z to 0
.text
_start:
@load values
LDR r1, =x @load address of x into r1
LDR r1, [r1] @load value of x into r1
LDR r2, =y @load address of y into r2
LDR r2, [r2] @load value of y into r2
LDR r3, =z @load address of z into r3
LDR r3, [r3] @load value of z into r3

@create loop
ADD r2, #1 @add 1 to value of y
ADD r3, #1 @add 1 to value of z, 1 for every loop iteration
CMP r3, r1 @compare z to x, tests how many loop iterations have run
BNE iteration
SWI 0x11 @end
