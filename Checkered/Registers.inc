; Register names are taken from here: http://wiki.superfamicom.org/snes/show/Registers

.equ	INIDISP	$2100	;	Screen Display Register
.equ	OBSEL	$2101	;	Object Size and Character Size Register
.equ	OAMADDL	$2102	;	OAM Address Registers (Low)
.equ	OAMADDH	$2103	;	OAM Address Registers (High)
.equ	OAMDATA	$2104	;	OAM Data Write Register
.equ	BGMODE	$2105	;	BG Mode and Character Size Register
.equ	MOSAIC	$2106	;	Mosaic Register
.equ	BG1SC	$2107	;	BG Tilemap Address Registers (BG1)
.equ	BG2SC	$2108	;	BG Tilemap Address Registers (BG2)
.equ	BG3SC	$2109	;	BG Tilemap Address Registers (BG3)
.equ	BG3SC	$210A	;	BG Tilemap Address Registers (BG4)
.equ	BG12NBA	$210B	;	BG Character Address Registers (BG1&2)
.equ	BG34NBA	$210C	;	BG Character Address Registers (BG3&4)
.equ	BG1HOFS	$210D	;	BG Scroll Registers (BG1)
.equ	BG1VOFS	$210E	;	BG Scroll Registers (BG1)
.equ	BG2HOFS	$210F	;	BG Scroll Registers (BG2)
.equ	BG2VOFS	$2110	;	BG Scroll Registers (BG2)
.equ	BG3HOFS	$2111	;	BG Scroll Registers (BG3)
.equ	BG3VOFS	$2112	;	BG Scroll Registers (BG3)
.equ	BG4HOFS	$2113	;	BG Scroll Registers (BG4)
.equ	BG4VOFS	$2114	;	BG Scroll Registers (BG4)
.equ	VMAIN	$2115	;	Video Port Control Register
.equ	VMADDL	$2116	;	VRAM Address Registers (Low)
.equ	VMADDH	$2117	;	VRAM Address Registers (High)
.equ	VMDATAL	$2118	;	VRAM Data Write Registers (Low)
.equ	VMDATAH	$2119	;	VRAM Data Write Registers (High)
.equ	M7SEL	$211A	;	Mode 7 Settings Register
.equ	M7A	$211B	;	Mode 7 Matrix Registers
.equ	M7B	$211C	;	Mode 7 Matrix Registers
.equ	M7C	$211D	;	Mode 7 Matrix Registers
.equ	M7D	$211E	;	Mode 7 Matrix Registers
.equ	M7X	$211F	;	Mode 7 Matrix Registers
.equ	M7Y	$2120	;	Mode 7 Matrix Registers
.equ	CGADD	$2121	;	CGRAM Address Register
.equ	CGDATA	$2122	;	CGRAM Data Write Register
.equ	W12SEL	$2123	;	Window Mask Settings Registers
.equ	W34SEL	$2124	;	Window Mask Settings Registers
.equ	WOBJSEL	$2125	;	Window Mask Settings Registers
.equ	WH0	$2126	;	Window Position Registers (WH0)
.equ	WH1	$2127	;	Window Position Registers (WH1)
.equ	WH2	$2128	;	Window Position Registers (WH2)
.equ	WH3	$2129	;	Window Position Registers (WH3)
.equ	WBGLOG	$212A	;	Window Mask Logic registers (BG)
.equ	WOBJLOG	$212B	;	Window Mask Logic registers (OBJ)
.equ	TM	$212C	;	Screen Destination Registers
.equ	TS	$212D	;	Screen Destination Registers
.equ	TMW	$212E	;	Window Mask Destination Registers
.equ	TSW	$212F	;	Window Mask Destination Registers
.equ	CGWSEL	$2130	;	Color Math Registers
.equ	CGADSUB	$2131	;	Color Math Registers
.equ	COLDATA	$2132	;	Color Math Registers
.equ	SETINI	$2133	;	Screen Mode Select Register
.equ	MPYL	$2134	;	Multiplication Result Registers
.equ	MPYM	$2135	;	Multiplication Result Registers
.equ	MPYH	$2136	;	Multiplication Result Registers
.equ	SLHV	$2137	;	Software Latch Register
.equ	OAMDATAREAD	$2138	;	OAM Data Read Register
.equ	VMDATALREAD	$2139	;	VRAM Data Read Register (Low)
.equ	VMDATAHREAD	$213A	;	VRAM Data Read Register (High)
.equ	CGDATAREAD	$213B	;	CGRAM Data Read Register
.equ	OPHCT	$213C	;	Scanline Location Registers (Horizontal)
.equ	OPVCT	$213D	;	Scanline Location Registers (Vertical)
.equ	STAT77	$213E	;	PPU Status Register
.equ	STAT78	$213F	;	PPU Status Register
.equ	APUIO0	$2140	;	APU IO Registers
.equ	APUIO1	$2141	;	APU IO Registers
.equ	APUIO2	$2142	;	APU IO Registers
.equ	APUIO3	$2143	;	APU IO Registers
.equ	WMDATA	$2180	;	WRAM Data Register
.equ	WMADDL	$2181	;	WRAM Address Registers
.equ	WMADDM	$2182	;	WRAM Address Registers
.equ	WMADDH	$2183	;	WRAM Address Registers

.equ	JOYSER0	$4016	;	Old Style Joypad Registers
.equ	JOYSER1	$4017	;	Old Style Joypad Registers

.equ	NMITIMEN	$4200	;	Interrupt Enable Register
.equ	WRIO	$4201	;	IO Port Write Register
.equ	WRMPYA	$4202	;	Multiplicand Registers
.equ	WRMPYB	$4203	;	Multiplicand Registers
.equ	WRDIVL	$4204	;	Divisor & Dividend Registers
.equ	WRDIVH	$4205	;	Divisor & Dividend Registers
.equ	WRDIVB	$4206	;	Divisor & Dividend Registers
.equ	HTIMEL	$4207	;	IRQ Timer Registers (Horizontal - Low)
.equ	HTIMEH	$4208	;	IRQ Timer Registers (Horizontal - High)
.equ	VTIMEL	$4209	;	IRQ Timer Registers (Vertical - Low)
.equ	VTIMEH	$420A	;	IRQ Timer Registers (Vertical - High)
.equ	MDMAEN	$420B	;	DMA Enable Register
.equ	HDMAEN	$420C	;	HDMA Enable Register
.equ	MEMSEL	$420D	;	ROM Speed Register
.equ	RDNMI	$4210	;	Interrupt Flag Registers
.equ	TIMEUP	$4211	;	Interrupt Flag Registers
.equ	HVBJOY	$4212	;	PPU Status Register
.equ	RDIO	$4213	;	IO Port Read Register
.equ	RDDIVL	$4214	;	Multiplication Or Divide Result Registers (Low)
.equ	RDDIVH	$4215	;	Multiplication Or Divide Result Registers (High)
.equ	RDMPYL	$4216	;	Multiplication Or Divide Result Registers (Low)
.equ	RDMPYH	$4217	;	Multiplication Or Divide Result Registers (High)
.equ	JOY1L	$4218	;	Controller Port Data Registers (Pad 1 - Low)
.equ	JOY1H	$4219	;	Controller Port Data Registers (Pad 1 - High)
.equ	JOY2L	$421A	;	Controller Port Data Registers (Pad 2 - Low)
.equ	JOY2H	$421B	;	Controller Port Data Registers (Pad 2 - High)
.equ	JOY3L	$421C	;	Controller Port Data Registers (Pad 3 - Low)
.equ	JOY3H	$421D	;	Controller Port Data Registers (Pad 3 - High)
.equ	JOY4L	$421E	;	Controller Port Data Registers (Pad 4 - Low)
.equ	JOY4H	$421F	;	Controller Port Data Registers (Pad 4 - High)

.equ	DMAP0	$4300	;	DMA Control Register
.equ	BBAD0	$4301	;	DMA Destination Register
.equ	A1T0L	$4302	;	DMA Source Address Registers
.equ	A1T0H	$4303	;	DMA Source Address Registers
.equ	A1B0	$4304	;	DMA Source Address Registers
.equ	DAS0L	$4305	;	DMA Size Registers (Low)
.equ	DAS0H	$4306	;	DMA Size Registers (High)

;.equ	DMAPx	$43x0	;	DMA Control Register
;.equ	BBADx	$43x1	;	DMA Destination Register
;.equ	A1TxL	$43x2	;	DMA Source Address Registers
;.equ	A1TxH	$43x3	;	DMA Source Address Registers
;.equ	A1Bx	$43x4	;	DMA Source Address Registers
;.equ	DASxL	$43x5	;	DMA Size Registers (Low)
;.equ	DASxH	$43x6	;	DMA Size Registers (High)

;.equ	DMAPx	$43x0	;	HDMA Control Register
;.equ	BBADx	$43x1	;	HDMA Destination Register
;.equ	A1TxL	$43x2	;	HDMA Table Address Registers
;.equ	A1TxH	$43x3	;	HDMA Table Address Registers
;.equ	A1Bx	$43x4	;	HDMA Table Address Registers
;.equ	DASxL	$43x5	;	HDMA Indirect Address Registers
;.equ	DASxH	$43x6	;	HDMA Indirect Address Registers
;.equ	DASBx	$43x7	;	HDMA Indirect Address Registers
;.equ	A2AxL	$43x8	;	HDMA Mid Frame Table Address Registers (Low)
;.equ	A2AxH	$43x9	;	HDMA Mid Frame Table Address Registers (High)
;.equ	NTLRX	$43xA	;	HDMA Line Counter Register
