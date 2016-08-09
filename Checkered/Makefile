AS=wla-65816
LD=wlalink
PNG2SNES=../../png2snes/png2snes

Checkered.smc: Checkered.obj Checkered.link
	$(LD) -vr Checkered.link Checkered.smc

Checkered.obj: Checkered.asm Header.inc Snes_Init.asm ChessPattern.cgr  ChessPattern.vra
	$(AS) -vo $< Checkered.obj

ChessPattern.cgr: ChessPattern.png
	$(PNG2SNES)  $< --bitplanes 2 --tilesize 16 --output=ChessPattern --binary

clean:
	rm *.obj *.cgr *.vra
