.include "Header.inc"
.include "Snes_Init.asm"

VBlank:    ; Needed to satisfy interrupt definition in "header.inc"
  rti

.ENUM $0000
cur_state db
prev_state db
press_btn db
lum db
x db
y db
.ENDE


Start:
  ; Initialize the SNES.
  Snes_Init

  sep #$20 ; Set the A register to 8-bit.
  rep #$10 ; Set the X and Y registers to 16-bit

  jsr DMAPalette
  jsr DMATiles

  stz $2105           ; Set Video mode 0, 8x8 tiles, 4 color BG1/BG2/BG3/BG4
  lda #$04            ; Set BG1's Tile Map offset to $0400 (Word address)
  sta $2107           ; And the Tile Map size to 32x32
  stz $210B           ; Set BG1's Character VRAM offset to $0000 (word address)

  lda #$01            ; Enable BG1
  sta $212C

  lda #$FF
  sta $210E
  sta $210E

  ; Now, load up some data into our tile map
  ; (If you had an full map, you could use LoadBlockToVRAM)
  ; Remember that in the default map, all entries point to tile #0
  lda #$80
  sta $2115
  ldx #$0400
  stx $2116

  lda #15
  sta $2100 ; Set brightness to 15 (100%)

  rep #30 ; Set the A, X and Y registers to 16-bit
  sep #10

  ; Main Loop
MainLoop:
  lda $4218
  sta cur_state
  eor prev_state
  beq Wait
  and prev_state
  sta press_btn
  cmp #$08
  beq IncLum
  cmp #$04
  beq DecLum
  jmp Wait

DecLum:
  ldx lum
  dex
  bmi Wait
  stx $2100
  stx lum
  jmp Wait

IncLum:
  ldx lum
  cmp #15
  bcs Wait
  inx
  stx $2100
  stx lum
  jmp Wait

Wait:
  wai
  jmp MainLoop

DMAPalette:
  stz $2121 ; Set CGRAM Address to 0
  stz $4300 ; Set DMA Mode (byte, increment)
  lda #$22
  sta $4301 ; Write to CGRAM ($2122)
  ldx #PALETTE
  stx $4302 ; Write Source Address
  stz $4304 ; Take from Bank 0
  ldx #8
  stx $4305 ; 4 Bytes to transfer (2 colors)

  lda #$01
  sta $420B ; Initiate CGRAM DMA Transfer

  rts

DMATiles:
  lda #$80
  sta $2115 ; Set Word Write mode to VRAM (increment after $2119)
  stz $2116
  stz $2117 ; Set VRAM Address to 0
  lda #$01
  sta $4300 ; Set DMA Mode (word, increment)
  lda #$18
  sta $4301 ; Write to VRAM ($2118)
  ldx #TILE.W ; Load Tile Address
  stx $4302 ; Write DMA Source Address
  stz $4304 ; Take it from bank 0
  ldx #32 ; Bytes to transfer
  stx $4305

  lda #$01
  sta $420B ; Initiate VRAM DMA Transfer

  rts

PALETTE:
  .dw $7C00, $02E0, $001F, $0000

TILE:
  .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  .db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
