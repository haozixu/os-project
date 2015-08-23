/*
 *	include/util/spinlock.h
 *
 *	spinlocks
 */
#pragma once

#include <util/lock.hpp>

namespace utility {

class fifo_spinlock : public __lockable {
  private:
  	utility::atomic<int> val;
  	
  	union lock_value {
  		int v;
  		struct {
  			short owner, next;
		};
		
		lock_value(int i) { v = i; }
	};
	  
  public:
  	void reset() { val = 0;}
  	
  	fifo_spinlock { reset(); }
	
	bool is_locked() const noexcept
	{
		lock_value&& tmp = val.load();
		return tmp.owner != tmp.next;
	}
	
  	void lock() override noexcept
	{
		lock_value inc = val.fetch_add(1 << BITS_PER_WORD); // ++next
		while (likely(inc.owner != inc.next)) {
			relax_cpu();
			inc.owner = static_cast<short>(val); // owner
		}
	}
	
	void unlock() override noexcept
	{
		++val; // ++owner
	}
	
	void try_lock() override noexcept
	{
		if (this->is_locked())
			return false;
		val += (1 << BITS_PER_WORD);
		return true;
	}
};

}
