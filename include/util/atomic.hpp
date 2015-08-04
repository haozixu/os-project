/*
 *	include/util/atomic.hpp
 *
 *	atomic operations
 */
#pragma once

#include <stdint.h>
#include <stddef.h>

namespace utility {

typedef enum memory_order {
    memory_order_relaxed,
    memory_order_consume,
    memory_order_acquire,
    memory_order_release,
    memory_order_acq_rel,
    memory_order_seq_cst
} memory_order;

enum __memory_order_modifier {
    __memory_order_mask = 0x0ffff,
    __memory_order_modifier_mask = 0xffff0000,
    __memory_order_hle_acquire = 0x10000,
    __memory_order_hle_release = 0x20000
};

constexpr memory_order operator|(memory_order m,
                                 __memory_order_modifier mod) {
    return memory_order(m | int(mod));
}

constexpr memory_order operator&(memory_order m,
                                 __memory_order_modifier mod) {
    return memory_order(m & int(mod));
}

constexpr memory_order cmpexch_failure_order2(memory_order m) noexcept {
    return m == memory_order_acq_rel
               ? memory_order_acquire
               : m == memory_order_release ? memory_order_relaxed : m;
}

constexpr memory_order cmpexch_failure_order(memory_order m) noexcept {
    return memory_order(cmpexch_failure_order2(m & __memory_order_mask) |
                        (m & __memory_order_modifier_mask));
}

inline void atomic_thread_fence(memory_order m) noexcept {
    __atomic_thread_fence(m);
}

inline void atomic_signal_fence(memory_order m) noexcept {
    __atomic_signal_fence(m);
}

template <typename T> inline T kill_dependency(T y) noexcept {
    T ret(y);
    return ret;
}

template <typename IntType> struct atomic_base;

typedef atomic_base<char> atomic_char;

typedef atomic_base<signed char> atomic_schar;

typedef atomic_base<unsigned char> atomic_uchar;

typedef atomic_base<short> atomic_short;

typedef atomic_base<unsigned short> atomic_ushort;

typedef atomic_base<int> atomic_int;

typedef atomic_base<unsigned int> atomic_uint;

typedef atomic_base<long> atomic_long;

typedef atomic_base<unsigned long> atomic_ulong;

typedef atomic_base<long long> atomic_llong;

typedef atomic_base<unsigned long long> atomic_ullong;

typedef atomic_base<wchar_t> atomic_wchar_t;

typedef atomic_base<char16_t> atomic_char16_t;

typedef atomic_base<char32_t> atomic_char32_t;

typedef atomic_base<char32_t> atomic_char32_t;

typedef atomic_base<int_least8_t> atomic_int_least8_t;

typedef atomic_base<uint_least8_t> atomic_uint_least8_t;

typedef atomic_base<int_least16_t> atomic_int_least16_t;

typedef atomic_base<uint_least16_t> atomic_uint_least16_t;

typedef atomic_base<int_least32_t> atomic_int_least32_t;

typedef atomic_base<uint_least32_t> atomic_uint_least32_t;

typedef atomic_base<int_least64_t> atomic_int_least64_t;

typedef atomic_base<uint_least64_t> atomic_uint_least64_t;

typedef atomic_base<int_fast8_t> atomic_int_fast8_t;

typedef atomic_base<uint_fast8_t> atomic_uint_fast8_t;

typedef atomic_base<int_fast16_t> atomic_int_fast16_t;

typedef atomic_base<uint_fast16_t> atomic_uint_fast16_t;

typedef atomic_base<int_fast32_t> atomic_int_fast32_t;

typedef atomic_base<uint_fast32_t> atomic_uint_fast32_t;

typedef atomic_base<int_fast64_t> atomic_int_fast64_t;

typedef atomic_base<uint_fast64_t> atomic_uint_fast64_t;

typedef atomic_base<intptr_t> atomic_intptr_t;

typedef atomic_base<uintptr_t> atomic_uintptr_t;

typedef atomic_base<size_t> atomic_size_t;

typedef atomic_base<intmax_t> atomic_intmax_t;

typedef atomic_base<uintmax_t> atomic_uintmax_t;

typedef atomic_base<ptrdiff_t> atomic_ptrdiff_t;

template <typename T> struct atomic;

template <typename T> struct atomic<T*>;

typedef bool atomic_flag_data_type;

extern "C" {
struct atomic_flag_base {
    atomic_flag_data_type _M_i;
};
}

struct atomic_flag : public atomic_flag_base {
    atomic_flag() noexcept = default;
    ~atomic_flag() noexcept = default;
    atomic_flag(const atomic_flag&) = delete;
    atomic_flag& operator=(const atomic_flag&) = delete;
    atomic_flag& operator=(const atomic_flag&) volatile = delete;

    constexpr atomic_flag(bool i) noexcept
        : atomic_flag_base{_S_init(i)} {}

    bool test_and_set(memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_test_and_set(&_M_i, m);
    }

    bool
    test_and_set(memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_test_and_set(&_M_i, m);
    }

    void clear(memory_order m = memory_order_seq_cst) noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;
        ;
        __atomic_clear(&_M_i, m);
    }

    void clear(memory_order m = memory_order_seq_cst) volatile noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;
        ;
        __atomic_clear(&_M_i, m);
    }

  private:
    static constexpr atomic_flag_data_type _S_init(bool i) {
        return i ? 1 : 0;
    }
};

template <typename IntType>

struct atomic_base {
  private:
    typedef IntType int_type;

    int_type _M_i;

  public:
    atomic_base() noexcept = default;
    ~atomic_base() noexcept = default;
    atomic_base(const atomic_base&) = delete;
    atomic_base& operator=(const atomic_base&) = delete;
    atomic_base& operator=(const atomic_base&) volatile = delete;

    constexpr atomic_base(int_type i) noexcept : _M_i(i) {}

    operator int_type() const noexcept { return load(); }

    operator int_type() const volatile noexcept { return load(); }

    int_type operator=(int_type i) noexcept {
        store(i);
        return i;
    }

    int_type operator=(int_type i) volatile noexcept {
        store(i);
        return i;
    }

    int_type operator++(int) noexcept { return fetch_add(1); }

    int_type operator++(int) volatile noexcept { return fetch_add(1); }

    int_type operator--(int) noexcept { return fetch_sub(1); }

    int_type operator--(int) volatile noexcept { return fetch_sub(1); }

    int_type operator++() noexcept {
        return __atomic_add_fetch(&_M_i, 1, memory_order_seq_cst);
    }

    int_type operator++() volatile noexcept {
        return __atomic_add_fetch(&_M_i, 1, memory_order_seq_cst);
    }

    int_type operator--() noexcept {
        return __atomic_sub_fetch(&_M_i, 1, memory_order_seq_cst);
    }

    int_type operator--() volatile noexcept {
        return atomic_sub_fetch(&_M_i, 1, memory_order_seq_cst);
    }

    int_type operator+=(int_type i) noexcept {
        return atomic_add_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator+=(int_type i) volatile noexcept {
        return __atomic_add_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator-=(int_type i) noexcept {
        return __atomic_sub_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator-=(int_type i) volatile noexcept {
        return __atomic_sub_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator&=(int_type i) noexcept {
        return __atomic_and_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator&=(int_type i) volatile noexcept {
        return __atomic_and_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator|=(int_type i) noexcept {
        return __atomic_or_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator|=(int_type i) volatile noexcept {
        return __atomic_or_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator^=(int_type i) noexcept {
        return __atomic_xor_fetch(&_M_i, i, memory_order_seq_cst);
    }

    int_type operator^=(int_type i) volatile noexcept {
        return __atomic_xor_fetch(&_M_i, i, memory_order_seq_cst);
    }

    bool is_lock_free() const noexcept {
        return __atomic_is_lock_free(sizeof(_M_i), nullptr);
    }

    bool is_lock_free() const volatile noexcept {
        return __atomic_is_lock_free(sizeof(_M_i), nullptr);
    }

    void store(int_type i,
/*
 * 	init.h
 *
 * 	should this file become a part of compiler.h or standalone kernel/init.h ?
 */
#pragma once

typedef int (*initcall_t)(void);
typedef void (*constructor_t)(void);

#define __init __attribute__((section(".init.text"))
#define __initdata __attribute__((section(".init.data")
#define __ctor __attribute__((constructor))

#define __initcall __attribute__((section(".init.text"), constructor))

#define register_initcall(level, f) \
		static initcall_t __initcall_##f \
		__attribute__((used, section(".initcall" level)) = f
               memory_order m = memory_order_seq_cst) noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;
        ;

        __atomic_store_n(&_M_i, i, m);
    }

    void store(int_type i,
               memory_order m = memory_order_seq_cst) volatile noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;
        ;

        __atomic_store_n(&_M_i, i, m);
    }

    int_type load(memory_order m = memory_order_seq_cst) const noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;

        return __atomic_load_n(&_M_i, m);
    }

    int_type load(memory_order m = memory_order_seq_cst) const
        volatile noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;

        return __atomic_load_n(&_M_i, m);
    }

    int_type exchange(int_type i,
                        memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_exchange_n(&_M_i, i, m);
    }

    int_type
    exchange(int_type i,
             memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_exchange_n(&_M_i, i, m);
    }

    bool compare_exchange_weak(int_type &i1, int_type i2,
                               memory_order m1, memory_order m2) noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;
        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_i, &i1, i2, 1, m1, m2);
    }

    bool compare_exchange_weak(int_type &i1, int_type i2,
                               memory_order m1,
                               memory_order m2) volatile noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;
        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_i, &i1, i2, 1, m1, m2);
    }

    bool
    compare_exchange_weak(int_type &i1, int_type i2,
                          memory_order m = memory_order_seq_cst) noexcept {
        return compare_exchange_weak(i1, i2, m,
                                     cmpexch_failure_order(m));
    }

    bool compare_exchange_weak(
        int_type &i1, int_type i2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return compare_exchange_weak(i1, i2, m,
                                     cmpexch_failure_order(m));
    }

    bool compare_exchange_strong(int_type &i1, int_type i2,
                                 memory_order m1,
                                 memory_order m2) noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;
        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_i, &i1, i2, 0, m1, m2);
    }

    bool compare_exchange_strong(int_type &i1, int_type i2,
                                 memory_order m1,
                                 memory_order m2) volatile noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;

        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_i, &i1, i2, 0, m1, m2);
    }

    bool
    compare_exchange_strong(int_type &i1, int_type i2,
                            memory_order m = memory_order_seq_cst) noexcept {
        return compare_exchange_strong(i1, i2, m,
                                       cmpexch_failure_order(m));
    }

    bool compare_exchange_strong(
        int_type &i1, int_type i2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return compare_exchange_strong(i1, i2, m,
                                       cmpexch_failure_order(m));
    }

    int_type fetch_add(int_type i,
                         memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_add(&_M_i, i, m);
    }

    int_type
    fetch_add(int_type i,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_add(&_M_i, i, m);
    }

    int_type fetch_sub(int_type i,
                         memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_sub(&_M_i, i, m);
    }

    int_type
    fetch_sub(int_type i,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_sub(&_M_i, i, m);
    }

    int_type fetch_and(int_type i,
                         memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_and(&_M_i, i, m);
    }

    int_type
    fetch_and(int_type i,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_and(&_M_i, i, m);
    }

    int_type fetch_or(int_type i,
                        memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_or(&_M_i, i, m);
    }

    int_type
    fetch_or(int_type i,
             memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_or(&_M_i, i, m);
    }

    int_type fetch_xor(int_type i,
                         memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_xor(&_M_i, i, m);
    }

    int_type
    fetch_xor(int_type i,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_xor(&_M_i, i, m);
    }
};

template <typename PtrType> struct atomic_base<PtrType*> {
  private:
    typedef PtrType* pointer_type;

    pointer_type _M_p;

    constexpr ptrdiff_t _M_type_size(ptrdiff_t d) {
        return d * sizeof(PtrType);
    }

    constexpr ptrdiff_t _M_type_size(ptrdiff_t d) volatile {
        return d * sizeof(PtrType);
    }

  public:
    atomic_base() noexcept = default;
    ~atomic_base() noexcept = default;
    atomic_base(const atomic_base&) = delete;
    atomic_base& operator=(const atomic_base&) = delete;
    atomic_base& operator=(const atomic_base&) volatile = delete;

    constexpr atomic_base(pointer_type p) noexcept : _M_p(p) {}

    operator pointer_type() const noexcept { return load(); }

    operator pointer_type() const volatile noexcept { return load(); }

    pointer_type operator=(pointer_type p) noexcept {
        store(p);
        return p;
    }

    pointer_type operator=(pointer_type p) volatile noexcept {
        store(p);
        return p;
    }

    pointer_type operator++(int) noexcept { return fetch_add(1); }

    pointer_type operator++(int) volatile noexcept { return fetch_add(1); }

    pointer_type operator--(int) noexcept { return fetch_sub(1); }

    pointer_type operator--(int) volatile noexcept { return fetch_sub(1); }

    pointer_type operator++() noexcept {
        return __atomic_add_fetch(&_M_p, _M_type_size(1), memory_order_seq_cst);
    }

    pointer_type operator++() volatile noexcept {
        return __atomic_add_fetch(&_M_p, _M_type_size(1), memory_order_seq_cst);
    }

    pointer_type operator--() noexcept {
        return __atomic_sub_fetch(&_M_p, _M_type_size(1), memory_order_seq_cst);
    }

    pointer_type operator--() volatile noexcept {
        return __atomic_sub_fetch(&_M_p, _M_type_size(1), memory_order_seq_cst);
    }

    pointer_type operator+=(ptrdiff_t d) noexcept {
        return __atomic_add_fetch(&_M_p, _M_type_size(d),
                                  memory_order_seq_cst);
    }

    pointer_type operator+=(ptrdiff_t d) volatile noexcept {
        return __atomic_add_fetch(&_M_p, _M_type_size(d),
                                  memory_order_seq_cst);
    }

    pointer_type operator-=(ptrdiff_t d) noexcept {
        return __atomic_sub_fetch(&_M_p, _M_type_size(d),
                                  memory_order_seq_cst);
    }

    pointer_type operator-=(ptrdiff_t d) volatile noexcept {
        return __atomic_sub_fetch(&_M_p, _M_type_size(d),
                                  memory_order_seq_cst);
    }

    bool is_lock_free() const noexcept {
        return __atomic_is_lock_free(_M_type_size(1), nullptr);
    }

    bool is_lock_free() const volatile noexcept {
        return __atomic_is_lock_free(_M_type_size(1), nullptr);
    }

    void store(pointer_type p,
               memory_order m = memory_order_seq_cst) noexcept {
        memory_order b = m & __memory_order_mask;

        ;
        ;
        ;

        __atomic_store_n(&_M_p, p, m);
    }

    void store(pointer_type p,
               memory_order m = memory_order_seq_cst) volatile noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;
        ;

        __atomic_store_n(&_M_p, p, m);
    }

    pointer_type load(memory_order m = memory_order_seq_cst) const
        noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;

        return __atomic_load_n(&_M_p, m);
    }

    pointer_type load(memory_order m = memory_order_seq_cst) const
        volatile noexcept {
        memory_order b = m & __memory_order_mask;
        ;
        ;

        return __atomic_load_n(&_M_p, m);
    }

    pointer_type exchange(pointer_type p,
                            memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_exchange_n(&_M_p, p, m);
    }

    pointer_type
    exchange(pointer_type p,
             memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_exchange_n(&_M_p, p, m);
    }

    bool compare_exchange_strong(pointer_type& p1, pointer_type p2,
                                 memory_order m1,
                                 memory_order m2) noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;
        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_p, &p1, p2, 0, m1, m2);
    }

    bool compare_exchange_strong(pointer_type& p1, pointer_type p2,
                                 memory_order m1,
                                 memory_order m2) volatile noexcept {
        memory_order b2 = m2 & __memory_order_mask;
        memory_order b1 = m1 & __memory_order_mask;

        ;
        ;
        ;

        return __atomic_compare_exchange_n(&_M_p, &p1, p2, 0, m1, m2);
    }

    pointer_type fetch_add(ptrdiff_t d,
                             memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_add(&_M_p, _M_type_size(d), m);
    }

    pointer_type
    fetch_add(ptrdiff_t d,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_add(&_M_p, _M_type_size(d), m);
    }

    pointer_type fetch_sub(ptrdiff_t d,
                             memory_order m = memory_order_seq_cst) noexcept {
        return __atomic_fetch_sub(&_M_p, _M_type_size(d), m);
    }

    pointer_type
    fetch_sub(ptrdiff_t d,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return __atomic_fetch_sub(&_M_p, _M_type_size(d), m);
    }
};
}


namespace utility {

struct atomic_bool {
  private:
    atomic_base<bool> _M_base;

  public:
    atomic_bool() noexcept = default;
    ~atomic_bool() noexcept = default;
    atomic_bool(const atomic_bool&) = delete;
    atomic_bool& operator=(const atomic_bool&) = delete;
    atomic_bool& operator=(const atomic_bool&) volatile = delete;

    constexpr atomic_bool(bool i) noexcept : _M_base(i) {}

    bool operator=(bool i) noexcept { return _M_base.operator=(i); }

    bool operator=(bool i) volatile noexcept {
        return _M_base.operator=(i);
    }

    operator bool() const noexcept { return _M_base.load(); }

    operator bool() const volatile noexcept { return _M_base.load(); }

    bool is_lock_free() const noexcept { return _M_base.is_lock_free(); }

    bool is_lock_free() const volatile noexcept {
        return _M_base.is_lock_free();
    }

    void store(bool i, memory_order m = memory_order_seq_cst) noexcept {
        _M_base.store(i, m);
    }

    void store(bool i,
               memory_order m = memory_order_seq_cst) volatile noexcept {
        _M_base.store(i, m);
    }

    bool load(memory_order m = memory_order_seq_cst) const noexcept {
        return _M_base.load(m);
    }

    bool load(memory_order m = memory_order_seq_cst) const volatile noexcept {
        return _M_base.load(m);
    }

    bool exchange(bool i, memory_order m = memory_order_seq_cst) noexcept {
        return _M_base.exchange(i, m);
    }

    bool exchange(bool i,
                  memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_base.exchange(i, m);
    }

    bool compare_exchange_weak(bool &i1, bool i2, memory_order m1,
                               memory_order m2) noexcept {
        return _M_base.compare_exchange_weak(i1, i2, m1, m2);
    }

    bool compare_exchange_weak(bool &i1, bool i2, memory_order m1,
                               memory_order m2) volatile noexcept {
        return _M_base.compare_exchange_weak(i1, i2, m1, m2);
    }

    bool
    compare_exchange_weak(bool &i1, bool i2,
                          memory_order m = memory_order_seq_cst) noexcept {
        return _M_base.compare_exchange_weak(i1, i2, m);
    }

    bool compare_exchange_weak(
        bool &i1, bool i2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_base.compare_exchange_weak(i1, i2, m);
    }

    bool compare_exchange_strong(bool &i1, bool i2, memory_order m1,
                                 memory_order m2) noexcept {
        return _M_base.compare_exchange_strong(i1, i2, m1, m2);
    }

    bool compare_exchange_strong(bool &i1, bool i2, memory_order m1,
                                 memory_order m2) volatile noexcept {
        return _M_base.compare_exchange_strong(i1, i2, m1, m2);
    }

    bool
    compare_exchange_strong(bool &i1, bool i2,
                            memory_order m = memory_order_seq_cst) noexcept {
        return _M_base.compare_exchange_strong(i1, i2, m);
    }

    bool compare_exchange_strong(
        bool &i1, bool i2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_base.compare_exchange_strong(i1, i2, m);
    }
};

template <typename T> struct atomic {
  private:
    T _M_i;

  public:
    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(T i) noexcept : _M_i(i) {}

    operator T() const noexcept { return load(); }

    operator T() const volatile noexcept { return load(); }

    T operator=(T i) noexcept {
        store(i);
        return i;
    }

    T operator=(T i) volatile noexcept {
        store(i);
        return i;
    }

    bool is_lock_free() const noexcept {
        return __atomic_is_lock_free(sizeof(_M_i), nullptr);
    }

    bool is_lock_free() const volatile noexcept {
        return __atomic_is_lock_free(sizeof(_M_i), nullptr);
    }

    void store(T i, memory_order _m = memory_order_seq_cst) noexcept {
        __atomic_store(&_M_i, &i, _m);
    }

    void store(T i,
               memory_order _m = memory_order_seq_cst) volatile noexcept {
        __atomic_store(&_M_i, &i, _m);
    }

    T load(memory_order _m = memory_order_seq_cst) const noexcept {
        T tmp;
        __atomic_load(&_M_i, &tmp, _m);
        return tmp;
    }

    T load(memory_order _m = memory_order_seq_cst) const volatile noexcept {
        T tmp;
        __atomic_load(&_M_i, &tmp, _m);
        return tmp;
    }

    T exchange(T i, memory_order _m = memory_order_seq_cst) noexcept {
        T tmp;
        __atomic_exchange(&_M_i, &i, &tmp, _m);
        return tmp;
    }

    T exchange(T i,
                 memory_order _m = memory_order_seq_cst) volatile noexcept {
        T tmp;
        __atomic_exchange(&_M_i, &i, &tmp, _m);
        return tmp;
    }

    bool compare_exchange_weak(T &e, T i, memory_order s,
                               memory_order f) noexcept {
        return __atomic_compare_exchange(&_M_i, &e, &i, true, s, f);
    }

    bool compare_exchange_weak(T &e, T i, memory_order s,
                               memory_order f) volatile noexcept {
        return __atomic_compare_exchange(&_M_i, &e, &i, true, s, f);
    }

    bool
    compare_exchange_weak(T &e, T i,
                          memory_order m = memory_order_seq_cst) noexcept {
        return compare_exchange_weak(e, i, m, m);
    }

    bool compare_exchange_weak(
        T &e, T i,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return compare_exchange_weak(e, i, m, m);
    }

    bool compare_exchange_strong(T &e, T i, memory_order s,
                                 memory_order f) noexcept {
        return __atomic_compare_exchange(&_M_i, &e, &i, false, s, f);
    }

    bool compare_exchange_strong(T &e, T i, memory_order s,
                                 memory_order f) volatile noexcept {
        return __atomic_compare_exchange(&_M_i, &e, &i, false, s, f);
    }

    bool
    compare_exchange_strong(T &e, T i,
                            memory_order m = memory_order_seq_cst) noexcept {
        return compare_exchange_strong(e, i, m, m);
    }

    bool compare_exchange_strong(
        T &e, T i,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return compare_exchange_strong(e, i, m, m);
    }
};

template <typename T> struct atomic<T*> {
    typedef T* pointer_type;
    typedef atomic_base<T*> base_type;
    base_type _M_b;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(pointer_type p) noexcept : _M_b(p) {}

    operator pointer_type() const noexcept { return pointer_type(_M_b); }

    operator pointer_type() const volatile noexcept {
        return pointer_type(_M_b);
    }

    pointer_type operator=(pointer_type p) noexcept {
        return _M_b.operator=(p);
    }

    pointer_type operator=(pointer_type p) volatile noexcept {
        return _M_b.operator=(p);
    }

    pointer_type operator++(int) noexcept { return _M_b++; }

    pointer_type operator++(int) volatile noexcept { return _M_b++; }

    pointer_type operator--(int) noexcept { return _M_b--; }

    pointer_type operator--(int) volatile noexcept { return _M_b--; }

    pointer_type operator++() noexcept { return ++_M_b; }

    pointer_type operator++() volatile noexcept { return ++_M_b; }

    pointer_type operator--() noexcept { return --_M_b; }

    pointer_type operator--() volatile noexcept { return --_M_b; }

    pointer_type operator+=(ptrdiff_t d) noexcept {
        return _M_b.operator+=(d);
    }

    pointer_type operator+=(ptrdiff_t d) volatile noexcept {
        return _M_b.operator+=(d);
    }

    pointer_type operator-=(ptrdiff_t d) noexcept {
        return _M_b.operator-=(d);
    }

    pointer_type operator-=(ptrdiff_t d) volatile noexcept {
        return _M_b.operator-=(d);
    }

    bool is_lock_free() const noexcept { return _M_b.is_lock_free(); }

    bool is_lock_free() const volatile noexcept { return _M_b.is_lock_free(); }

    void store(pointer_type p,
               memory_order m = memory_order_seq_cst) noexcept {
        return _M_b.store(p, m);
    }

    void store(pointer_type p,
               memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_b.store(p, m);
    }

    pointer_type load(memory_order m = memory_order_seq_cst) const
        noexcept {
        return _M_b.load(m);
    }

    pointer_type load(memory_order m = memory_order_seq_cst) const
        volatile noexcept {
        return _M_b.load(m);
    }

    pointer_type exchange(pointer_type p,
                            memory_order m = memory_order_seq_cst) noexcept {
        return _M_b.exchange(p, m);
    }

    pointer_type
    exchange(pointer_type p,
             memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_b.exchange(p, m);
    }

    bool compare_exchange_weak(pointer_type &p1, pointer_type p2,
                               memory_order m1, memory_order m2) noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m1, m2);
    }

    bool compare_exchange_weak(pointer_type &p1, pointer_type p2,
                               memory_order m1,
                               memory_order m2) volatile noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m1, m2);
    }

    bool
    compare_exchange_weak(pointer_type &p1, pointer_type p2,
                          memory_order m = memory_order_seq_cst) noexcept {
        return compare_exchange_weak(p1, p2, m,
                                     cmpexch_failure_order(m));
    }

    bool compare_exchange_weak(
        pointer_type &p1, pointer_type p2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return compare_exchange_weak(p1, p2, m,
                                     cmpexch_failure_order(m));
    }

    bool compare_exchange_strong(pointer_type &p1, pointer_type p2,
                                 memory_order m1,
                                 memory_order m2) noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m1, m2);
    }

    bool compare_exchange_strong(pointer_type &p1, pointer_type p2,
                                 memory_order m1,
                                 memory_order m2) volatile noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m1, m2);
    }

    bool
    compare_exchange_strong(pointer_type &p1, pointer_type p2,
                            memory_order m = memory_order_seq_cst) noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m,
                                            cmpexch_failure_order(m));
    }

    bool compare_exchange_strong(
        pointer_type &p1, pointer_type p2,
        memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_b.compare_exchange_strong(p1, p2, m,
                                            cmpexch_failure_order(m));
    }

    pointer_type fetch_add(ptrdiff_t d,
                             memory_order m = memory_order_seq_cst) noexcept {
        return _M_b.fetch_add(d, m);
    }

    pointer_type
    fetch_add(ptrdiff_t d,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_b.fetch_add(d, m);
    }

    pointer_type fetch_sub(ptrdiff_t d,
                             memory_order m = memory_order_seq_cst) noexcept {
        return _M_b.fetch_sub(d, m);
    }

    pointer_type
    fetch_sub(ptrdiff_t d,
              memory_order m = memory_order_seq_cst) volatile noexcept {
        return _M_b.fetch_sub(d, m);
    }
};

template <> struct atomic<bool> : public atomic_bool {
    typedef bool integral_type;
    typedef atomic_bool base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<char> : public atomic_char {
    typedef char integral_type;
    typedef atomic_char base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<signed char> : public atomic_schar {
    typedef signed char integral_type;
    typedef atomic_schar base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<unsigned char> : public atomic_uchar {
    typedef unsigned char integral_type;
    typedef atomic_uchar base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<short> : public atomic_short {
    typedef short integral_type;
    typedef atomic_short base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<unsigned short> : public atomic_ushort {
    typedef unsigned short integral_type;
    typedef atomic_ushort base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<int> : atomic_int {
    typedef int integral_type;
    typedef atomic_int base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<unsigned int> : public atomic_uint {
    typedef unsigned int integral_type;
    typedef atomic_uint base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<long> : public atomic_long {
    typedef long integral_type;
    typedef atomic_long base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<unsigned long> : public atomic_ulong {
    typedef unsigned long integral_type;
    typedef atomic_ulong base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<long long> : public atomic_llong {
    typedef long long integral_type;
    typedef atomic_llong base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<unsigned long long> : public atomic_ullong {
    typedef unsigned long long integral_type;
    typedef atomic_ullong base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<wchar_t> : public atomic_wchar_t {
    typedef wchar_t integral_type;
    typedef atomic_wchar_t base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<char16_t> : public atomic_char16_t {
    typedef char16_t integral_type;
    typedef atomic_char16_t base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

template <> struct atomic<char32_t> : public atomic_char32_t {
    typedef char32_t integral_type;
    typedef atomic_char32_t base_type;

    atomic() noexcept = default;
    ~atomic() noexcept = default;
    atomic(const atomic&) = delete;
    atomic& operator=(const atomic&) = delete;
    atomic& operator=(const atomic&) volatile = delete;

    constexpr atomic(integral_type i) noexcept : base_type(i) {}

    using base_type::operator integral_type;
    using base_type::operator=;
};

inline bool atomic_flag_test_and_set_explicit(atomic_flag *a,
                                              memory_order m) noexcept {
    return a->test_and_set(m);
}

inline bool atomic_flag_test_and_set_explicit(volatile atomic_flag *a,
                                              memory_order m) noexcept {
    return a->test_and_set(m);
}

inline void atomic_flag_clear_explicit(atomic_flag *a,
                                       memory_order m) noexcept {
    a->clear(m);
}

inline void atomic_flag_clear_explicit(volatile atomic_flag *a,
                                       memory_order m) noexcept {
    a->clear(m);
}

inline bool atomic_flag_test_and_set(atomic_flag *a) noexcept {
    return atomic_flag_test_and_set_explicit(a, memory_order_seq_cst);
}

inline bool atomic_flag_test_and_set(volatile atomic_flag *a) noexcept {
    return atomic_flag_test_and_set_explicit(a, memory_order_seq_cst);
}

inline void atomic_flag_clear(atomic_flag *a) noexcept {
    atomic_flag_clear_explicit(a, memory_order_seq_cst);
}

inline void atomic_flag_clear(volatile atomic_flag *a) noexcept {
    atomic_flag_clear_explicit(a, memory_order_seq_cst);
}

template <typename IntType>
inline bool atomic_is_lock_free(const atomic<IntType> *a) noexcept {
    return a->is_lock_free();
}

template <typename IntType>
inline bool atomic_is_lock_free(const volatile atomic<IntType> *a) noexcept {
    return a->is_lock_free();
}

template <typename IntType>
inline void atomic_init(atomic<IntType> *a, IntType i) noexcept;

template <typename IntType>
inline void atomic_init(volatile atomic<IntType> *a, IntType i) noexcept;

template <typename IntType>
inline void atomic_store_explicit(atomic<IntType> *a, IntType i,
                                  memory_order m) noexcept {
    a->store(i, m);
}

template <typename IntType>
inline void atomic_store_explicit(volatile atomic<IntType> *a, IntType i,
                                  memory_order m) noexcept {
    a->store(i, m);
}

template <typename IntType>
inline IntType atomic_load_explicit(const atomic<IntType> *a,
                                 memory_order m) noexcept {
    return a->load(m);
}

template <typename IntType>
inline IntType atomic_load_explicit(const volatile atomic<IntType> *a,
                                 memory_order m) noexcept {
    return a->load(m);
}

template <typename IntType>
inline IntType atomic_exchange_explicit(atomic<IntType> *a, IntType i,
                                     memory_order m) noexcept {
    return a->exchange(i, m);
}

template <typename IntType>
inline IntType atomic_exchange_explicit(volatile atomic<IntType> *a, IntType i,
                                     memory_order m) noexcept {
    return a->exchange(i, m);
}

template <typename IntType>
inline bool atomic_compare_exchange_weak_explicit(atomic<IntType> *a, IntType *i1,
                                                  IntType i2, memory_order m1,
                                                  memory_order m2) noexcept {
    return a->compare_exchange_weak(*i1, i2, m1, m2);
}

template <typename IntType>
inline bool atomic_compare_exchange_weak_explicit(volatile atomic<IntType> *a,
                                                  IntType *i1, IntType i2,
                                                  memory_order m1,
                                                  memory_order m2) noexcept {
    return a->compare_exchange_weak(*i1, i2, m1, m2);
}

template <typename IntType>
inline bool
atomic_compare_exchange_strong_explicit(atomic<IntType> *a, IntType *i1,
                                        IntType i2, memory_order m1,
                                        memory_order m2) noexcept {
    return a->compare_exchange_strong(*i1, i2, m1, m2);
}

template <typename IntType>
inline bool
atomic_compare_exchange_strong_explicit(volatile atomic<IntType> *a, IntType *i1,
                                        IntType i2, memory_order m1,
                                        memory_order m2) noexcept {
    return a->compare_exchange_strong(*i1, i2, m1, m2);
}

template <typename IntType>
inline void atomic_store(atomic<IntType> *a, IntType i) noexcept {
    atomic_store_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline void atomic_store(volatile atomic<IntType> *a, IntType i) noexcept {
    atomic_store_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_load(const atomic<IntType> *a) noexcept {
    return atomic_load_explicit(a, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_load(const volatile atomic<IntType> *a) noexcept {
    return atomic_load_explicit(a, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_exchange(atomic<IntType> *a, IntType i) noexcept {
    return atomic_exchange_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_exchange(volatile atomic<IntType> *a, IntType i) noexcept {
    return atomic_exchange_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline bool atomic_compare_exchange_weak(atomic<IntType> *a, IntType *i1,
                                         IntType i2) noexcept {
    return atomic_compare_exchange_weak_explicit(
        a, i1, i2, memory_order_seq_cst, memory_order_seq_cst);
}

template <typename IntType>
inline bool atomic_compare_exchange_weak(volatile atomic<IntType> *a, IntType *i1,
                                         IntType i2) noexcept {
    return atomic_compare_exchange_weak_explicit(
        a, i1, i2, memory_order_seq_cst, memory_order_seq_cst);
}

template <typename IntType>
inline bool atomic_compare_exchange_strong(atomic<IntType> *a, IntType *i1,
                                           IntType i2) noexcept {
    return atomic_compare_exchange_strong_explicit(
        a, i1, i2, memory_order_seq_cst, memory_order_seq_cst);
}

template <typename IntType>
inline bool atomic_compare_exchange_strong(volatile atomic<IntType> *a,
                                           IntType *i1, IntType i2) noexcept {
    return atomic_compare_exchange_strong_explicit(
        a, i1, i2, memory_order_seq_cst, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_add_explicit(atomic_base<IntType> *a, IntType i,
                                      memory_order m) noexcept {
    return a->fetch_add(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_add_explicit(volatile atomic_base<IntType> *a,
                                      IntType i, memory_order m) noexcept {
    return a->fetch_add(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_sub_explicit(atomic_base<IntType> *a, IntType i,
                                      memory_order m) noexcept {
    return a->fetch_sub(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_sub_explicit(volatile atomic_base<IntType> *a,
                                      IntType i, memory_order m) noexcept {
    return a->fetch_sub(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_and_explicit(atomic_base<IntType> *a, IntType i,
                                      memory_order m) noexcept {
    return a->fetch_and(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_and_explicit(volatile atomic_base<IntType> *a,
                                      IntType i, memory_order m) noexcept {
    return a->fetch_and(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_or_explicit(atomic_base<IntType> *a, IntType i,
                                     memory_order m) noexcept {
    return a->fetch_or(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_or_explicit(volatile atomic_base<IntType> *a,
                                     IntType i, memory_order m) noexcept {
    return a->fetch_or(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_xor_explicit(atomic_base<IntType> *a, IntType i,
                                      memory_order m) noexcept {
    return a->fetch_xor(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_xor_explicit(volatile atomic_base<IntType> *a,
                                      IntType i, memory_order m) noexcept {
    return a->fetch_xor(i, m);
}

template <typename IntType>
inline IntType atomic_fetch_add(atomic_base<IntType> *a, IntType i) noexcept {
    return atomic_fetch_add_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_add(volatile atomic_base<IntType> *a,
                             IntType i) noexcept {
    return atomic_fetch_add_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_sub(atomic_base<IntType> *a, IntType i) noexcept {
    return atomic_fetch_sub_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_sub(volatile atomic_base<IntType> *a,
                             IntType i) noexcept {
    return atomic_fetch_sub_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_and(atomic_base<IntType> *a, IntType i) noexcept {
    return atomic_fetch_and_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_and(volatile atomic_base<IntType> *a,
                             IntType i) noexcept {
    return atomic_fetch_and_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_or(atomic_base<IntType> *a, IntType i) noexcept {
    return atomic_fetch_or_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_or(volatile atomic_base<IntType> *a,
                            IntType i) noexcept {
    return atomic_fetch_or_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_xor(atomic_base<IntType> *a, IntType i) noexcept {
    return atomic_fetch_xor_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType atomic_fetch_xor(volatile atomic_base<IntType> *a,
                             IntType i) noexcept {
    return atomic_fetch_xor_explicit(a, i, memory_order_seq_cst);
}

template <typename IntType>
inline IntType* atomic_fetch_add_explicit(atomic<IntType*> *a, ptrdiff_t d,
                                       memory_order m) noexcept {
    return a->fetch_add(d, m);
}

template <typename IntType>
inline IntType* atomic_fetch_add_explicit(volatile atomic<IntType*> *a,
                                       ptrdiff_t d,
                                       memory_order m) noexcept {
    return a->fetch_add(d, m);
}

template <typename IntType>
inline IntType* atomic_fetch_add(volatile atomic<IntType*> *a,
                              ptrdiff_t d) noexcept {
    return a->fetch_add(d);
}

template <typename IntType>
inline IntType* atomic_fetch_add(atomic<IntType*> *a, ptrdiff_t d) noexcept {
    return a->fetch_add(d);
}

template <typename IntType>
inline IntType* atomic_fetch_sub_explicit(volatile atomic<IntType*> *a,
                                       ptrdiff_t d,
                                       memory_order m) noexcept {
    return a->fetch_sub(d, m);
}

template <typename IntType>
inline IntType* atomic_fetch_sub_explicit(atomic<IntType*> *a, ptrdiff_t d,
                                       memory_order m) noexcept {
    return a->fetch_sub(d, m);
}

template <typename IntType>
inline IntType* atomic_fetch_sub(volatile atomic<IntType*> *a,
                              ptrdiff_t d) noexcept {
    return a->fetch_sub(d);
}

template <typename IntType>
inline IntType* atomic_fetch_sub(atomic<IntType*> *a, ptrdiff_t d) noexcept {
    return a->fetch_sub(d);
}
}
