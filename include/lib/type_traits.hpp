/**
 *	@file include/lib/type_traits.hpp
 *
 *	@brief libstdc++ simulation
 */
#pragma once

#include <stddef.h>
#include <stdint.h>

namespace lib {

template <typename T, T v>
struct integral_constant {
    static constexpr T value = v;
    typedef T value_type;
    typedef integral_constant<T, v> type;
    constexpr operator value_type() const { return value; }
};

template <typename T, T v>
constexpr T integral_constant<T, v>::value;

typedef integral_constant<bool, true> true_type;

typedef integral_constant<bool, false> false_type;

template <bool, typename, typename>
struct conditional;

template <typename...>
struct __or_;

template <>
struct __or_<> : public false_type {
};

template <typename B1>
struct __or_<B1> : public B1 {
};

template <typename B1, typename B2>
struct __or_<B1, B2> : public conditional<B1::value, B1, B2>::type {
};

template <typename B1, typename B2, typename B3, typename... Bn>
struct __or_<B1, B2, B3, Bn...>
    : public conditional<B1::value, B1, __or_<B2, B3, Bn...> >::type {
};

template <typename...>
struct __and_;

template <>
struct __and_<> : public true_type {
};

template <typename B1>
struct __and_<B1> : public B1 {
};

template <typename B1, typename B2>
struct __and_<B1, B2> : public conditional<B1::value, B2, B1>::type {
};

template <typename B1, typename B2, typename B3, typename... Bn>
struct __and_<B1, B2, B3, Bn...>
    : public conditional<B1::value, __and_<B2, B3, Bn...>, B1>::type {
};

template <typename _Pp>
struct __not_ : public integral_constant<bool, !_Pp::value> {
};

template <typename T>
struct __success_type {
    typedef T type;
};

struct __failure_type {
};

template <typename>
struct remove_cv;

template <typename>
struct __is_void_helper : public false_type {
};

template <>
struct __is_void_helper<void> : public true_type {
};

template <typename T>
struct is_void : public __is_void_helper<typename remove_cv<T>::type>::type {
};

template <typename>
struct __is_integral_helper : public false_type {
};

template <>
struct __is_integral_helper<bool> : public true_type {
};

template <>
struct __is_integral_helper<char> : public true_type {
};

template <>
struct __is_integral_helper<signed char> : public true_type {
};

template <>
struct __is_integral_helper<unsigned char> : public true_type {
};

template <>
struct __is_integral_helper<wchar_t> : public true_type {
};

template <>
struct __is_integral_helper<char16_t> : public true_type {
};

template <>
struct __is_integral_helper<char32_t> : public true_type {
};

template <>
struct __is_integral_helper<short> : public true_type {
};

template <>
struct __is_integral_helper<unsigned short> : public true_type {
};

template <>
struct __is_integral_helper<int> : public true_type {
};

template <>
struct __is_integral_helper<unsigned int> : public true_type {
};

template <>
struct __is_integral_helper<long> : public true_type {
};

template <>
struct __is_integral_helper<unsigned long> : public true_type {
};

template <>
struct __is_integral_helper<long long> : public true_type {
};

template <>
struct __is_integral_helper<unsigned long long> : public true_type {
};

template <typename T>
struct is_integral
    : public __is_integral_helper<typename remove_cv<T>::type>::type {
};

template <typename>
struct __is_floating_point_helper : public false_type {
};

template <>
struct __is_floating_point_helper<float> : public true_type {
};

template <>
struct __is_floating_point_helper<double> : public true_type {
};

template <>
struct __is_floating_point_helper<long double> : public true_type {
};

template <typename T>
struct is_floating_point
    : public __is_floating_point_helper<typename remove_cv<T>::type>::type {
};

template <typename>
struct is_array : public false_type {
};

template <typename T, size_t Size>
struct is_array<T[Size]> : public true_type {
};

template <typename T>
struct is_array<T[]> : public true_type {
};

template <typename>
struct __is_pointer_helper : public false_type {
};

template <typename T>
struct __is_pointer_helper<T*> : public true_type {
};

template <typename T>
struct is_pointer
    : public __is_pointer_helper<typename remove_cv<T>::type>::type {
};

template <typename>
struct is_lvalue_reference : public false_type {
};

template <typename T>
struct is_lvalue_reference<T&> : public true_type {
};

template <typename>
struct is_rvalue_reference : public false_type {
};

template <typename T>
struct is_rvalue_reference<T&&> : public true_type {
};

template <typename>
struct is_function;

template <typename>
struct __is_member_object_pointer_helper : public false_type {
};

template <typename T, typename Class>
struct __is_member_object_pointer_helper<T Class::*>
    : public integral_constant<bool, !is_function<T>::value> {
};

template <typename T>
struct is_member_object_pointer : public __is_member_object_pointer_helper<
                                      typename remove_cv<T>::type>::type {
};

template <typename>
struct __is_member_function_pointer_helper : public false_type {
};

template <typename T, typename Class>
struct __is_member_function_pointer_helper<T Class::*>
    : public integral_constant<bool, is_function<T>::value> {
};

template <typename T>
struct is_member_function_pointer : public __is_member_function_pointer_helper<
                                        typename remove_cv<T>::type>::type {
};

template <typename T>
struct is_enum : public integral_constant<bool, __is_enum(T)> {
};

template <typename T>
struct is_union : public integral_constant<bool, __is_union(T)> {
};

template <typename T>
struct is_class : public integral_constant<bool, __is_class(T)> {
};

template <typename>
struct is_function : public false_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...)> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...)&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) &&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......)> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......)&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) &&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const&&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const&&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) volatile> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) volatile&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) volatile&&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) volatile> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) volatile&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) volatile&&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const volatile> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const volatile&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes...) const volatile&&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const volatile> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const volatile&> : public true_type {
};

template <typename Res, typename... ArgTypes>
struct is_function<Res(ArgTypes......) const volatile&&> : public true_type {
};

template <typename>
struct __is_null_pointer_helper : public false_type {
};

template <>
struct __is_null_pointer_helper<nullptr_t> : public true_type {
};

template <typename T>
struct is_null_pointer
    : public __is_null_pointer_helper<typename remove_cv<T>::type>::type {
};

template <typename T>
struct __is_nullptr_t : public is_null_pointer<T> {
};

template <typename T>
struct is_reference
    : public __or_<is_lvalue_reference<T>, is_rvalue_reference<T> >::type {
};

template <typename T>
struct is_arithmetic
    : public __or_<is_integral<T>, is_floating_point<T> >::type {
};

template <typename T>
struct is_fundamental : public __or_<is_arithmetic<T>, is_void<T>,
                            is_null_pointer<T> >::type {
};

template <typename T>
struct is_object
    : public __not_<__or_<is_function<T>, is_reference<T>, is_void<T> > >::type {
};

template <typename>
struct is_member_pointer;

template <typename T>
struct is_scalar
    : public __or_<is_arithmetic<T>, is_enum<T>, is_pointer<T>,
          is_member_pointer<T>, is_null_pointer<T> >::type {
};

template <typename T>
struct is_compound
    : public integral_constant<bool, !is_fundamental<T>::value> {
};

template <typename T>
struct __is_member_pointer_helper : public false_type {
};

template <typename T, typename Class>
struct __is_member_pointer_helper<T Class::*> : public true_type {
};

template <typename T>
struct is_member_pointer
    : public __is_member_pointer_helper<typename remove_cv<T>::type>::type {
};

template <typename T>
struct __is_referenceable
    : public __or_<is_object<T>, is_reference<T> >::type {
};

template <typename Res, typename... Args>
struct __is_referenceable<Res(Args...)> : public true_type {
};

template <typename Res, typename... Args>
struct __is_referenceable<Res(Args......)> : public true_type {
};

template <typename>
struct is_const : public false_type {
};

template <typename T>
struct is_const<T const> : public true_type {
};

template <typename>
struct is_volatile : public false_type {
};

template <typename T>
struct is_volatile<T volatile> : public true_type {
};

template <typename T>
struct is_trivial : public integral_constant<bool, __is_trivial(T)> {
};

template <typename T>
struct is_standard_layout
    : public integral_constant<bool, __is_standard_layout(T)> {
};

template <typename T>
struct is_pod : public integral_constant<bool, __is_pod(T)> {
};

template <typename T>
struct is_literal_type
    : public integral_constant<bool, __is_literal_type(T)> {
};

template <typename T>
struct is_empty : public integral_constant<bool, __is_empty(T)> {
};

template <typename T>
struct is_polymorphic : public integral_constant<bool, __is_polymorphic(T)> {
};

template <typename T>
struct is_abstract : public integral_constant<bool, __is_abstract(T)> {
};

template <typename T, bool = is_arithmetic<T>::value>
struct __is_signed_helper : public false_type {
};

template <typename T>
struct __is_signed_helper<T, true> : public integral_constant<bool,
                                           T(-1) < T(0)> {
};

template <typename T>
struct is_signed : public __is_signed_helper<T>::type {
};

template <typename T>
struct is_unsigned
    : public __and_<is_arithmetic<T>, __not_<is_signed<T> > >::type {
};

template <typename>
struct add_rvalue_reference;

template <typename T>
typename add_rvalue_reference<T>::type declval() noexcept;

template <typename, unsigned = 0>
struct extent;

template <typename>
struct remove_all_extents;

template <typename T>
struct __is_array_known_bounds
    : public integral_constant<bool, (extent<T>::value > 0)> {
};

template <typename T>
struct __is_array_unknown_bounds
    : public __and_<is_array<T>, __not_<extent<T> > >::type {
};

struct __do_is_destructible_impl {
    template <typename T, typename = decltype(declval<T&>().~T())>
    static true_type __test(int);

    template <typename>
    static false_type __test(...);
};

template <typename T>
struct __is_destructible_impl : public __do_is_destructible_impl {
    typedef decltype(__test<T>(0)) type;
};

template <typename T,
    bool = __or_<is_void<T>, __is_array_unknown_bounds<T>,
        is_function<T> >::value,
    bool = __or_<is_reference<T>, is_scalar<T> >::value>
struct __is_destructible_safe;

template <typename T>
struct __is_destructible_safe<T, false, false>
    : public __is_destructible_impl<
          typename remove_all_extents<T>::type>::type {
};

template <typename T>
struct __is_destructible_safe<T, true, false> : public false_type {
};

template <typename T>
struct __is_destructible_safe<T, false, true> : public true_type {
};

template <typename T>
struct is_destructible : public __is_destructible_safe<T>::type {
};

struct __do_is_nt_destructible_impl {
    template <typename T>
    static integral_constant<bool, noexcept(declval<T&>().~T())> __test(
        int);

    template <typename>
    static false_type __test(...);
};

template <typename T>
struct __is_nt_destructible_impl : public __do_is_nt_destructible_impl {
    typedef decltype(__test<T>(0)) type;
};

template <typename T,
    bool = __or_<is_void<T>, __is_array_unknown_bounds<T>,
        is_function<T> >::value,
    bool = __or_<is_reference<T>, is_scalar<T> >::value>
struct __is_nt_destructible_safe;

template <typename T>
struct __is_nt_destructible_safe<T, false, false>
    : public __is_nt_destructible_impl<
          typename remove_all_extents<T>::type>::type {
};

template <typename T>
struct __is_nt_destructible_safe<T, true, false> : public false_type {
};

template <typename T>
struct __is_nt_destructible_safe<T, false, true> : public true_type {
};

template <typename T>
struct is_nothrow_destructible : public __is_nt_destructible_safe<T>::type {
};

struct __do_is_default_constructible_impl {
    template <typename T, typename = decltype(T())>
    static true_type __test(int);

    template <typename>
    static false_type __test(...);
};

template <typename T>
struct __is_default_constructible_impl
    : public __do_is_default_constructible_impl {
    typedef decltype(__test<T>(0)) type;
};

template <typename T>
struct __is_default_constructible_atom
    : public __and_<__not_<is_void<T> >,
          __is_default_constructible_impl<T> >::type {
};

template <typename T, bool = is_array<T>::value>
struct __is_default_constructible_safe;

template <typename T>
struct __is_default_constructible_safe<T, true>
    : public __and_<__is_array_known_bounds<T>,
          __is_default_constructible_atom<
                        typename remove_all_extents<T>::type> >::type {
};

template <typename T>
struct __is_default_constructible_safe<T, false>
    : public __is_default_constructible_atom<T>::type {
};

template <typename T>
struct is_default_constructible
    : public __is_default_constructible_safe<T>::type {
};

struct __do_is_static_castable_impl {
    template <typename From, typename To,
        typename = decltype(static_cast<To>(declval<From>()))>
    static true_type __test(int);

    template <typename, typename>
    static false_type __test(...);
};

template <typename From, typename To>
struct __is_static_castable_impl : public __do_is_static_castable_impl {
    typedef decltype(__test<From, To>(0)) type;
};

template <typename From, typename To>
struct __is_static_castable_safe
    : public __is_static_castable_impl<From, To>::type {
};

template <typename From, typename To>
struct __is_static_castable
    : public integral_constant<bool, (__is_static_castable_safe<From, To>::value)> {
};

struct __do_is_direct_constructible_impl {
    template <typename T, typename Arg,
        typename = decltype(::new T(declval<Arg>()))>
    static true_type __test(int);

    template <typename, typename>
    static false_type __test(...);
};

template <typename T, typename Arg>
struct __is_direct_constructible_impl
    : public __do_is_direct_constructible_impl {
    typedef decltype(__test<T, Arg>(0)) type;
};

template <typename T, typename Arg>
struct __is_direct_constructible_new_safe
    : public __and_<is_destructible<T>,
          __is_direct_constructible_impl<T, Arg> >::type {
};

template <typename, typename>
struct is_same;

template <typename, typename>
struct is_base_of;

template <typename>
struct remove_reference;

template <typename From, typename To,
    bool = __not_<__or_<is_void<From>, is_function<From> > >::value>
struct __is_base_to_derived_ref;

template <typename From, typename To>
struct __is_base_to_derived_ref<From, To, true> {
    typedef typename remove_cv<typename remove_reference<From>::type>::type
        __src_t;
    typedef typename remove_cv<typename remove_reference<To>::type>::type
        __dst_t;
    typedef __and_<__not_<is_same<__src_t, __dst_t> >,
        is_base_of<__src_t, __dst_t> > type;
    static constexpr bool value = type::value;
};

template <typename From, typename To>
struct __is_base_to_derived_ref<From, To, false> : public false_type {
};

template <
    typename From, typename To,
    bool = __and_<is_lvalue_reference<From>, is_rvalue_reference<To> >::value>
struct __is_lvalue_to_rvalue_ref;

template <typename From, typename To>
struct __is_lvalue_to_rvalue_ref<From, To, true> {
    typedef typename remove_cv<typename remove_reference<From>::type>::type
        __src_t;
    typedef typename remove_cv<typename remove_reference<To>::type>::type
        __dst_t;
    typedef __and_<__not_<is_function<__src_t> >,
        __or_<is_same<__src_t, __dst_t>, is_base_of<__dst_t, __src_t> > > type;
    static constexpr bool value = type::value;
};

template <typename From, typename To>
struct __is_lvalue_to_rvalue_ref<From, To, false> : public false_type {
};

template <typename T, typename Arg>
struct __is_direct_constructible_ref_cast
    : public __and_<__is_static_castable<Arg, T>,
          __not_<__or_<__is_base_to_derived_ref<Arg, T>,
              __is_lvalue_to_rvalue_ref<Arg, T> > > >::type {
};

template <typename T, typename Arg>
struct __is_direct_constructible_new
    : public conditional<is_reference<T>::value,
          __is_direct_constructible_ref_cast<T, Arg>,
          __is_direct_constructible_new_safe<T, Arg> >::type {
};

template <typename T, typename Arg>
struct __is_direct_constructible
    : public __is_direct_constructible_new<T, Arg>::type {
};

struct __do_is_nary_constructible_impl {
    template <typename T, typename... Args,
        typename = decltype(T(declval<Args>()...))>
    static true_type __test(int);

    template <typename, typename...>
    static false_type __test(...);
};

template <typename T, typename... Args>
struct __is_nary_constructible_impl : public __do_is_nary_constructible_impl {
    typedef decltype(__test<T, Args...>(0)) type;
};

template <typename T, typename... Args>
struct __is_nary_constructible
    : public __is_nary_constructible_impl<T, Args...>::type {
    static_assert(sizeof...(Args) > 1, "Only useful for > 1 arguments");
};

template <typename T, typename... Args>
struct __is_constructible_impl : public __is_nary_constructible<T, Args...> {
};

template <typename T, typename Arg>
struct __is_constructible_impl<T, Arg>
    : public __is_direct_constructible<T, Arg> {
};

template <typename T>
struct __is_constructible_impl<T> : public is_default_constructible<T> {
};

template <typename T, typename... Args>
struct is_constructible : public __is_constructible_impl<T, Args...>::type {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_copy_constructible_impl;

template <typename T>
struct __is_copy_constructible_impl<T, false> : public false_type {
};

template <typename T>
struct __is_copy_constructible_impl<T, true>
    : public is_constructible<T, const T&> {
};

template <typename T>
struct is_copy_constructible : public __is_copy_constructible_impl<T> {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_move_constructible_impl;

template <typename T>
struct __is_move_constructible_impl<T, false> : public false_type {
};

template <typename T>
struct __is_move_constructible_impl<T, true>
    : public is_constructible<T, T&&> {
};

template <typename T>
struct is_move_constructible : public __is_move_constructible_impl<T> {
};

template <typename T>
struct __is_nt_default_constructible_atom
    : public integral_constant<bool, noexcept(T())> {
};

template <typename T, bool = is_array<T>::value>
struct __is_nt_default_constructible_impl;

template <typename T>
struct __is_nt_default_constructible_impl<T, true>
    : public __and_<__is_array_known_bounds<T>,
          __is_nt_default_constructible_atom<
                        typename remove_all_extents<T>::type> >::type {
};

template <typename T>
struct __is_nt_default_constructible_impl<T, false>
    : public __is_nt_default_constructible_atom<T> {
};

template <typename T>
struct is_nothrow_default_constructible
    : public __and_<is_default_constructible<T>,
          __is_nt_default_constructible_impl<T> >::type {
};

template <typename T, typename... Args>
struct __is_nt_constructible_impl
    : public integral_constant<bool, noexcept(T(declval<Args>()...))> {
};

template <typename T, typename Arg>
struct __is_nt_constructible_impl<T, Arg>
    : public integral_constant<bool,
          noexcept(static_cast<T>(declval<Arg>()))> {
};

template <typename T>
struct __is_nt_constructible_impl<T>
    : public is_nothrow_default_constructible<T> {
};

template <typename T, typename... Args>
struct is_nothrow_constructible
    : public __and_<is_constructible<T, Args...>,
          __is_nt_constructible_impl<T, Args...> >::type {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_nothrow_copy_constructible_impl;

template <typename T>
struct __is_nothrow_copy_constructible_impl<T, false> : public false_type {
};

template <typename T>
struct __is_nothrow_copy_constructible_impl<T, true>
    : public is_nothrow_constructible<T, const T&> {
};

template <typename T>
struct is_nothrow_copy_constructible
    : public __is_nothrow_copy_constructible_impl<T> {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_nothrow_move_constructible_impl;

template <typename T>
struct __is_nothrow_move_constructible_impl<T, false> : public false_type {
};

template <typename T>
struct __is_nothrow_move_constructible_impl<T, true>
    : public is_nothrow_constructible<T, T&&> {
};

template <typename T>
struct is_nothrow_move_constructible
    : public __is_nothrow_move_constructible_impl<T> {
};

template <typename T, typename U>
class __is_assignable_helper {
    template <typename T1, typename U1,
        typename = decltype(declval<T1>() = declval<U1>())>
    static true_type __test(int);

    template <typename, typename>
    static false_type __test(...);

  public:
    typedef decltype(__test<T, U>(0)) type;
};

template <typename T, typename U>
struct is_assignable : public __is_assignable_helper<T, U>::type {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_copy_assignable_impl;

template <typename T>
struct __is_copy_assignable_impl<T, false> : public false_type {
};

template <typename T>
struct __is_copy_assignable_impl<T, true>
    : public is_assignable<T&, const T&> {
};

template <typename T>
struct is_copy_assignable : public __is_copy_assignable_impl<T> {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_move_assignable_impl;

template <typename T>
struct __is_move_assignable_impl<T, false> : public false_type {
};

template <typename T>
struct __is_move_assignable_impl<T, true>
    : public is_assignable<T&, T&&> {
};

template <typename T>
struct is_move_assignable : public __is_move_assignable_impl<T> {
};

template <typename T, typename U>
struct __is_nt_assignable_impl
    : public integral_constant<bool,
          noexcept(declval<T>() = declval<U>())> {
};

template <typename T, typename U>
struct is_nothrow_assignable
    : public __and_<is_assignable<T, U>,
          __is_nt_assignable_impl<T, U> >::type {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_nt_copy_assignable_impl;

template <typename T>
struct __is_nt_copy_assignable_impl<T, false> : public false_type {
};

template <typename T>
struct __is_nt_copy_assignable_impl<T, true>
    : public is_nothrow_assignable<T&, const T&> {
};

template <typename T>
struct is_nothrow_copy_assignable : public __is_nt_copy_assignable_impl<T> {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __is_nt_move_assignable_impl;

template <typename T>
struct __is_nt_move_assignable_impl<T, false> : public false_type {
};

template <typename T>
struct __is_nt_move_assignable_impl<T, true>
    : public is_nothrow_assignable<T&, T&&> {
};

template <typename T>
struct is_nothrow_move_assignable : public __is_nt_move_assignable_impl<T> {
};

template <typename T>
struct is_trivially_destructible
    : public __and_<is_destructible<T>,
          integral_constant<bool, __has_trivial_destructor(T)> >::type {
};

template <typename T>
struct has_trivial_default_constructor
    : public integral_constant<bool, __has_trivial_constructor(T)> {
};

template <typename T>
struct has_trivial_copy_constructor
    : public integral_constant<bool, __has_trivial_copy(T)> {
};

template <typename T>
struct has_trivial_copy_assign
    : public integral_constant<bool, __has_trivial_assign(T)> {
};

template <typename T>
struct has_virtual_destructor
    : public integral_constant<bool, __has_virtual_destructor(T)> {
};

template <typename T>
struct alignment_of : public integral_constant<size_t, __alignof__(T)> {
};

template <typename>
struct rank : public integral_constant<size_t, 0> {
};

template <typename T, size_t Size>
struct rank<T[Size]>
    : public integral_constant<size_t, 1 + rank<T>::value> {
};

template <typename T>
struct rank<T[]>
    : public integral_constant<size_t, 1 + rank<T>::value> {
};

template <typename, unsigned Uint>
struct extent : public integral_constant<size_t, 0> {
};

template <typename T, unsigned Uint, size_t Size>
struct extent<T[Size], Uint> : public integral_constant<size_t,
                                       Uint == 0 ? Size : extent<T, Uint - 1>::value> {
};

template <typename T, unsigned Uint>
struct extent<T[], Uint> : public integral_constant<size_t,
                                  Uint == 0 ? 0 : extent<T, Uint - 1>::value> {
};

template <typename, typename>
struct is_same : public false_type {
};

template <typename T>
struct is_same<T, T> : public true_type {
};

template <typename _Base, typename _Derived>
struct is_base_of
    : public integral_constant<bool, __is_base_of(_Base, _Derived)> {
};

template <typename From, typename To,
    bool = __or_<is_void<From>, is_function<To>, is_array<To> >::value>
struct __is_convertible_helper {
    typedef typename is_void<To>::type type;
};

template <typename From, typename To>
class __is_convertible_helper<From, To, false> {
    template <typename To1>
    static void __test_aux(To1);

    template <typename From1, typename To1,
        typename = decltype(__test_aux<To1>(declval<From1>()))>
    static true_type __test(int);

    template <typename, typename>
    static false_type __test(...);

  public:
    typedef decltype(__test<From, To>(0)) type;
};

template <typename From, typename To>
struct is_convertible : public __is_convertible_helper<From, To>::type {
};

template <typename T>
struct remove_const {
    typedef T type;
};

template <typename T>
struct remove_const<T const> {
    typedef T type;
};

template <typename T>
struct remove_volatile {
    typedef T type;
};

template <typename T>
struct remove_volatile<T volatile> {
    typedef T type;
};

template <typename T>
struct remove_cv {
    typedef typename remove_const<typename remove_volatile<T>::type>::type
        type;
};

template <typename T>
struct add_const {
    typedef T const type;
};

template <typename T>
struct add_volatile {
    typedef T volatile type;
};

template <typename T>
struct add_cv {
    typedef typename add_const<typename add_volatile<T>::type>::type type;
};

template <typename T>
struct remove_reference {
    typedef T type;
};

template <typename T>
struct remove_reference<T&> {
    typedef T type;
};

template <typename T>
struct remove_reference<T&&> {
    typedef T type;
};

template <typename T, bool = __is_referenceable<T>::value>
struct __add_lvalue_reference_helper {
    typedef T type;
};

template <typename T>
struct __add_lvalue_reference_helper<T, true> {
    typedef T& type;
};

template <typename T>
struct add_lvalue_reference : public __add_lvalue_reference_helper<T> {
};

template <typename T, bool = __is_referenceable<T>::value>
struct __add_rvalue_reference_helper {
    typedef T type;
};

template <typename T>
struct __add_rvalue_reference_helper<T, true> {
    typedef T&& type;
};

template <typename T>
struct add_rvalue_reference : public __add_rvalue_reference_helper<T> {
};

template <typename Unqualified, bool IsConst, bool IsVol>
struct __cv_selector;

template <typename Unqualified>
struct __cv_selector<Unqualified, false, false> {
    typedef Unqualified __type;
};

template <typename Unqualified>
struct __cv_selector<Unqualified, false, true> {
    typedef volatile Unqualified __type;
};

template <typename Unqualified>
struct __cv_selector<Unqualified, true, false> {
    typedef const Unqualified __type;
};

template <typename Unqualified>
struct __cv_selector<Unqualified, true, true> {
    typedef const volatile Unqualified __type;
};

template <typename Qualified, typename Unqualified,
    bool IsConst = is_const<Qualified>::value,
    bool IsVol = is_volatile<Qualified>::value>
class __match_cv_qualifiers {
    typedef __cv_selector<Unqualified, IsConst, IsVol> __match;

  public:
    typedef typename __match::__type __type;
};

template <typename T>
struct __make_unsigned {
    typedef T __type;
};

template <>
struct __make_unsigned<char> {
    typedef unsigned char __type;
};

template <>
struct __make_unsigned<signed char> {
    typedef unsigned char __type;
};

template <>
struct __make_unsigned<short> {
    typedef unsigned short __type;
};

template <>
struct __make_unsigned<int> {
    typedef unsigned int __type;
};

template <>
struct __make_unsigned<long> {
    typedef unsigned long __type;
};

template <>
struct __make_unsigned<long long> {
    typedef unsigned long long __type;
};

template <>
struct __make_unsigned<wchar_t> : __make_unsigned<int> {
};

template <typename T, bool _IsInt = is_integral<T>::value,
    bool _IsEnum = is_enum<T>::value>
class __make_unsigned_selector;

template <typename T>
class __make_unsigned_selector<T, true, false> {
    typedef __make_unsigned<typename remove_cv<T>::type> __unsignedt;
    typedef typename __unsignedt::__type __unsigned_type;
    typedef __match_cv_qualifiers<T, __unsigned_type> __cv_unsigned;

  public:
    typedef typename __cv_unsigned::__type __type;
};

template <typename T>
class __make_unsigned_selector<T, false, true> {
    typedef unsigned char __smallest;
    static const bool __b0 = sizeof(T) <= sizeof(__smallest);
    static const bool __b1 = sizeof(T) <= sizeof(unsigned short);
    static const bool __b2 = sizeof(T) <= sizeof(unsigned int);
    typedef conditional<__b2, unsigned int, unsigned long> __cond2;
    typedef typename __cond2::type __cond2_type;
    typedef conditional<__b1, unsigned short, __cond2_type> __cond1;
    typedef typename __cond1::type __cond1_type;

  public:
    typedef typename conditional<__b0, __smallest, __cond1_type>::type __type;
};

template <typename T>
struct make_unsigned {
    typedef typename __make_unsigned_selector<T>::__type type;
};

template <>
struct make_unsigned<bool>;

template <typename T>
struct __make_signed {
    typedef T __type;
};

template <>
struct __make_signed<char> {
    typedef signed char __type;
};

template <>
struct __make_signed<unsigned char> {
    typedef signed char __type;
};

template <>
struct __make_signed<unsigned short> {
    typedef signed short __type;
};

template <>
struct __make_signed<unsigned int> {
    typedef signed int __type;
};

template <>
struct __make_signed<unsigned long> {
    typedef signed long __type;
};

template <>
struct __make_signed<unsigned long long> {
    typedef signed long long __type;
};

template <>
struct __make_signed<char16_t> : __make_signed<uint_least16_t> {
};
template <>
struct __make_signed<char32_t> : __make_signed<uint_least32_t> {
};

template <typename T, bool _IsInt = is_integral<T>::value,
    bool _IsEnum = is_enum<T>::value>
class __make_signed_selector;

template <typename T>
class __make_signed_selector<T, true, false> {
    typedef __make_signed<typename remove_cv<T>::type> __signedt;
    typedef typename __signedt::__type __signed_type;
    typedef __match_cv_qualifiers<T, __signed_type> __cv_signed;

  public:
    typedef typename __cv_signed::__type __type;
};

template <typename T>
class __make_signed_selector<T, false, true> {
    typedef signed char __smallest;
    static const bool __b0 = sizeof(T) <= sizeof(__smallest);
    static const bool __b1 = sizeof(T) <= sizeof(signed short);
    static const bool __b2 = sizeof(T) <= sizeof(signed int);
    typedef conditional<__b2, signed int, signed long> __cond2;
    typedef typename __cond2::type __cond2_type;
    typedef conditional<__b1, signed short, __cond2_type> __cond1;
    typedef typename __cond1::type __cond1_type;

  public:
    typedef typename conditional<__b0, __smallest, __cond1_type>::type __type;
};

template <typename T>
struct make_signed {
    typedef typename __make_signed_selector<T>::__type type;
};

template <>
struct make_signed<bool>;

template <typename T>
struct remove_extent {
    typedef T type;
};

template <typename T, size_t Size>
struct remove_extent<T[Size]> {
    typedef T type;
};

template <typename T>
struct remove_extent<T[]> {
    typedef T type;
};

template <typename T>
struct remove_all_extents {
    typedef T type;
};

template <typename T, size_t Size>
struct remove_all_extents<T[Size]> {
    typedef typename remove_all_extents<T>::type type;
};

template <typename T>
struct remove_all_extents<T[]> {
    typedef typename remove_all_extents<T>::type type;
};

template <typename T, typename>
struct __remove_pointer_helper {
    typedef T type;
};

template <typename T, typename U>
struct __remove_pointer_helper<T, U*> {
    typedef U type;
};

template <typename T>
struct remove_pointer
    : public __remove_pointer_helper<T, typename remove_cv<T>::type> {
};

template <typename T,
    bool = __or_<__is_referenceable<T>, is_void<T> >::value>
struct __add_pointer_helper {
    typedef T type;
};

template <typename T>
struct __add_pointer_helper<T, true> {
    typedef typename remove_reference<T>::type* type;
};

template <typename T>
struct add_pointer : public __add_pointer_helper<T> {
};

template <size_t Len>
struct __aligned_storage_msa {
    union __type {
        unsigned char __data[Len];
        struct __attribute__((__aligned__)) {
        } __align;
    };
};

template <size_t Len, size_t _Align = __alignof__(
                           typename __aligned_storage_msa<Len>::__type)>
struct aligned_storage {
    union type {
        unsigned char __data[Len];
        struct __attribute__((__aligned__((_Align)))) {
        } __align;
    };
};

template <typename U, bool IsArray = is_array<U>::value,
    bool IsFunction = is_function<U>::value>
struct __decay_selector;

template <typename U>
struct __decay_selector<U, false, false> {
    typedef typename remove_cv<U>::type __type;
};

template <typename U>
struct __decay_selector<U, true, false> {
    typedef typename remove_extent<U>::type* __type;
};

template <typename U>
struct __decay_selector<U, false, true> {
    typedef typename add_pointer<U>::type __type;
};

template <typename T>
class decay {
    typedef typename remove_reference<T>::type __remove_type;

  public:
    typedef typename __decay_selector<__remove_type>::__type type;
};

template <typename T>
class reference_wrapper;

template <typename T>
struct __strip_reference_wrapper {
    typedef T __type;
};

template <typename T>
struct __strip_reference_wrapper<reference_wrapper<T> > {
    typedef T& __type;
};

template <typename T>
struct __decay_and_strip {
    typedef typename __strip_reference_wrapper<
        typename decay<T>::type>::__type __type;
};

template <bool, typename T = void>
struct enable_if {
};

template <typename T>
struct enable_if<true, T> {
    typedef T type;
};

template <typename... Cond>
using Require = typename enable_if<__and_<Cond...>::value>::type;

template <bool Cond, typename Iftrue, typename Iffalse>
struct conditional {
    typedef Iftrue type;
};

template <typename Iftrue, typename Iffalse>
struct conditional<false, Iftrue, Iffalse> {
    typedef Iffalse type;
};

template <typename... T>
struct common_type;

struct __do_common_type_impl {
    template <typename T, typename U>
    static __success_type<typename decay<decltype(true ? declval<T>() : declval<U>())>::type>
    _S_test(int);

    template <typename, typename>
    static __failure_type _S_test(...);
};

template <typename T, typename U>
struct __common_type_impl : private __do_common_type_impl {
    typedef decltype(_S_test<T, U>(0)) type;
};

struct __do_member_type_wrapper {
    template <typename T>
    static __success_type<typename T::type> _S_test(int);

    template <typename>
    static __failure_type _S_test(...);
};

template <typename T>
struct __member_type_wrapper : private __do_member_type_wrapper {
    typedef decltype(_S_test<T>(0)) type;
};

template <typename _CTp, typename... Args>
struct __expanded_common_type_wrapper {
    typedef common_type<typename _CTp::type, Args...> type;
};

template <typename... Args>
struct __expanded_common_type_wrapper<__failure_type, Args...> {
    typedef __failure_type type;
};

template <typename T>
struct common_type<T> {
    typedef typename decay<T>::type type;
};

template <typename T, typename U>
struct common_type<T, U> : public __common_type_impl<T, U>::type {
};

template <typename T, typename U, typename... Vp>
struct common_type<T, U, Vp...>
    : public __expanded_common_type_wrapper<
          typename __member_type_wrapper<common_type<T, U> >::type,
          Vp...>::type {
};

template <typename T>
struct underlying_type {
    typedef __underlying_type(T) type;
};

template <typename T>
struct __declval_protector {
    static const bool __stop = false;
    static typename add_rvalue_reference<T>::type __delegate();
};

template <typename T>
inline typename add_rvalue_reference<T>::type declval() noexcept
{
    static_assert(__declval_protector<T>::__stop,
        "declval() must not be used!");
    return __declval_protector<T>::__delegate();
}

template <typename _Signature>
class result_of;

struct __result_of_memfun_ref_impl {
    template <typename Fp, typename T1, typename... Args>
    static __success_type<decltype(
        (declval<T1>().*declval<Fp>())(declval<Args>()...))>
    _S_test(int);

    template <typename...>
    static __failure_type _S_test(...);
};

template <typename MemPtr, typename Arg, typename... Args>
struct __result_of_memfun_ref : private __result_of_memfun_ref_impl {
    typedef decltype(_S_test<MemPtr, Arg, Args...>(0)) type;
};

struct __result_of_memfun_deref_impl {
    template <typename Fp, typename T1, typename... Args>
    static __success_type<decltype(((*declval<T1>()).*declval<Fp>())(declval<Args>()...))>
    _S_test(int);

    template <typename...>
    static __failure_type _S_test(...);
};

template <typename MemPtr, typename Arg, typename... Args>
struct __result_of_memfun_deref : private __result_of_memfun_deref_impl {
    typedef decltype(_S_test<MemPtr, Arg, Args...>(0)) type;
};

struct __result_of_memobj_ref_impl {
    template <typename Fp, typename T1>
    static __success_type<decltype(declval<T1>().*declval<Fp>())>
    _S_test(int);

    template <typename, typename>
    static __failure_type _S_test(...);
};

template <typename MemPtr, typename Arg>
struct __result_of_memobj_ref : private __result_of_memobj_ref_impl {
    typedef decltype(_S_test<MemPtr, Arg>(0)) type;
};

struct __result_of_memobj_deref_impl {
    template <typename Fp, typename T1>
    static __success_type<decltype((*declval<T1>()).*declval<Fp>())>
    _S_test(int);

    template <typename, typename>
    static __failure_type _S_test(...);
};

template <typename MemPtr, typename Arg>
struct __result_of_memobj_deref : private __result_of_memobj_deref_impl {
    typedef decltype(_S_test<MemPtr, Arg>(0)) type;
};

template <typename MemPtr, typename Arg>
struct __result_of_memobj;

template <typename Res, typename Class, typename Arg>
struct __result_of_memobj<Res Class::*, Arg> {
    typedef typename remove_cv<typename remove_reference<Arg>::type>::type
        Argval;
    typedef Res Class::*MemPtr;
    typedef typename conditional<__or_<is_same<Argval, Class>, is_base_of<Class, Argval> >::value,
        __result_of_memobj_ref<MemPtr, Arg>,
        __result_of_memobj_deref<MemPtr, Arg> >::type::type type;
};

template <typename MemPtr, typename Arg, typename... Args>
struct __result_of_memfun;

template <typename Res, typename Class, typename Arg, typename... Args>
struct __result_of_memfun<Res Class::*, Arg, Args...> {
    typedef typename remove_cv<typename remove_reference<Arg>::type>::type
        Argval;
    typedef Res Class::*MemPtr;
    typedef typename conditional<__or_<is_same<Argval, Class>, is_base_of<Class, Argval> >::value,
        __result_of_memfun_ref<MemPtr, Arg, Args...>,
        __result_of_memfun_deref<MemPtr, Arg, Args...> >::type::type type;
};

template <bool, bool, typename Functor, typename... ArgTypes>
struct __result_of_impl {
    typedef __failure_type type;
};

template <typename MemPtr, typename Arg>
struct __result_of_impl<true, false, MemPtr, Arg>
    : public __result_of_memobj<typename decay<MemPtr>::type, Arg> {
};

template <typename MemPtr, typename Arg, typename... Args>
struct __result_of_impl<false, true, MemPtr, Arg, Args...>
    : public __result_of_memfun<typename decay<MemPtr>::type, Arg, Args...> {
};

struct __result_of_other_impl {
    template <typename Fn, typename... Args>
    static __success_type<decltype(declval<Fn>()(declval<Args>()...))>
    _S_test(int);

    template <typename...>
    static __failure_type _S_test(...);
};

template <typename Functor, typename... ArgTypes>
struct __result_of_impl<false, false, Functor, ArgTypes...>
    : private __result_of_other_impl {
    typedef decltype(_S_test<Functor, ArgTypes...>(0)) type;
};

template <typename Functor, typename... ArgTypes>
struct result_of<Functor(ArgTypes...)>
    : public __result_of_impl<is_member_object_pointer<
                                  typename remove_reference<Functor>::type>::value,
          is_member_function_pointer<
                                  typename remove_reference<Functor>::type>::value,
          Functor, ArgTypes...>::type {
};
}
