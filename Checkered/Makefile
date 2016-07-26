AS=wla-65816
LD=wlalink

Checkered.smc: Header.inc Snes_Init.asm Checkered.asm Checkered.link
	$(AS) -vo Checkered.asm Checkered.obj
	$(LD) -vr Checkered.link Checkered.smc
