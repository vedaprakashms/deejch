;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module usb_descr
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InterfDescr
	.globl _SerDescr
	.globl _ProdDescr
	.globl _ManufDescr
	.globl _LangDescr
	.globl _ReportDescrLen
	.globl _ReportDescr
	.globl _CfgDescr
	.globl _DevDescr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_DevDescr:
	.db #0x12	; 18
	.db #0x01	; 1
	.byte #0x10, #0x01	; 272
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.byte #0xc0, #0x16	; 5824
	.byte #0xda, #0x27	; 10202
	.byte #0x00, #0x01	; 256
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.area CSEG    (CODE)
	.area CONST   (CODE)
_CfgDescr:
	.db #0x09	; 9
	.db #0x02	; 2
	.byte #0x22, #0x00	; 34
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x19	; 25
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x21	; 33
	.byte #0x11, #0x01	; 273
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x22	; 34
	.byte #0x34, #0x00	; 52
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.byte #0x08, #0x00	; 8
	.db #0x0a	; 10
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDescr:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x75	; 117	'u'
	.db #0x05	; 5
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x15	; 21
	.db #0x81	; 129
	.db #0x25	; 37
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xc0	; 192
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDescrLen:
	.db #0x34	; 52	'4'
	.area CSEG    (CODE)
	.area CONST   (CODE)
_LangDescr:
	.byte #0x04, #0x03	; 772
	.byte #0x09, #0x04	; 1033
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ManufDescr:
	.byte #0x18, #0x03	; 792
	.byte #0x77, #0x00	; 119
	.byte #0x61, #0x00	; 97
	.byte #0x67, #0x00	; 103
	.byte #0x69, #0x00	; 105
	.byte #0x6d, #0x00	; 109
	.byte #0x69, #0x00	; 105
	.byte #0x6e, #0x00	; 110
	.byte #0x61, #0x00	; 97
	.byte #0x74, #0x00	; 116
	.byte #0x6f, #0x00	; 111
	.byte #0x72, #0x00	; 114
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ProdDescr:
	.byte #0x1a, #0x03	; 794
	.byte #0x4d, #0x00	; 77
	.byte #0x6f, #0x00	; 111
	.byte #0x75, #0x00	; 117
	.byte #0x73, #0x00	; 115
	.byte #0x65, #0x00	; 101
	.byte #0x57, #0x00	; 87
	.byte #0x69, #0x00	; 105
	.byte #0x67, #0x00	; 103
	.byte #0x67, #0x00	; 103
	.byte #0x6c, #0x00	; 108
	.byte #0x65, #0x00	; 101
	.byte #0x72, #0x00	; 114
	.area CSEG    (CODE)
	.area CONST   (CODE)
_SerDescr:
	.byte #0x0e, #0x03	; 782
	.byte #0x43, #0x00	; 67
	.byte #0x48, #0x00	; 72
	.byte #0x35, #0x00	; 53
	.byte #0x35, #0x00	; 53
	.byte #0x32, #0x00	; 50
	.byte #0x45, #0x00	; 69
	.area CSEG    (CODE)
	.area CONST   (CODE)
_InterfDescr:
	.byte #0x14, #0x03	; 788
	.byte #0x48, #0x00	; 72
	.byte #0x49, #0x00	; 73
	.byte #0x44, #0x00	; 68
	.byte #0x2d, #0x00	; 45
	.byte #0x4d, #0x00	; 77
	.byte #0x6f, #0x00	; 111
	.byte #0x75, #0x00	; 117
	.byte #0x73, #0x00	; 115
	.byte #0x65, #0x00	; 101
	.area CSEG    (CODE)
	.area CABS    (ABS,CODE)
