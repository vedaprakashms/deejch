;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module usb_mouse
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HID_sendReport
	.globl _HID_report
	.globl _EP1_buffer
	.globl _EP0_buffer
	.globl _MOUSE_move_PARM_2
	.globl _MOUSE_press
	.globl _MOUSE_release
	.globl _MOUSE_move
	.globl _MOUSE_wheel
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
_MOUSE_move_PARM_2:
	.ds 1
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
_EP0_buffer	=	0x0000
_EP1_buffer	=	0x000a
_HID_report::
	.ds 4
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
;	src/usb_mouse.c:25: __xdata HID_MOUSE_REPORT_TYPE HID_report = {
	mov	dptr,#_HID_report
	clr	a
	movx	@dptr,a
	mov	dptr,#(_HID_report + 0x0001)
	movx	@dptr,a
	mov	dptr,#(_HID_report + 0x0002)
	movx	@dptr,a
	mov	dptr,#(_HID_report + 0x0003)
	movx	@dptr,a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'MOUSE_press'
;------------------------------------------------------------
;buttons       Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_mouse.c:37: void MOUSE_press(uint8_t buttons) {
;	-----------------------------------------
;	 function MOUSE_press
;	-----------------------------------------
_MOUSE_press:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7, dpl
;	src/usb_mouse.c:38: MOUSE_report->buttons |= buttons;   // press button(s)
	mov	dptr,#_HID_report
	movx	a,@dptr
	orl	ar7,a
	mov	dptr,#_HID_report
	mov	a,r7
	movx	@dptr,a
;	src/usb_mouse.c:39: MOUSE_sendReport();                 // send HID report
	mov	_HID_sendReport_PARM_2,#0x04
	mov	dptr,#_HID_report
;	src/usb_mouse.c:40: }
	ljmp	_HID_sendReport
;------------------------------------------------------------
;Allocation info for local variables in function 'MOUSE_release'
;------------------------------------------------------------
;buttons       Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_mouse.c:43: void MOUSE_release(uint8_t buttons) {
;	-----------------------------------------
;	 function MOUSE_release
;	-----------------------------------------
_MOUSE_release:
	mov	r7, dpl
;	src/usb_mouse.c:44: MOUSE_report->buttons &= ~buttons;  // release button(s)
	mov	dptr,#_HID_report
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	cpl	a
	anl	ar6,a
	mov	dptr,#_HID_report
	mov	a,r6
	movx	@dptr,a
;	src/usb_mouse.c:45: MOUSE_sendReport();                 // send HID report
	mov	_HID_sendReport_PARM_2,#0x04
	mov	dptr,#_HID_report
;	src/usb_mouse.c:46: }
	ljmp	_HID_sendReport
;------------------------------------------------------------
;Allocation info for local variables in function 'MOUSE_move'
;------------------------------------------------------------
;yrel          Allocated with name '_MOUSE_move_PARM_2'
;xrel          Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_mouse.c:49: void MOUSE_move(int8_t xrel, int8_t yrel) {
;	-----------------------------------------
;	 function MOUSE_move
;	-----------------------------------------
_MOUSE_move:
	mov	r7, dpl
;	src/usb_mouse.c:50: MOUSE_report->xmove = xrel;         // set relative x-movement
	mov	dptr,#(_HID_report + 0x0001)
	mov	a,r7
	movx	@dptr,a
;	src/usb_mouse.c:51: MOUSE_report->ymove = yrel;         // set relative y-movement
	mov	dptr,#(_HID_report + 0x0002)
	mov	a,_MOUSE_move_PARM_2
	movx	@dptr,a
;	src/usb_mouse.c:52: MOUSE_sendReport();                 // send HID report
	mov	_HID_sendReport_PARM_2,#0x04
	mov	dptr,#_HID_report
	lcall	_HID_sendReport
;	src/usb_mouse.c:53: MOUSE_report->xmove = 0;            // reset movements
	mov	dptr,#(_HID_report + 0x0001)
	clr	a
	movx	@dptr,a
;	src/usb_mouse.c:54: MOUSE_report->ymove = 0;
	mov	dptr,#(_HID_report + 0x0002)
	movx	@dptr,a
;	src/usb_mouse.c:55: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'MOUSE_wheel'
;------------------------------------------------------------
;rel           Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_mouse.c:58: void MOUSE_wheel(int8_t rel) {
;	-----------------------------------------
;	 function MOUSE_wheel
;	-----------------------------------------
_MOUSE_wheel:
	mov	r7, dpl
;	src/usb_mouse.c:59: MOUSE_report->wmove = rel;          // set relative wheel movement
	mov	dptr,#(_HID_report + 0x0003)
	mov	a,r7
	movx	@dptr,a
;	src/usb_mouse.c:60: MOUSE_sendReport();                 // send HID report
	mov	_HID_sendReport_PARM_2,#0x04
	mov	dptr,#_HID_report
	lcall	_HID_sendReport
;	src/usb_mouse.c:61: MOUSE_report->wmove = 0;            // reset movements
	mov	dptr,#(_HID_report + 0x0003)
	clr	a
	movx	@dptr,a
;	src/usb_mouse.c:62: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CABS    (ABS,CODE)
