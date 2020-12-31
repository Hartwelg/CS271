.data
fileName: .asciz "code.txt"	@name of file to be read
.align
buffer:		.space 80	@buffer space
.align
sentence:	.space 40 @space for output

.text
_start:
LDR r0, =fileName	@load filename to r0
MOV r1, #0	@read type = input
SWI 0x66	@read from file
CMP r0, #-1	@check if read was successful
BEQ end		@if unsuccessful, end program
MOV r0, #3	@move file handle to r0
LDR r1, =buffer	@load buffer space into r1
MOV r2, #80	@allowed space to read
SWI 0x6a	@read string into buffer space
MOV r4, #0	@start counter / index in buffer
MOV r8, #0	@index in sentence
LDR r5, =buffer	@&buffer space
LDR r7, =sentence	@make space for final output
loop:		@start loop
LDRB r6, [r5, r4]	@load current letter from buffer
CMP r6, #0	@check for end of string
BEQ end	@end program if end of string
ADD r4, r4, #1	@add 1 to counter / next index
TST r4, #1	@check if counter is odd
BNE odd	@branch if odd
B loop
odd:
STRB r6, [r7, r8]	@store letter into sentence variable
Add r8, r8, #1	@next space in sentence
B loop	@restart loop
SWI 0x68	@close file
end:
SWI 0x11	@end program