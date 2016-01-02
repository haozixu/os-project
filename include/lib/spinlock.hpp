/*
 *	include/lib/spinlock.hpp
 *
 *	spinlocks
 */
#pragma once

#include <lib/lock.hpp>
#include <lib/atomic.hpp>
#include <arch/generic-asm.hpp>
#include <bitwidth.h>

namespace lib {

class fifo_spinlock final : public lib::__lockable {
  private:
  	atomic<int> val;
  	
  	union lock_value {
  		int v;
  		struct {
  			short owner, next;
		};
		
		lock_value(int i) { v = i; }
	};
	  
  public:
  	void reset() { val = 0;}
  	
  	fifo_spinlock() { reset(); }
	
	bool is_locked() const noexcept
	{
		lock_value&& tmp = val.load();
		return tmp.owner != tmp.next;
	}
	
  	void lock() noexcept override
	{
		lock_value inc = val.fetch_add(1 << BITS_PER_WORD); // ++next
		while (inc.owner != inc.next) {
			arch::relax_cpu();
			inc.owner = static_cast<short>(val); // owner
		}
	}
	
	void unlock() noexcept override
	{
		++val; // ++owner
	}
	
	bool try_lock() noexcept override
	{
		if (this->is_locked())
			return false;
		val += (1 << BITS_PER_WORD);
		return true;
	}
};

using spinlock = fifo_spinlock;

}
