.data
hexString: .asciz "A2"	@string to be read
.align

.text
_start:	@begin
LDR r5, =hexString	@r5 = &hexString
MOV r6, #0		@r6 = counter / place in hexString
MOV r7, #0 @accumulated value
loop:
LDRB r0, [r5, r6]	@load first character into r0
CMP r0, #0	@check for end of string
BEQ end	@if equal, branch to end of program
BL function	@branch and link to function
ADD r7, r0, r7	@add returned value to accumulator
CMP r6, #0	@check place in string
BNE end	@if equal, branch to end of program
MOV r8, #16	@r8 = multiplier
MUL r7, r7, r8	@multiply r7 by 16
ADD r6, r6, #1	@add 1 to counter
B loop	@restart loop
end:	@end of program
MOV r4, r7	@place answer in r4
SWI 0x11	@end

function:
CMP r0, #57	@compare character to #9
BLT zeroNine	@if less than '9', go to 0 - 9 part
CMP r0, #'A'	@compare character to 'A'
BLT zeroNine	@if less than 'A', go to 0 - 9 part
SUB r0, r0, #'A'	@subtract 'A' from character
ADD r0, r0, #10		@add 10 to get 10 - 15 value
B funcEnd	@branch to end of function
zeroNine:	@0 - 9 part
SUB r0, r0, #'0'	@subtract '0' from character to get 0 - 9 value
funcEnd:	@end of function
MOV pc, lr	@go back to saved place in function