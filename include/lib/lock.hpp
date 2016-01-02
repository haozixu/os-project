/*
 *	include/util/lock.hpp
 *	
 *	lock interface
 */
#pragma once

namespace lib {

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
	locker(const locker&) noexcept = delete;
	
	~locker()
	{
		lock->unlock();
	}
};

}
