PUSH {fp, lr}	@save spot in program

ADD fp, sp, #4	@set fp to 0x00 in frame
SUB sp, sp, #16	@allocate space for variables
STR r0, [fp, #-8]	@r0 to x in stack frame
STR r1, [fp, #-12]	@r1 to y in stack frame
LDR r0, [fp, #-8]	@r0 = x
LDR r1, [fp, #-12]	@r1 = y
MOV r4, #5			@r4 = 5
STR r4, [fp, #-16]	@q = 5
CMP r4, #0			@if x == 0
BNE else
ADD r2, r2, #1		@q = q + 1
B ending
else:
LDR r3, [fp, #-20]	@r3 = r
MUL r3, r2, r1		@r = q * y
ADD r3, #1			@r += 1
STR	r2, [fp, #-20]	@q = r
ending:
LDR r0, [fp, #-16]	@move q into r0
ADD sp, sp, #16		@remove 16 bytes for variables
POP {fp, lr}		@restore old fp and lr
MOV pc, lr			@return to program