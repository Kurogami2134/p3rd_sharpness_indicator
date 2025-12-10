.psp


.relativeinclude on

LOAD_ADD        equ 0x08802A00

SHARPNESS_TABLE equ 0x0897D728
DEFAULT_LENGTH  equ 0x2F
SPRITE_INFO     equ 0x08B268DC
LENGTH_POS      equ 0
LENGTH_UV       equ 8
UV_OFFSET       equ 0x3F
EQUIPPED_WEAPON equ 0x09B49234

HOOK            equ 0x09D620CC
HOOK_RET        equ 0x088A7F60

.createfile "../bin/psp.bin", LOAD_ADD - 8
.word LOAD_ADD
.word @main_block_end - LOAD_ADD

.include "main.asm"

WEAPON_TABLES:
.word 0x08992168
.word 0x0898FA78
.word 0x0898E71C
.word 0x08990D64
.word 0x0898AB2C ; hbg
.word 0x00000000 ; mbg
.word 0x0898C01C ; lbg
.word 0x08991800
.word 0x0898D5D4
.word 0x089904DC
.word 0x089891DC ; bow
.word 0x0898F164
.word 0x0898DDB4
@main_block_end:
.word HOOK
.word 8
    jal     main
    nop
.close