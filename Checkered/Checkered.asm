.include "Header.inc"
.include "Snes_Init.asm"

VBlank:    ; Needed to satisfy interrupt definition in "header.inc"
    RTI

Start:
  ; Initialize the SNES.
  Snes_Init

  sep #$20        ; Set the A register to 8-bit.
  rep #$10

  lda #$10
  sta $2105
  lda #$08            ; Set BG1's Tile Map offset to $0400 (Word address)
  sta $2107           ; And the Tile Map size to 32x32
  stz $210B           ; Set BG1's Character VRAM offset to $0000 (word address)

  lda #$01            ; Enable BG1
  sta $212C

  lda #$FF
  sta $210E
  sta $210E

  jsr DMAPalette
  jsr DMATile1
  jsr DMATile2

  lda     #15  ; End VBlank, setting brightness to 15 (100%).
  sta     $2100

  ; Loop forever.
Forever:
  jmp Forever

DMAPalette:
  stz $2121 ; Set CGRAM Address to 0
  stz $4300 ; Set DMA Mode (byte, increment)
  lda #$22
  sta $4301 ; Write to CGRAM ($2122)
  ldx #Palette
  stx $4302 ; Write Source Address
  stz $4304 ; Take from Bank 0
  ldx #8
  stx $4305 ; 4 Bytes to transfer (2 colors)

  lda #$01
  sta $420B ; Initiate CGRAM DMA Transfer

  rts

DMATile1:
  lda #$80
  sta $2115 ; Set Word Write mode to VRAM (increment after $2119)
  stz $2116
  stz $2117 ; Set VRAM Address to 0

  lda #$01
  sta $4300 ; Set DMA Mode (word, increment)
  lda #$18
  sta $4301 ; Write to VRAM ($2118)
  ldx #Tile1.W ; Load Tile Address
  stx $4302 ; Write DMA Source Address
  stz $4304 ; Take it from bank 0
  ldx #32 ; Bytes to transfer
  stx $4305

  lda #$03
  sta $420B ; Initiate VRAM DMA Transfer

  rts

  DMATile2:
    lda #$80
    sta $2115 ; Set Word Write mode to VRAM (increment after $2119)
    ldx #$0080
    stx $2116 ; Set VRAM Address

    lda #$01
    sta $4300 ; Set DMA Mode (word, increment)
    lda #$18
    sta $4301 ; Write to VRAM ($2118)
    ldx #Tile2.W ; Load Tile Address
    stx $4302 ; Write DMA Source Address
    stz $4304 ; Take it from bank 0
    ldx #32 ; Bytes to transfer
    stx $4305

    lda #$03
    sta $420B ; Initiate VRAM DMA Transfer

    rts

Palette:
  .dw $0000, $2108, $4210, $6318

Tile1:
  .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  .db $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF

Tile2:
  .db $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
