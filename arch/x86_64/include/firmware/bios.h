/*
 *	arch/x86_64/include/firmware/bios.h 
 *
 *	...
 */
#pragma once

#include <stdint.h>
#include <compiler.h>
#include <kernel/paging.h>

struct __bios_data_area {
	// note: see www.bioscentral.com/misc/bda.htm
	// note: reserved means the that field is varies in different BIOSes
	uint16_t com_port_addr[4]; // COM1 ~ COM4 serial port address (see INT 0x14)
	uint16_t lpt_port_addr[3]; // LPT1 ~ LPT3 parallel port address (see INT 0x17)
	union {
		uint16_t lpt4_port_addr; // LPT4: rare, only appears in PC/XT systems
		uint16_t ebda_segment;   // EBDA: usually, EBDA base address >> 4
	}__packed;
	uint16_t equipment_flags; // indicates installed devices(COM, LPT, floppy, video mode etc) (see INT 0x11)
	uint8_t reserved0;
	uint16_t memory_size_in_kb; // see INT 0x12
	uint16_t reserved1;
	uint8_t kbd_shift_flags1; // keyboard shift key flags (see INT 0x16)
	uint8_t kbd_shift_flags2; // the same
	uint8_t alt_numpad_area; // ? see INT 9
	uint16_t p_next_char_in_kbd_buf; // see INT 0x16
	uint16_t p_last_char_in_kbd_buf; // see INT 0x16
	uint8_t keyboard_buffer[32];
	
	// ...
	uint8_t display_mode;
	uint16_t nr_columns_in_text_mode;
	uint16_t base_video_port;
	uint16_t ticks_since_boot;
	uint8_t nr_disks;
	uint16_t kbd_buf_start;
	uint16_t kdb_buf_end;
	uint8_t kdb_led_state;
}__packed; // 256 bytes

const __bios_data_area* const bios_data_area = reinterpret_cast<decltype(bios_data_area)>(0x400 + PAGE_OFFSET);