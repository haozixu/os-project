/*
 *	arch/x86_64/include/serial.hpp
 *
 *	about serial port
 */
#pragma once
 
#include <stdint.h>
#include <asm/io.hpp>
#include <asm/misc.hpp>
#include <firmware/bios.hpp>

namespace ARCH {

namespace serial {
  	constexpr uint16_t COM1 = 0x3f8;
	constexpr uint16_t COM2 = 0x2f8;
}

template<uint16_t port_addr>
struct serial_port {
  public:
	/* COM1: 0x3f8
	 * COM2: 0x2f8
	 * COM3 & COM4's port number are not sure.(maybe 0x3e8 & 0x2e8)
	 * Use static member function serial_port::get_com_port_address(int n) 
	 * to get the exact port address.
	 */ 
  	void init()
	{
		uint16_t port = port_addr;
		outb(port + 1, 0x00);    // Disable all interrupts
		outb(port + 3, 0x80);    // Enable DLAB (set baud rate divisor)
		outb(port + 0, 0x03);    // Set divisor to 3 (low byte) 38400 baud
		outb(port + 1, 0x00);    //                  (high byte)
		outb(port + 3, 0x03);    // 8 bits, no parity, one stop bit
		outb(port + 2, 0xC7);    // Enable FIFO, clear them, with 14-byte threshold
		// outb(port + 4, 0x0B);    // IRQs enabled, RTS/DSR set
		// note: should we have IRQs enabled?
	}
	
	serial_port() {}
	
	constexpr uint16_t port() const
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
		while (!recieved()) {
			io_delay();
		}
		return inb(port_addr);
	}
	
	bool transimit_is_empty() const
	{
		return inb(port_addr + 5) & 0x20;
	}
	
	void write(const char data)
	{
		while (!transimit_is_empty()) {
			io_delay();
		}
		outb(port_addr, data);
	}
	
	void write(const char* data)
	{
		char c;
		unsigned i = 0;
		while (c = data[i++]) {
			write(c);
		//	if (c == '\n')
		//		write('\r');
		}
	}
	
	/*
	 *	return 0 if the port doesn't exist.
	 */
	static uint16_t get_com_port_address(unsigned n) // n: 1 .. 4
	{
		if (n > 4)
			return 0;
		return bda->com_port_addr[n];
	}
};

}