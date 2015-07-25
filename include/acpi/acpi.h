/*
	include/kernel/acpi.h
	
	ACPI -- Advanced Configuration and Power Interface
*/

#pragma once

#include <kernel/kernel.h>

namespace ACPI {
	
	/*
		RSDP: Root System Descriptor Pointer
	*/
	struct RSDP {
		char Signature[8];		// Should be "RSD PTR "
		u8 Checksum;			// The first part checksum
		char OEMID[6];
		u8 Revision;
		dword RsdtAddress;
	/*
		The part below only appears in ACPI version 2.0+
		But we assume that modern computers are based on higher version of ACPI
		And we must use XSDT instead of RSDT (for ACPI version 2.0+)
	*/
		u32 Length;
		qword XsdtAddress;
		u8 ExtendedChecksum;	// The entire RSDP checksum, including the first part
		u8 Reserved[3]; 	
	}__packed__;

	struct SDTHeader {
		char Signature[4];		// Variable for each table
		u32 Length;				// Whole table length, not this header's length
		u8 Revision;
		u8 Checksum;			// Whole table checksum
		char OEMID[6];
		char OEMTableID[8];
		u32 OEMRevision;
		u32 CreatorID;
		u32 CreatorRevision;
	}__packed__;

	/*
		Note: RSDT is obsolete. We should use XSDT instead.
	*/
	struct RSDT {
		struct SDTHeader Header;
	//	Header.Signature should be "RSDT"
		dword Entry[0];
	/*	
		Note: GCC Extension used (0 length array)
		It means there'll be variable count of entries
		Actually, the count of Entry is [(length - sizeof(Header)) / 4]
		where length is AcpiSDTHeader.Length (Header means the same with AcpiSDTHeader)
	*/
	}__packed__;

	/*
		What we should use is THIS
		XSDT: eXtended System Descriptor Table
	*/
	struct XSDT {
		struct AcpiSDTHeader Header;
	//	Header.Signature should be "XSDT"
		qword Entry[0];
	/*	
		Note: GCC Extension used (0 length array)
		It means there'll be variable count of entries
		Actually, the count of Entry is [(length - sizeof(Header)) / 8]
		where length is AcpiSDTHeader.Length (Header means the same with AcpiSDTHeader)
	*/
	}__packed__;

	/* 
		This structure is used in some tables.
		Name it GAS for short.
	*/
	struct GenericAddressStructure {
  		u8 AddressSpace;
  		u8 BitWidth;
  		u8 BitOffset;
  		u8 AccessSize;
  		qword Address;
	}__packed__;

	/*
		FADT: Fixed ACPI Description Table
		Very long and complex...
	*/
	struct FADT {
		struct SDTHeader Header;
	//	Note: The signature should be "FACP" (predates ACPI 1.0, for compatibility)
	
		u32 FirmwareCtrl;
		u32 DSDT;
	
	//	field used in ACPI 1.0; no longer in use, for compatibility only
		u8 Reserved;
	
		u8  PreferredPowerManagementProfile;
    	u16 SCI_Interrupt;
    	u32 SMI_CommandPort;
    	u8  AcpiEnable;
    	u8  AcpiDisable;
    	u8  S4BIOS_REQ;
    	u8  PSTATE_Control;
    	u32 PM1aEventBlock;
    	u32 PM1bEventBlock;
    	u32 PM1aControlBlock;
    	u32 PM1bControlBlock;
    	u32 PM2ControlBlock;
    	u32 PMTimerBlock;
    	u32 GPE0Block;
    	u32 GPE1Block;
    	u8  PM1EventLength;
    	u8  PM1ControlLength;
    	u8  PM2ControlLength;
    	u8  PMTimerLength;
    	u8  GPE0Length;
    	u8  GPE1Length;
    	u8  GPE1Base;
    	u8  CStateControl;
    	u16 WorstC2Latency;
    	u16 WorstC3Latency;
    	u16 FlushSize;
    	u16 FlushStride;
    	u8  DutyOffset;
    	u8  DutyWidth;
    	u8  DayAlarm;
    	u8  MonthAlarm;
    	u8  Century;
 
	//	reserved in ACPI 1.0; used since ACPI 2.0+
    	u16 BootArchitectureFlags;
 
    	u8  Reserved2;
    	u32 Flags;
 
    	struct GenericAddressStructure ResetReg;
 
    	u8  ResetValue;
    	u8  Reserved3[3];
 
	// 	64-bit pointers - Available on ACPI 2.0+
    	qword X_FirmwareControl;
    	qword X_DSDT;
 
    	struct GenericAddressStructure X_PM1aEventBlock;
    	struct GenericAddressStructure X_PM1bEventBlock;
    	struct GenericAddressStructure X_PM1aControlBlock;
    	struct GenericAddressStructure X_PM1bControlBlock;
    	struct GenericAddressStructure X_PM2ControlBlock;
    	struct GenericAddressStructure X_PMTimerBlock;
    	struct GenericAddressStructure X_GPE0Block;
    	struct GenericAddressStructure X_GPE1Block;
    	struct GenericAddressStructure SleepControlReg;
    	struct GenericAddressStructure SleepStatusReg;
	}__packed__;

/*
	typedef struct AcpiRSDP ACPI_RSDP;
	typedef struct AcpiSDTHeader ACPI_SDT_HEADER;
	typedef struct AcpiRSDT ACPI_RSDT;
	typedef struct AcpiXSDT ACPI_XSDT;
	typedef struct GenericAddressStructure ACPI_GAS;
*/
	typedef struct GenericAddressStructure GAS;


}
