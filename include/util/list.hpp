/*
 *	include/util/list.hpp
 *
 *	linked-list
 */
#pragma once

#include <stddef.h>

namespace utility {

struct list {
	list* next;
	list* prev;

	list()
	{
		next = prev = this;
	}

	enum init_value {
		NO_INIT
	};

	list(init_value iv) {} // empty

	bool is_empty() const;
	bool is_last(list&) const;
	bool is_singular() const;

	void insert(list&);
	void insert_front(list&);
	void remove();
	void replace(list&);
	void move(list&);
	void move_front(list&);
	
	typedef struct list_iterator iterator;
	iterator begin();
	iterator end();
	
	template<typename Function>
	void foreach(Function f);
	
	template<typename T, size_t offset>
	T& container(); // note: unsafe

	static void init(list*);
};

// list iterator
struct list_iterator {
	typedef list_iterator self;
	
	list* p;
	
	list_iterator(list* x) : p(x) {}
	list_iterator() {}
	list_iterator(const self& x) : p(x.p) {}
	
	bool operator==(const self& x) { return this->p == x.p; }
	bool operator!=(const self& x) { return this->p != x.p; }
	
	list operator*() { return *p; }
	list* operator->() { return p; }
	
	self& operator++()
	{
		p = p->next;
		return *this;
	}
	
	self operator++(int)
	{
		self tmp = *this;
		++*this;
		return tmp;
	}
	
	self& operator--()
	{
		p = p->prev;
		return *this;
	}
	
	self operator--(int)
	{
		self tmp = *this;
		--*this;
		return tmp;
	}	
};

static inline void __list_insert(list* newl, list* prev, list* next)
{
	next->prev = newl;
	newl->next = next;
	newl->prev = prev;
	prev->next = newl;
}

static inline void __list_remove(list* prev, list* next)
{
	next->prev = prev;
	prev->next = next;
}

inline void list::init(list* plist)
{
	plist->next = plist;
	plist->prev = plist;
}

inline bool list::is_empty() const
{
	return this->next == this;
}

inline bool list::is_last(list& _list) const
{
	return _list.next == this;
}

inline bool list::is_singular() const
{
	return !this->is_empty() && (this->next == this->prev);
}

inline void list::insert(list& newl)
{
	__list_insert(&newl, this, this->next);
}

inline void list::insert_front(list& newl)
{
	__list_insert(&newl, this->prev, this);
}

inline void list::remove()
{
	__list_remove(this->prev, this->next);
	list::init(this);
}

inline void list::replace(list& newl)
{
	newl.next = this->next;
	newl.next->prev = &newl;
	newl.prev = this->prev;
	newl.prev->next = &newl;
	list::init(this);
}

inline void list::move(list& _list)
{
	__list_remove(this->prev, this->next);
	_list.insert(*this);
}

inline void list::move_front(list& _list)
{
	__list_remove(this->prev, this->next);
	_list.insert_front(*this);
}

inline typename list::iterator list::begin()
{
	return next;
}

inline typename list::iterator list::end()
{
	return this;
}

template<typename Function>
inline void list::foreach(Function f)
{
	auto i = list_iterator(this);
	do {
		f(i++);
	} while (i != list_iterator(this));
}

// e.g. list.container<container_type, offsetof(container_type, list_member)>();
template<typename T, size_t offset>
inline T& list::container()
{
	char* tmp = const_cast<char*>(reinterpret_cast<const char*>(this));
	tmp -= offset;
	return static_cast<T&>(*reinterpret_cast<T*>(tmp));
}

}

