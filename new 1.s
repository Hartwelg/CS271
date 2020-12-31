_start:
MOV r1, #40
MOV r2, #50
MOV r3, #60
MOV r4, #70
ADD r1, r2, r1
ADD r3, r4, r3
ADD r2, r1, r3
ASR r1, r2, #2
SWI 0x11