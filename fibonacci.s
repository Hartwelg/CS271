.data
x: .word 10 @set x to 10 (final counter value)
y: .word 0 @set y to 0 (fibonacci sequence value)
.text
_start:
@load values
LDR r1, =x @load address of x into r1
LDR r1, [r1] @load value of x into r1
MOV r2, #0 @2 ago
MOV r3, #1 @1 ago
MOV r4, #0 @now
MOV r5, #1 @init counter
B testLoop

@create loop
iteration:
ADD r5, r5, #1 @counter++
ADD r4, r3, r2 @add r2 (2 ago) to r3 (1 ago) and store in r4 (now)
MOV r2, r3 @r2 = r3
MOV r3, r4 @r3 = r4

B testLoop
testLoop:
@if counter != x
CMP r5, r1 @compare counter to x, tests how many loop iterations have run
BNE iteration
LDR r6, =y @load address of y into r6
LDR r6, [r6] @load value of y into r6
MOV r6, r4 @y = final fibonacci value
SWI 0x11 @end
