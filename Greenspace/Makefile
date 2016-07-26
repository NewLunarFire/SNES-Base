AS=wla-65816
LD=wlalink

Greenspace.smc: Header.inc Snes_Init.asm Greenspace.asm Greenspace.link font.asm
	$(AS) -vo Greenspace.asm Greenspace.obj
	$(LD) -vr Greenspace.link Greenspace.smc
