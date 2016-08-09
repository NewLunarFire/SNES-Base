.include "Header.inc"
.include "Snes_Init.asm"
.include "Registers.inc"

VBlank:    ; Needed to satisfy interrupt definition in "header.inc"
    rti

Start:
  ; Initialize the SNES.
  Snes_Init

  sep #$20  ; Set the A register to 8-bit.
  rep #$10  ; Set Index Registers to 16-bit

  lda #$10
  sta BGMODE

  lda #$08            ; Set BG1's Tile Map offset to $0800 (Word address)
  sta BG1SC           ; And the Tile Map size to 32x32
  stz BG12NBA           ; Set BG1's Character VRAM offset to $0000 (word address)

  lda #$01            ; Enable BG1
  sta TM

  stz CGADD ; Set CGRAM Address to 0
  ldx #Palette ; Load Palette address
  ldy #8 ; 4 Color (8 bytes) to transfer
  jsr DMACGRAM

  ldx #0
  stx VMADDL ; Set VRAM Address to 0
  ldx #ChessPattern ; Load Tile Address
  ldy #288 ; 288 bytes to transfer
  jsr DMAVRAM

  ldx #$0800
  stx VMADDL
  ldx #OAMData
  ldy #1024
  jsr DMAOAM

  lda #15  ; End VBlank, setting brightness to 15 (100%).
  sta INIDISP

  ; Loop forever.
Forever:
  jmp Forever

; Prepare DMA to CGRAM
DMACGRAM:
  stz DMAP0 ; Set DMA Mode (byte, increment)
  lda #$22
  sta BBAD0 ; Write to CGRAM ($2122)
  jmp DMA

; Prepare DMA to VRAM
DMAVRAM:
  lda #$80
  sta VMAIN ; Set Word Write mode to VRAM (increment after $2119)

  lda #$01
  sta DMAP0 ; Set DMA Mode (word, increment)
  lda #$18
  sta BBAD0 ; Write to VRAM ($2118)
  jmp DMA

DMAOAM:
  stz VMAIN ; Set Byte Write mode to VRAM (increment after $2118)
  stz DMAP0 ; Set DMA Mode (byte, increment)
  lda #$18
  sta BBAD0 ; Write to VRAM ($2118)

;Execute DMA
DMA:
  stz A1B0 ; Set Bank to 0
  stx A1T0L ; Write Source address
  sty DAS0L ; Write number of bytes
  lda #$01
  sta MDMAEN ; Initiate CGRAM DMA Transfer
  rts

Palette:
  .incbin "ChessPattern.cgr"
ChessPattern:
  .incbin "ChessPattern.vra"
OAMData:
  .dsb 1024, $00
