/*
 *	include/util/lock.hpp
 *	
 *	lock interface
 */
#pragma once

#include <compiler.h>
#include <atomic.hpp>
#include <bitwidth.h>

#define relax_cpu() __asm__ __volatile__("pause")
// should be remove from here later

namespace utility {

struct __lockable {
	typedef __lockable self;
	
	__lockable() = default;
	__lockable(const self&) = delete; // copy ctor
	__lockable(self&&) = default; // move ctor
	
	self& operator=(const self&) noexcept = delete;
	self& operator=(self&&) noexcept = default;
	
	virtual void lock() noexcept = 0;
	virtual void unlock() noexcept = 0;
	virtual bool try_lock() noexcept = 0;
};

template<typename Lock>
class locker {
	Lock& lock;
	
  public:
  	explicit locker(Lock& _lock) noexcept
  	{
  		_lock.lock();
  		this->lock = _lock;
	}
	
	locker(const Lock&) noexcept = delete;
	
	~locker()
	{
		lock->unlock();
	}
};

class fifo_spinlock: public __lockable {
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

