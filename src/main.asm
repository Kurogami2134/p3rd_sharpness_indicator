main:
    addiu   sp, sp, -8
    sw      a0, 0x0(sp)
    sw      a1, 0x4(sp)

    move    a3, a1

    la      at, EQUIPPED_WEAPON
    lb      a0, 0x1(at)
    addiu   a0, a0, -5
    lh      a1, 0x2(at)
    la      at, WEAPON_TABLES
    
    ; a0 * 4
    sll     a0, a0, 2
    addu    at, at, a0
    lw      at, 0x0(at)
    ; a1 * 0x1C
    sll     v0, a1, 5
    sll     v1, a1, 2
    subu    v0, v0, v1
    addu    at, at, v0
    ; a2 <- max sharpness
    lh      a2, 0x5CC(s3)

    ; v0 <- sharp idx
    lb      v0, 0x8(at)
    sll     v1, v0, 2
    addu    v0, v1, v1
    addu    v0, v0, v1
    la      at, SHARPNESS_TABLE
    addu    at, at, v0

@@loop:

    lh      v0, 0x0(at)
    slt     a0, v0, a3
    bnel    a0, zero, @@loop
    addiu   at, at, 2

    lh      v1, -0x2(at)
    sub     a3, a3, v1

    slt     at, a2, v0 ;  at == max_level < max_sharpness
    bnel    at, zero, @@normal
    move    v0, a2
@@normal:
    sub     v0, v0, v1

    li      v1, DEFAULT_LENGTH
    mult    v1, a3
    mflo    a3
    div     a3, v0
    mflo    a0

set_length: ;  a0: length
    la      at, SPRITE_INFO
    sh      a0, LENGTH_POS(at)
    addiu   a0, a0, UV_OFFSET
    sh      a0, LENGTH_UV(at)

ret:
    lw      a0, 0x0(sp)
    lw      a1, 0x4(sp)
    addiu   sp, sp, 8
    j       HOOK_RET
    nop
