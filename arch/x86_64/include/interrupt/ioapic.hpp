/*
 *	arch/x86_64/include/interrupt/ioapic.hpp
 *
 *	IO APIC related operations
 */
#pragma once

namespace ARCH {

struct IO_APIC {
  public:
  	IO_APIC(const IO_APIC&) = delete;
	IO_APIC(IO_APIC&&) = default;
	
	static IO_APIC& instance()
	{
		static IO_APIC __io_apic;
		return __io_apic;
	}
  
	unsigned long base() const
	{
		return physical_base;
	}
	
	void set_base(unsigned long pbase)
	{
		physical_base = pbase;
	}
	
	void init()
	{
		// TODO: add initialization code
	}
	
	static constexpr unsigned long default_base = 0xfec00000;
  private:
  	IO_APIC() {}
  	unsigned long physical_base;		
};
	
extern IO_APIC &io_apic;

}
