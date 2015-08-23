/*
 *	kernel/icxxabi.cpp
 *
 *	the stuff about C++ ABI(Itanium), things about global constructing
 *	can be found in init.cpp
 *
 *	note: see http://wiki.osdev.org/C++ & section Global Objects 
 */

#define MAX_ATEXIT_FUNCTION_COUNT 16

extern "C" {

	struct atexit_function_entry {
		void (*destructor)(void *);
		void *object;
	};

	atexit_function_entry __atexit_functions[MAX_ATEXIT_FUNCTION_COUNT];
	unsigned int __atexit_function_count = 0;

	// void *__dso_handle = 0;

	int __cxa_atexit(void (*f)(void *), void *object, void *)
	{  // register a destructor function
		if (__atexit_function_count >= MAX_ATEXIT_FUNCTION_COUNT)
			return -1;

		__atexit_functions[__atexit_function_count++] =
         (atexit_function_entry) {f, object};

		return 0;
   }

	void __cxa_finalize(void *f)
	{
		unsigned int i = __atexit_function_count;
      
		if (!f) { // call all destructor functions
			while (i--) {
				if (__atexit_functions[i].destructor)
					(*__atexit_functions[i].destructor)(__atexit_functions[i].object);
				return;
			}
		}
      
		while (i--) { // call f as a destructor function
			if(__atexit_functions[i].destructor == f) {
				(*__atexit_functions[i].destructor)(__atexit_functions[i].object);
				__atexit_functions[i].destructor = nullptr;  
				// set the destructor to nullptr
			}
		}
	}

	void __cxa_pure_virtual()
	{
		;;;
	}
}
