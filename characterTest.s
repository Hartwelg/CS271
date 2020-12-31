.data
character: .byte 'g' @character = 'g'

.text
_start:
LDR r1, =character @load r1 with address of character
LDR r1, [r1] @load r1 with value of r1
CMP r1, #0 @compare character to null
BEQ notChar
CMP r1, #0x41 @compare character to "A"
BLT notChar
CMP r1, #0x5A @compare character to "Z"
CMP r1, #0x61 @compare character to "a"
BLT notChar
CMP r1, #0x7A @compare character to "z"
MOV r0, #1 @set  r0 to 1
B end
notChar:
MOV r0, #0 @set r0 to 0
b end
end:
SWI 0x11 @end