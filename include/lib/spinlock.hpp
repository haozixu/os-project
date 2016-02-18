/*
 *	include/lib/spinlock.hpp
 *
 *	spinlocks
 */
#pragma once

#include <lib/lock.hpp>
#include <lib/atomic.hpp>
#include <asm/misc.hpp>
#include <bitwidth.h>

namespace lib {

class fifo_spinlock final : public lib::__lockable {
  private:
  	atomic<unsigned int> owner, next;
	  
  public:
	fifo_spinlock() : owner(0), next(0) {}
	
	bool is_locked() const noexcept
	{
		return owner.load() != next.load();
	}
	
  	void lock() noexcept override
	{
		unsigned int val = next++;
		while (val != owner) {
			ARCH::relax_cpu();
		}
	}
	
	void unlock() noexcept override
	{
		++owner;
	}
	
	bool try_lock() noexcept override
	{
		unsigned int new_next = next + 1;
		unsigned int owner_val = owner.load();
		return next.compare_exchange_strong(owner_val, new_next);
	}
};

using spinlock = fifo_spinlock;

}
