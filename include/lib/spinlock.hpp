/**
 *	@file include/lib/spinlock.hpp
 *
 *	@brief fifo spinlock
 */
#pragma once

#include <lib/lock.hpp>
#include <lib/atomic.hpp>
#include <arch/asm/misc.hpp>

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
	
  	void lock() noexcept
	{
		unsigned int val = next++;
		while (val != owner) {
			ARCH::relax_cpu();
		}
	}
	
	void unlock() noexcept
	{
		++owner;
	}
	
	bool try_lock() noexcept
	{
		unsigned int new_next = next + 1;
		unsigned int owner_val = owner.load();
		return next.compare_exchange_strong(owner_val, new_next);
	}
};

using spinlock = fifo_spinlock;

}
