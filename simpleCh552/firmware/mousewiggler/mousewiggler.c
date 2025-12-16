// ===================================================================================
// Project:   Mouse Wiggler for CH551, CH552 and CH554
// Version:   v1.1
// Year:      2023
// Author:    Stefan Wagner
// Github:    https://github.com/wagiminator
// EasyEDA:   https://easyeda.com/wagiminator
// License:   http://creativecommons.org/licenses/by-sa/3.0/
// ===================================================================================
//
// Description:
// ------------
// Mouse Wiggler is a tool that simulates movements of the mouse pointer so that 
// no screen saver is activated and the PC or notebook is not put to sleep. The
// mouse pointer movements are imperceptibly small, so that you can continue to
// work normally on your PC even with the function activated.
//
// References:
// -----------
// - Blinkinlabs: https://github.com/Blinkinlabs/ch554_sdcc
// - Deqing Sun: https://github.com/DeqingSun/ch55xduino
// - Ralph Doncaster: https://github.com/nerdralph/ch554_sdcc
// - WCH Nanjing Qinheng Microelectronics: http://wch.cn
//
// Compilation Instructions:
// -------------------------
// - Chip:  CH551, CH552 or CH554
// - Clock: 16 MHz internal
// - Adjust the firmware parameters in src/config.h if necessary.
// - Make sure SDCC toolchain and Python3 with PyUSB is installed.
// - Press BOOT button on the board and keep it pressed while connecting it via USB
//   with your PC.
// - Run 'make flash' immediatly afterwards.
// - To compile the firmware using the Arduino IDE, follow the instructions in the 
//   .ino file.
//
// Operating Instructions:
// -----------------------
// - Connect the board via USB to your PC. It should be detected as a HID mouse.
// - Activate/deactivate the wiggle function by pressing the touchkey. The NeoPixel
//   lights up when the function is activated.


// ===================================================================================
// Libraries, Definitions and Macros
// ===================================================================================

// Libraries
#include "src/system.h"                   // system functions
#include "src/touch.h"                    // touchkey functions
#include "src/neo.h"                      // NeoPixel functions
#include "src/usb_mouse.h"                // USB HID mouse functions

// Prototypes for used interrupts
void USB_interrupt(void);
void USB_ISR(void) __interrupt(INT_NO_USB) {
  USB_interrupt();
}


volatile uint16_t counter;
__bit activated = 1;                    // wiggling activated flag
__bit toggle = 0;                       // toggle flag for mouse movement direction
volatile uint16_t timer_count = 0;
#define TIMER_500MS 30   // 500ms interval

// Add timer interrupt handler
void timer0_isr(void) __interrupt(1) {
  timer_count++;
}

// ===================================================================================
// Main Function
// ===================================================================================
void main(void) {
  
  
  // Setup
  CLK_config();                           // configure system clock
  DLY_ms(10);                             // wait for clock to settle
  MOUSE_init();                           // init USB HID mouse
  DLY_ms(500);                            // wait for Windows
  TOUCH_enable();                        // enable touchkey function
  TOUCH_channel(PIN_TOUCH);           // configure touchkey pin
  TOUCH_start(PIN_TOUCH);            // set touchkey pin as input
  PIN_output(PIN_NEO);              // set NeoPixel pin as output

  // EA = 1; // global interrupt enable
  // ET0 = 1; // enable timer0 interrupt
  // TMOD |= bT0_M0; // timing, not counting, mode 1 (counts to 0xFFFF - TLTH)
  // TR0 = 1; // start the timer

  // Timer0 setup
  TMOD = 0x01;    // Timer0 mode 1 (16-bit)
  TH0 = (65536-1000) >> 8;    // 1ms interval at 16MHz
  TL0 = (65536-1000) & 0xFF;
  ET0 = 1;        // Enable Timer0 interrupt
  TR0 = 1;        // Start Timer0
  EA = 1;         // Enable global interrupts

  // Loop
  while(1) {

    if(activated) {
      PIN_write(PIN_NEO, 1);           // turn on NeoPixel
      
      if(timer_count == TIMER_500MS) {
        if(toggle) {
          MOUSE_move(3, 0);           // move mouse pointer just a tiny bit
          toggle =!toggle;
        } else {
          MOUSE_move(-3, 0);          // move pointer back
          toggle =!toggle;
        }
        timer_count = 0;               // reset timer
      }
    }
    if(!activated) {                // wiggling function deactivated?
        PIN_write(PIN_NEO,0);         // turn off NeoPixel
        timer_count = 0;  
      }

    if(TOUCH_pressed(PIN_TOUCH)) {     // touchkey pressed?
      activated = !activated;          // toggle activated flag
      
    }

  }
}
