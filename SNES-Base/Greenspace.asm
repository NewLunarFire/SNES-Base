.include "Header.inc"
.include "Snes_Init.asm"

VBlank:    ; Needed to satisfy interrupt definition in "header.inc"
    RTI

Start:
  ; Initialize the SNES.
  Snes_Init

  sep     #$20        ; Set the A register to 8-bit.
  lda     #%10000000  ; Force VBlank by turning off the screen.
  sta     $2100
  lda     #%11100000  ; Load the low byte of the green color.
  sta     $2122
  lda     #%00000000  ; Load the high byte of the green color.
  sta     $2122
  lda     #%00001111  ; End VBlank, setting brightness to 15 (100%).
  sta     $2100

  ; Loop forever.
Forever:
  jmp Forever
