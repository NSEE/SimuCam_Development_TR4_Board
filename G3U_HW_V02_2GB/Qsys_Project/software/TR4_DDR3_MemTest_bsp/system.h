/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2_0' in SOPC Builder design 'MebX_Qsys_Project'
 * SOPC Builder design path: ../../MebX_Qsys_Project.sopcinfo
 *
 * Generated: Mon Jun 10 01:24:10 BRT 2024
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x81218820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 133333300u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x20
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x81100020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 133333300
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 1
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_DIVISION_ERROR_EXCEPTION
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INST_ADDR_WIDTH 0x20
#define ALT_CPU_NAME "nios2_gen2_0"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x86020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x81218820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 133333300u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x20
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x81100020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 1
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_DIVISION_ERROR_EXCEPTION
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INST_ADDR_WIDTH 0x20
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x86020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_ADDRESS_SPAN_EXTENDER
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_GENERIC_TRISTATE_CONTROLLER
#define __ALTERA_NIOS2_GEN2
#define __MEMORY_FILLER
#define __RST_CONTROLLER


/*
 * Memory_Filler configuration
 *
 */

#define ALT_MODULE_CLASS_Memory_Filler Memory_Filler
#define MEMORY_FILLER_BASE 0x82000000
#define MEMORY_FILLER_IRQ -1
#define MEMORY_FILLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MEMORY_FILLER_NAME "/dev/Memory_Filler"
#define MEMORY_FILLER_SPAN 1024
#define MEMORY_FILLER_TYPE "Memory_Filler"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Stratix IV"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x8121af50
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x8121af50
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x8121af50
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "MebX_Qsys_Project"


/*
 * board_led configuration
 *
 */

#define ALT_MODULE_CLASS_board_led altera_avalon_pio
#define BOARD_LED_BASE 0x80000a80
#define BOARD_LED_BIT_CLEARING_EDGE_REGISTER 0
#define BOARD_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BOARD_LED_CAPTURE 0
#define BOARD_LED_DATA_WIDTH 4
#define BOARD_LED_DO_TEST_BENCH_WIRING 0
#define BOARD_LED_DRIVEN_SIM_VALUE 0
#define BOARD_LED_EDGE_TYPE "NONE"
#define BOARD_LED_FREQ 50000000
#define BOARD_LED_HAS_IN 0
#define BOARD_LED_HAS_OUT 1
#define BOARD_LED_HAS_TRI 0
#define BOARD_LED_IRQ -1
#define BOARD_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BOARD_LED_IRQ_TYPE "NONE"
#define BOARD_LED_NAME "/dev/board_led"
#define BOARD_LED_RESET_VALUE 15
#define BOARD_LED_SPAN 16
#define BOARD_LED_TYPE "altera_avalon_pio"


/*
 * button configuration
 *
 */

#define ALT_MODULE_CLASS_button altera_avalon_pio
#define BUTTON_BASE 0x80000a60
#define BUTTON_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_CAPTURE 0
#define BUTTON_DATA_WIDTH 4
#define BUTTON_DO_TEST_BENCH_WIRING 0
#define BUTTON_DRIVEN_SIM_VALUE 0
#define BUTTON_EDGE_TYPE "NONE"
#define BUTTON_FREQ 50000000
#define BUTTON_HAS_IN 1
#define BUTTON_HAS_OUT 0
#define BUTTON_HAS_TRI 0
#define BUTTON_IRQ -1
#define BUTTON_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BUTTON_IRQ_TYPE "NONE"
#define BUTTON_NAME "/dev/button"
#define BUTTON_RESET_VALUE 0
#define BUTTON_SPAN 16
#define BUTTON_TYPE "altera_avalon_pio"


/*
 * csense_adc_fo configuration
 *
 */

#define ALT_MODULE_CLASS_csense_adc_fo altera_avalon_pio
#define CSENSE_ADC_FO_BASE 0x80000910
#define CSENSE_ADC_FO_BIT_CLEARING_EDGE_REGISTER 0
#define CSENSE_ADC_FO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CSENSE_ADC_FO_CAPTURE 0
#define CSENSE_ADC_FO_DATA_WIDTH 1
#define CSENSE_ADC_FO_DO_TEST_BENCH_WIRING 0
#define CSENSE_ADC_FO_DRIVEN_SIM_VALUE 0
#define CSENSE_ADC_FO_EDGE_TYPE "NONE"
#define CSENSE_ADC_FO_FREQ 50000000
#define CSENSE_ADC_FO_HAS_IN 0
#define CSENSE_ADC_FO_HAS_OUT 1
#define CSENSE_ADC_FO_HAS_TRI 0
#define CSENSE_ADC_FO_IRQ -1
#define CSENSE_ADC_FO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CSENSE_ADC_FO_IRQ_TYPE "NONE"
#define CSENSE_ADC_FO_NAME "/dev/csense_adc_fo"
#define CSENSE_ADC_FO_RESET_VALUE 0
#define CSENSE_ADC_FO_SPAN 16
#define CSENSE_ADC_FO_TYPE "altera_avalon_pio"


/*
 * csense_cs_n configuration
 *
 */

#define ALT_MODULE_CLASS_csense_cs_n altera_avalon_pio
#define CSENSE_CS_N_BASE 0x80000920
#define CSENSE_CS_N_BIT_CLEARING_EDGE_REGISTER 0
#define CSENSE_CS_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CSENSE_CS_N_CAPTURE 0
#define CSENSE_CS_N_DATA_WIDTH 2
#define CSENSE_CS_N_DO_TEST_BENCH_WIRING 0
#define CSENSE_CS_N_DRIVEN_SIM_VALUE 0
#define CSENSE_CS_N_EDGE_TYPE "NONE"
#define CSENSE_CS_N_FREQ 50000000
#define CSENSE_CS_N_HAS_IN 0
#define CSENSE_CS_N_HAS_OUT 1
#define CSENSE_CS_N_HAS_TRI 0
#define CSENSE_CS_N_IRQ -1
#define CSENSE_CS_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CSENSE_CS_N_IRQ_TYPE "NONE"
#define CSENSE_CS_N_NAME "/dev/csense_cs_n"
#define CSENSE_CS_N_RESET_VALUE 0
#define CSENSE_CS_N_SPAN 16
#define CSENSE_CS_N_TYPE "altera_avalon_pio"


/*
 * csense_sck configuration
 *
 */

#define ALT_MODULE_CLASS_csense_sck altera_avalon_pio
#define CSENSE_SCK_BASE 0x80000930
#define CSENSE_SCK_BIT_CLEARING_EDGE_REGISTER 0
#define CSENSE_SCK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CSENSE_SCK_CAPTURE 0
#define CSENSE_SCK_DATA_WIDTH 1
#define CSENSE_SCK_DO_TEST_BENCH_WIRING 0
#define CSENSE_SCK_DRIVEN_SIM_VALUE 0
#define CSENSE_SCK_EDGE_TYPE "NONE"
#define CSENSE_SCK_FREQ 50000000
#define CSENSE_SCK_HAS_IN 0
#define CSENSE_SCK_HAS_OUT 1
#define CSENSE_SCK_HAS_TRI 0
#define CSENSE_SCK_IRQ -1
#define CSENSE_SCK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CSENSE_SCK_IRQ_TYPE "NONE"
#define CSENSE_SCK_NAME "/dev/csense_sck"
#define CSENSE_SCK_RESET_VALUE 0
#define CSENSE_SCK_SPAN 16
#define CSENSE_SCK_TYPE "altera_avalon_pio"


/*
 * csense_sdi configuration
 *
 */

#define ALT_MODULE_CLASS_csense_sdi altera_avalon_pio
#define CSENSE_SDI_BASE 0x80000940
#define CSENSE_SDI_BIT_CLEARING_EDGE_REGISTER 0
#define CSENSE_SDI_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CSENSE_SDI_CAPTURE 0
#define CSENSE_SDI_DATA_WIDTH 1
#define CSENSE_SDI_DO_TEST_BENCH_WIRING 0
#define CSENSE_SDI_DRIVEN_SIM_VALUE 0
#define CSENSE_SDI_EDGE_TYPE "NONE"
#define CSENSE_SDI_FREQ 50000000
#define CSENSE_SDI_HAS_IN 0
#define CSENSE_SDI_HAS_OUT 1
#define CSENSE_SDI_HAS_TRI 0
#define CSENSE_SDI_IRQ -1
#define CSENSE_SDI_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CSENSE_SDI_IRQ_TYPE "NONE"
#define CSENSE_SDI_NAME "/dev/csense_sdi"
#define CSENSE_SDI_RESET_VALUE 0
#define CSENSE_SDI_SPAN 16
#define CSENSE_SDI_TYPE "altera_avalon_pio"


/*
 * csense_sdo configuration
 *
 */

#define ALT_MODULE_CLASS_csense_sdo altera_avalon_pio
#define CSENSE_SDO_BASE 0x80000950
#define CSENSE_SDO_BIT_CLEARING_EDGE_REGISTER 0
#define CSENSE_SDO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CSENSE_SDO_CAPTURE 0
#define CSENSE_SDO_DATA_WIDTH 1
#define CSENSE_SDO_DO_TEST_BENCH_WIRING 0
#define CSENSE_SDO_DRIVEN_SIM_VALUE 0
#define CSENSE_SDO_EDGE_TYPE "NONE"
#define CSENSE_SDO_FREQ 50000000
#define CSENSE_SDO_HAS_IN 1
#define CSENSE_SDO_HAS_OUT 0
#define CSENSE_SDO_HAS_TRI 0
#define CSENSE_SDO_IRQ -1
#define CSENSE_SDO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CSENSE_SDO_IRQ_TYPE "NONE"
#define CSENSE_SDO_NAME "/dev/csense_sdo"
#define CSENSE_SDO_RESET_VALUE 0
#define CSENSE_SDO_SPAN 16
#define CSENSE_SDO_TYPE "altera_avalon_pio"


/*
 * ddr2_address_span_extender_cntl configuration
 *
 */

#define ALT_MODULE_CLASS_ddr2_address_span_extender_cntl altera_address_span_extender
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_BASE 0x8101e000
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_BURSTCOUNT_WIDTH 8
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_BYTEENABLE_WIDTH 4
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_CNTL_ADDRESS_WIDTH 1
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_DATA_WIDTH 32
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_IRQ -1
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_MASTER_ADDRESS_WIDTH 0x20
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_MAX_BURST_BYTES 512
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_MAX_BURST_WORDS 128
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_NAME "/dev/ddr2_address_span_extender_cntl"
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_SLAVE_ADDRESS_SHIFT 0x2
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_SLAVE_ADDRESS_WIDTH 0x1d
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_SPAN 8
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_SUB_WINDOW_COUNT 1
#define DDR2_ADDRESS_SPAN_EXTENDER_CNTL_TYPE "altera_address_span_extender"


/*
 * ddr2_address_span_extender_windowed_slave configuration
 *
 */

#define ALT_MODULE_CLASS_ddr2_address_span_extender_windowed_slave altera_address_span_extender
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_BASE 0x0
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_BURSTCOUNT_WIDTH 8
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_BYTEENABLE_WIDTH 4
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_CNTL_ADDRESS_WIDTH 1
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_DATA_WIDTH 32
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_IRQ -1
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_MASTER_ADDRESS_WIDTH 0x20
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_MAX_BURST_BYTES 512
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_MAX_BURST_WORDS 128
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_NAME "/dev/ddr2_address_span_extender_windowed_slave"
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_SLAVE_ADDRESS_SHIFT 0x2
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_SLAVE_ADDRESS_WIDTH 0x1d
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_SPAN 2147483648
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_SUB_WINDOW_COUNT 1
#define DDR2_ADDRESS_SPAN_EXTENDER_WINDOWED_SLAVE_TYPE "altera_address_span_extender"


/*
 * ext_flash configuration
 *
 */

#define ALT_MODULE_CLASS_ext_flash altera_generic_tristate_controller
#define EXT_FLASH_BASE 0x84000000
#define EXT_FLASH_HOLD_VALUE 20
#define EXT_FLASH_IRQ -1
#define EXT_FLASH_IRQ_INTERRUPT_CONTROLLER_ID -1
#define EXT_FLASH_NAME "/dev/ext_flash"
#define EXT_FLASH_SETUP_VALUE 25
#define EXT_FLASH_SIZE 33554432u
#define EXT_FLASH_SPAN 67108864
#define EXT_FLASH_TIMING_UNITS "ns"
#define EXT_FLASH_TYPE "altera_generic_tristate_controller"
#define EXT_FLASH_WAIT_VALUE 100


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_1MS
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x8121af50
#define JTAG_UART_IRQ 14
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * m0_ddr3_i2c_scl configuration
 *
 */

#define ALT_MODULE_CLASS_m0_ddr3_i2c_scl altera_avalon_pio
#define M0_DDR3_I2C_SCL_BASE 0x80000960
#define M0_DDR3_I2C_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define M0_DDR3_I2C_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define M0_DDR3_I2C_SCL_CAPTURE 0
#define M0_DDR3_I2C_SCL_DATA_WIDTH 1
#define M0_DDR3_I2C_SCL_DO_TEST_BENCH_WIRING 0
#define M0_DDR3_I2C_SCL_DRIVEN_SIM_VALUE 0
#define M0_DDR3_I2C_SCL_EDGE_TYPE "NONE"
#define M0_DDR3_I2C_SCL_FREQ 50000000
#define M0_DDR3_I2C_SCL_HAS_IN 0
#define M0_DDR3_I2C_SCL_HAS_OUT 1
#define M0_DDR3_I2C_SCL_HAS_TRI 0
#define M0_DDR3_I2C_SCL_IRQ -1
#define M0_DDR3_I2C_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define M0_DDR3_I2C_SCL_IRQ_TYPE "NONE"
#define M0_DDR3_I2C_SCL_NAME "/dev/m0_ddr3_i2c_scl"
#define M0_DDR3_I2C_SCL_RESET_VALUE 0
#define M0_DDR3_I2C_SCL_SPAN 16
#define M0_DDR3_I2C_SCL_TYPE "altera_avalon_pio"


/*
 * m0_ddr3_i2c_sda configuration
 *
 */

#define ALT_MODULE_CLASS_m0_ddr3_i2c_sda altera_avalon_pio
#define M0_DDR3_I2C_SDA_BASE 0x80000970
#define M0_DDR3_I2C_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define M0_DDR3_I2C_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define M0_DDR3_I2C_SDA_CAPTURE 0
#define M0_DDR3_I2C_SDA_DATA_WIDTH 1
#define M0_DDR3_I2C_SDA_DO_TEST_BENCH_WIRING 0
#define M0_DDR3_I2C_SDA_DRIVEN_SIM_VALUE 0
#define M0_DDR3_I2C_SDA_EDGE_TYPE "NONE"
#define M0_DDR3_I2C_SDA_FREQ 50000000
#define M0_DDR3_I2C_SDA_HAS_IN 0
#define M0_DDR3_I2C_SDA_HAS_OUT 0
#define M0_DDR3_I2C_SDA_HAS_TRI 1
#define M0_DDR3_I2C_SDA_IRQ -1
#define M0_DDR3_I2C_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define M0_DDR3_I2C_SDA_IRQ_TYPE "NONE"
#define M0_DDR3_I2C_SDA_NAME "/dev/m0_ddr3_i2c_sda"
#define M0_DDR3_I2C_SDA_RESET_VALUE 0
#define M0_DDR3_I2C_SDA_SPAN 16
#define M0_DDR3_I2C_SDA_TYPE "altera_avalon_pio"


/*
 * onchip_memory configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory altera_avalon_onchip_memory2
#define ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY_BASE 0x81100000
#define ONCHIP_MEMORY_CONTENTS_INFO ""
#define ONCHIP_MEMORY_DUAL_PORT 0
#define ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "M9K"
#define ONCHIP_MEMORY_INIT_CONTENTS_FILE "MebX_Qsys_Project_onchip_memory"
#define ONCHIP_MEMORY_INIT_MEM_CONTENT 0
#define ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY_IRQ -1
#define ONCHIP_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY_NAME "/dev/onchip_memory"
#define ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY_RAM_BLOCK_TYPE "M9K"
#define ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY_SIZE_VALUE 786432
#define ONCHIP_MEMORY_SPAN 786432
#define ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY_WRITABLE 1


/*
 * rst_controller configuration
 *
 */

#define ALT_MODULE_CLASS_rst_controller rst_controller
#define RST_CONTROLLER_BASE 0x80000800
#define RST_CONTROLLER_IRQ -1
#define RST_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RST_CONTROLLER_NAME "/dev/rst_controller"
#define RST_CONTROLLER_SPAN 64
#define RST_CONTROLLER_TYPE "rst_controller"


/*
 * sd_card_wp_n configuration
 *
 */

#define ALT_MODULE_CLASS_sd_card_wp_n altera_avalon_pio
#define SD_CARD_WP_N_BASE 0x800009a0
#define SD_CARD_WP_N_BIT_CLEARING_EDGE_REGISTER 0
#define SD_CARD_WP_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SD_CARD_WP_N_CAPTURE 0
#define SD_CARD_WP_N_DATA_WIDTH 1
#define SD_CARD_WP_N_DO_TEST_BENCH_WIRING 0
#define SD_CARD_WP_N_DRIVEN_SIM_VALUE 0
#define SD_CARD_WP_N_EDGE_TYPE "NONE"
#define SD_CARD_WP_N_FREQ 50000000
#define SD_CARD_WP_N_HAS_IN 1
#define SD_CARD_WP_N_HAS_OUT 0
#define SD_CARD_WP_N_HAS_TRI 0
#define SD_CARD_WP_N_IRQ -1
#define SD_CARD_WP_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_CARD_WP_N_IRQ_TYPE "NONE"
#define SD_CARD_WP_N_NAME "/dev/sd_card_wp_n"
#define SD_CARD_WP_N_RESET_VALUE 0
#define SD_CARD_WP_N_SPAN 16
#define SD_CARD_WP_N_TYPE "altera_avalon_pio"


/*
 * slide_sw configuration
 *
 */

#define ALT_MODULE_CLASS_slide_sw altera_avalon_pio
#define SLIDE_SW_BASE 0x80000a70
#define SLIDE_SW_BIT_CLEARING_EDGE_REGISTER 0
#define SLIDE_SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SLIDE_SW_CAPTURE 0
#define SLIDE_SW_DATA_WIDTH 4
#define SLIDE_SW_DO_TEST_BENCH_WIRING 0
#define SLIDE_SW_DRIVEN_SIM_VALUE 0
#define SLIDE_SW_EDGE_TYPE "NONE"
#define SLIDE_SW_FREQ 50000000
#define SLIDE_SW_HAS_IN 1
#define SLIDE_SW_HAS_OUT 0
#define SLIDE_SW_HAS_TRI 0
#define SLIDE_SW_IRQ -1
#define SLIDE_SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SLIDE_SW_IRQ_TYPE "NONE"
#define SLIDE_SW_NAME "/dev/slide_sw"
#define SLIDE_SW_RESET_VALUE 0
#define SLIDE_SW_SPAN 16
#define SLIDE_SW_TYPE "altera_avalon_pio"


/*
 * sysid_qsys configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys altera_avalon_sysid_qsys
#define SYSID_QSYS_BASE 0x8121af40
#define SYSID_QSYS_ID 113
#define SYSID_QSYS_IRQ -1
#define SYSID_QSYS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_NAME "/dev/sysid_qsys"
#define SYSID_QSYS_SPAN 8
#define SYSID_QSYS_TIMESTAMP 1717865818
#define SYSID_QSYS_TYPE "altera_avalon_sysid_qsys"


/*
 * temp_scl configuration
 *
 */

#define ALT_MODULE_CLASS_temp_scl altera_avalon_pio
#define TEMP_SCL_BASE 0x80000990
#define TEMP_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define TEMP_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TEMP_SCL_CAPTURE 0
#define TEMP_SCL_DATA_WIDTH 1
#define TEMP_SCL_DO_TEST_BENCH_WIRING 0
#define TEMP_SCL_DRIVEN_SIM_VALUE 0
#define TEMP_SCL_EDGE_TYPE "NONE"
#define TEMP_SCL_FREQ 50000000
#define TEMP_SCL_HAS_IN 0
#define TEMP_SCL_HAS_OUT 1
#define TEMP_SCL_HAS_TRI 0
#define TEMP_SCL_IRQ -1
#define TEMP_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TEMP_SCL_IRQ_TYPE "NONE"
#define TEMP_SCL_NAME "/dev/temp_scl"
#define TEMP_SCL_RESET_VALUE 0
#define TEMP_SCL_SPAN 16
#define TEMP_SCL_TYPE "altera_avalon_pio"


/*
 * temp_sda configuration
 *
 */

#define ALT_MODULE_CLASS_temp_sda altera_avalon_pio
#define TEMP_SDA_BASE 0x80000980
#define TEMP_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define TEMP_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TEMP_SDA_CAPTURE 0
#define TEMP_SDA_DATA_WIDTH 1
#define TEMP_SDA_DO_TEST_BENCH_WIRING 0
#define TEMP_SDA_DRIVEN_SIM_VALUE 0
#define TEMP_SDA_EDGE_TYPE "NONE"
#define TEMP_SDA_FREQ 50000000
#define TEMP_SDA_HAS_IN 0
#define TEMP_SDA_HAS_OUT 0
#define TEMP_SDA_HAS_TRI 1
#define TEMP_SDA_IRQ -1
#define TEMP_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TEMP_SDA_IRQ_TYPE "NONE"
#define TEMP_SDA_NAME "/dev/temp_sda"
#define TEMP_SDA_RESET_VALUE 0
#define TEMP_SDA_SPAN 16
#define TEMP_SDA_TYPE "altera_avalon_pio"


/*
 * timer_1ms configuration
 *
 */

#define ALT_MODULE_CLASS_timer_1ms altera_avalon_timer
#define TIMER_1MS_ALWAYS_RUN 1
#define TIMER_1MS_BASE 0x80000880
#define TIMER_1MS_COUNTER_SIZE 32
#define TIMER_1MS_FIXED_PERIOD 0
#define TIMER_1MS_FREQ 50000000
#define TIMER_1MS_IRQ 0
#define TIMER_1MS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_1MS_LOAD_VALUE 49999
#define TIMER_1MS_MULT 0.001
#define TIMER_1MS_NAME "/dev/timer_1ms"
#define TIMER_1MS_PERIOD 1
#define TIMER_1MS_PERIOD_UNITS "ms"
#define TIMER_1MS_RESET_OUTPUT 0
#define TIMER_1MS_SNAPSHOT 1
#define TIMER_1MS_SPAN 32
#define TIMER_1MS_TICKS_PER_SEC 1000
#define TIMER_1MS_TIMEOUT_PULSE_OUTPUT 1
#define TIMER_1MS_TYPE "altera_avalon_timer"


/*
 * timer_1us configuration
 *
 */

#define ALT_MODULE_CLASS_timer_1us altera_avalon_timer
#define TIMER_1US_ALWAYS_RUN 1
#define TIMER_1US_BASE 0x80000860
#define TIMER_1US_COUNTER_SIZE 32
#define TIMER_1US_FIXED_PERIOD 0
#define TIMER_1US_FREQ 50000000
#define TIMER_1US_IRQ 1
#define TIMER_1US_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_1US_LOAD_VALUE 49
#define TIMER_1US_MULT 1.0E-6
#define TIMER_1US_NAME "/dev/timer_1us"
#define TIMER_1US_PERIOD 1
#define TIMER_1US_PERIOD_UNITS "us"
#define TIMER_1US_RESET_OUTPUT 0
#define TIMER_1US_SNAPSHOT 1
#define TIMER_1US_SPAN 32
#define TIMER_1US_TICKS_PER_SEC 1000000
#define TIMER_1US_TIMEOUT_PULSE_OUTPUT 1
#define TIMER_1US_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
