/**
 *	@file arch/x86_64/kernel/apic.hpp
 *
 *	@brief xAPIC related stuff.(Advanced Programmable Interrupt Controller)
 */
#include <interrupt/apic.hpp>
 
#include <memory/address.hpp>
#include <kernel/logging.hpp>
 
namespace ARCH 
{

void APIC::init()
{
	using kernel::debug::logfl;
	
	unsigned long __base = base();
	this->enable();
	logfl("Local APIC [%s id: 0x%x] physical base: %p",
		is_bsp() ? "BSP" : "AP",
		initial_id(),
		__base);
	base_addr = va(__base);	
}

}