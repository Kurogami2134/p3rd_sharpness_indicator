.psp


.relativeinclude on

LOAD_ADD        equ 0x08802A00

SHARPNESS_TABLE equ 0x08983060
DEFAULT_LENGTH  equ 0x2F
SPRITE_INFO     equ 0x08B2D09C
LENGTH_POS      equ 0
LENGTH_UV       equ 8
UV_OFFSET       equ 0x3F
EQUIPPED_WEAPON equ 0x09F4FCE4
SHARP_OFFSET    equ 0x5DC

HOOK            equ 0x0A168C20
HOOK_RET        equ 0x088A98B8

.createfile "../bin/hd.bin", LOAD_ADD - 8
.word LOAD_ADD
.word @main_block_end - LOAD_ADD

.include "main.asm"

WEAPON_TABLES:; need to update them all
.word 0x08997AA0
.word 0x089953B0
.word 0x08994054
.word 0x0899669C
.word 0 ; hbg
.word 0 ; mbg
.word 0 ; lbg
.word 0x08997138
.word 0x08992F0C
.word 0x08995E14
.word 0 ; bow
.word 0x08994A9C
.word 0x089936EC
@main_block_end:
.word HOOK
.word 8
    jal     main
    nop
.close