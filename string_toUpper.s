.data
myString: .asciz "in a hole in the ground there lived a hobbit"
.align

.text
_start:
LDR r1, =myString @r1 = &myString
MOV r2, #0 @index in string
B compare
loopTest:
CMP r4, #0x20 @0x20 = space
BEQ increment
SUB r4, #32 @lowercase - 32 = upper case
increment:
STRB r4, [r1, r2] @store character back in string
ADD r2, r2, #1 @next letter
compare:
LDRSB r4, [r1, r2] @current character
CMP r4, #0 @0 = end of string
BNE loopTest
end:
SWI 0x11


@if letter = ox20, store back in string
@else, add 32