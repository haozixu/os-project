/*
 *	arch/x86_64/include/serial.hpp
 *
 *	about serial port
 */
#pragma once
 
#include <stdint.h>
#include <asm/io.h>
#include <asm/misc.h>
#include <firmware/bios.h>

class serial_port {
  public:
  	const uint16_t COM1 = 0x3f8;
	const uint16_t COM2 = 0x2f8;
  	/* ctor: @port: I/O port number
	 * COM1: 0x3f8
	 * COM2: 0x2f8
	 * COM3 & COM4's port number are not sure.(maybe 0x3e8 & 0x2e8)
	 * Use static member function serial_port::get_com_port_address(int n) 
	 * to get the exact port address.
	 */ 
  	serial_port(uint16_t port)
	{
		port_addr = port;
		outb(port + 1, 0x00);    // Disable all interrupts
		outb(port + 3, 0x80);    // Enable DLAB (set baud rate divisor)
		outb(port + 0, 0x03);    // Set divisor to 3 (low byte) 38400 baud
		outb(port + 1, 0x00);    //                  (high byte)
		outb(port + 3, 0x03);    // 8 bits, no parity, one stop bit
		outb(port + 2, 0xC7);    // Enable FIFO, clear them, with 14-byte threshold
		outb(port + 4, 0x0B);    // IRQs enabled, RTS/DSR set
		// note: should we have IRQs enabled?
	}
	
	serial_port() {}
	
	uint16_t port() const
	{
		return port_addr;
	}
	
	bool recieved() const
	{
		return inb(port_addr + 5) & 1;
	}
	
	// note: synchronized
	// will be blocked until the data is recieved
	char read() const
	{
		while (!recieved())
			pause(); // polling
		return inb(port_addr);
	}
	
	bool transimit_is_empty() const
	{
		return inb(port_addr + 5) & 0x20;
	}
	
	void write(char data)
	{
		while (!transimit_is_empty())
			pause(); // polling
		outb(port_addr, data)
	}
	
	void write(char* data)
	{
		char c;
		unsigned i = 0;
		while (c = data[i++]) {
			write(c);
			if (c == '\n')
				write('\r');
		}
	}
	
	/*
	 *	return 0 if the port doesn't exist.
	 */
	static uint16_t get_com_port_address(unsigned n) // n: 1 .. 4
	{
		if (port > 4)
			return 0;
		return bios_data_area->com_port_addr[n];
	}
  private:
  	uint16_t port_addr;
};
