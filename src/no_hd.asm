.psp


.relativeinclude on

SHARPNESS_TABLE equ 0x0897D728
DEFAULT_LENGTH  equ 0x2F
SPRITE_INFO     equ 0x08B268DC
LENGTH_POS      equ 0
LENGTH_UV       equ 8
UV_OFFSET       equ 0x3F
EQUIPPED_WEAPON equ 0x09B49234
SHARP_OFFSET    equ 0x5CC

HOOK            equ 0x09D620CC
HOOK_RET        equ 0x088A7F60

.createfile "../bin/psp.bin", 0

.word 1 ;  Main Block
.word @main_block_end - @main_block
.ascii "WSSB"
@main_block:
.include "main.asm"

WEAPON_TABLES:
.word 0x08992168
.word 0x0898FA78
.word 0x0898E71C
.word 0x08990D64
.word 0 ; hbg
.word 0 ; mbg
.word 0 ; lbg
.word 0x08991800
.word 0x0898D5D4
.word 0x089904DC
.word 0 ; bow
.word 0x0898F164
.word 0x0898DDB4

@main_block_end:

.word 2 ;  Hook Block
.word HOOK
.halfword main - @main_block
.byte 0xC
.byte 1

.close
