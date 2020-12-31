_start:
@Load r1 with value 0xE3A01CFA
LDR r1, =0xE3A01CFA @load r1 with value E3A01CFA
@Isolate bits 0-7 (rightmost 8 bits) into r2
LDR r2, =0x000000FA	@load r2 with last 8 bits
@Isolate bits 8-11 (four bits left of 0-7) into r3
LDR r3, =0x00A01C	@load r3 with bits 8 = 11
@Multiply r3 by 2 to get actual rotation amount
MOV r5, #2			@store 2 into register 5
MUL r3, r3, r5			@multiply bits 8 - 11 by 2
@rotate r2 to the right by r3's bits, place answer in r4
ROR r4, r3, r2		@rotate r3 by r2, store in r4
SWI 0x11