/*
 *	kernel/config.h
 *	
 *	kernel configuration
 */
#pragma once

#include <compiler.h>

#include <arch/arch.h>

#define YES 	1
#define NO 		0
#define PARTIAL 2

#define CONFIG_SMP 						YES
#define CONFIG_GUI 						YES
#define CONFIG_DEBUG 					PARTIAL
#define CONFIG_DEBUG_SERIAL 			YES
#define CONFIG_FAST_LIB_ROUTINE 		YES
#define CONFIG_KERNEL_MAP_ALL_MEM 		NO
#define CONFIG_KERNEL_FONT 				YES
#define CONFIG_USE_MACRO 				NO
#define CONFIG_BUILTIN_INTRINSICS		PARTIAL

