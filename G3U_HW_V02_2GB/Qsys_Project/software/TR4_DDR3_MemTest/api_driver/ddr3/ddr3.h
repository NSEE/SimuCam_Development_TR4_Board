/**
 * @file   ddr3.h
 * @Author Rodrigo França (rodrigo.franca@maua.br | rodmarfra@gmail.com)
 * @date   Junho, 2024
 * @brief  Header File para testes e acesso as memórias DDR3 da DE4
 *
 * Exemplo de utilização:
 *
 *
 *
 */

#ifndef DDR3_H_
#define DDR3_H_

/* includes */
#include "../../terasic_includes.h"
#include "../../driver/i2c/i2c.h"

/* address */
#define DDR3_EXT_ADDR_WINDOWED_BASE     DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_BASE
#define DDR3_EXT_ADDR_CONTROL_BASE      DDR2_ADDRESS_SPAN_EXTENDER_CNTL_BASE
#define DDR3_M0_LOWER_HALF_MEMORY_BASE  0x00000000
#define DDR3_M0_UPPER_HALF_MEMORY_BASE  0x80000000
#define DDR3_M0_EEPROM_I2C_SCL_BASE     M0_DDR3_I2C_SCL_BASE
#define DDR3_M0_EEPROM_I2C_SDA_BASE     M0_DDR3_I2C_SDA_BASE

/* defines */
#define DDR3_EXT_ADDR_WINDOWED_SPAN     (2 ^ DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_SLAVE_ADDRESS_WIDTH)
#define DDR3_EXT_ADDR_WINDOWED_MASK     (DDR2_EXT_ADDR_WINDOWED_SPAN - 1)
#define DDR3_M0_LOWER_MEM_WIND_OFST     0x00000000
#define DDR3_M0_LOWER_ID                0x00
#define DDR3_M0_LOWER_MEMORY_SIZE       2147483648
#define DDR3_M0_UPPER_MEM_WIND_OFST     0x80000000
#define DDR3_M0_UPPER_ID                0x01
#define DDR3_M0_UPPER_MEMORY_SIZE       2147483648
#define DDR3_EEPROM_I2C_ADDRESS         0xA0
#define DDR3_VERBOSE                    TRUE
#define DDR3_NO_VERBOSE                 FALSE
#define DDR3_TIME                       TRUE
#define DDR3_NO_TIME                    FALSE

#define DDR3_M0_LOWER_BASE_ADDR         (alt_u64)0x0000000000000000
#define DDR3_M0_LOWER_SPAN              (alt_u32)0x7FFFFFFF
#define DDR3_M0_UPPER_BASE_ADDR         (alt_u64)0x0000000080000000
#define DDR3_M0_UPPER_SPAN              (alt_u32)x7FFFFFFF

union Ddr2MemoryAddress {
	alt_u64 ulliMemAddr64b;
	alt_u32 uliMemAddr32b[2];
};

enum Ddr3DdrMemId {
	eDdr3Memory0Lower = 0, eDdr3Memory0Upper
} EDdr3DdrMemId;

/* prototype */
bool bDdr3EepromTest(alt_u8 ucMemoryId);
bool bDdr3EepromDump(alt_u8 ucMemoryId);
bool bDdr3SwitchMemory(alt_u8 ucMemoryId);
bool bDdr3MemoryWriteTest(alt_u8 ucMemoryId);
bool bDdr3MemoryReadTest(alt_u8 ucMemoryId);
bool bDdr3MemoryRandomWriteTest(alt_u8 ucMemoryId, bool bVerbose, bool bTime);
bool bDdr3MemoryRandomReadTest(alt_u8 ucMemoryId, bool bVerbose, bool bTime);

#endif /* DDR3_H_ */
