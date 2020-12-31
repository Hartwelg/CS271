.data
arraySize: .word 7
array: .word 5, 5, 3, 6, 2, 8, 1
.text
_start:
LDR r1, =array
LDR r2, =arraySize
LDR r2, [r2]
MOV r3, #0 @counter
MOV r4, #0 @array index
B looptest
loop:
LDR r5, [r1] @r5 = array[counter]
MUL r5, r5, r5 @array[counter]^2
STR r5, [r1] @array[counter] = array[counter]^2
ADD r0, r0, r5 @add squared value to total
@next step
ADD r3, #1 @counter++
ADD r1, r1, #4 @next array value
looptest:
CMP r3, r2 @compare counter to array size
BNE loop

SWI 0x11