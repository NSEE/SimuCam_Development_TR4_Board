// ============================================================================
// Copyright (c) 2011 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// ============================================================================
//
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
#include <stdio.h>
#include "terasic_includes.h"
#include "mem_test.h"
#include "system.h"
#include <io.h>
#include "driver/i2c/i2c.h"
#include "driver/reset/reset.h"
#include "api_driver/ddr3/ddr3.h"

#define SHOW_PROGRESS
#define TEST_I2C

/*
 * uniphy_ddr3 configuration
 *
 */

#define ALT_MODULE_CLASS_uniphy_ddr3 altera_mem_if_ddr3_emif
#define UNIPHY_DDR3_BASE 0x00000000
#define UNIPHY_DDR3_IRQ -1
#define UNIPHY_DDR3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define UNIPHY_DDR3_NAME "/dev/uniphy_ddr3"
#define UNIPHY_DDR3_SPAN 1073741824
#define UNIPHY_DDR3_TYPE "altera_mem_if_ddr3_emif"

bool DDR3_RepeatRead(int Addr, int nNum){
    bool bSuccess = TRUE;
    int i, Value, FirstValue;
    FirstValue = IORD(UNIPHY_DDR3_BASE, Addr);
    for(i=0;i<nNum;i++){
        Value = IORD(UNIPHY_DDR3_BASE, Addr);
        if (Value != FirstValue){
            printf("Data mismatch at try=%d/%d, Read=%08Xh, Expected=%08Xh\n", i, nNum, Value, FirstValue);
            bSuccess = FALSE;
        }
    }

    if (bSuccess)
        printf("Repeat read  success, addr=%d, repeat=%d, value=%08Xh\n", Addr, nNum, FirstValue);
    return bSuccess;
}

bool DDR3_I2C_Read(void){
    const alt_u8 DeviceAddr = 0xA0; // 1010-000x
    bool bSuccess;
    int i;

#if 1
    alt_u8 szData[256];
    bSuccess = I2C_MultipleRead(M0_DDR3_I2C_SCL_BASE, M0_DDR3_I2C_SDA_BASE, DeviceAddr, szData, sizeof(szData));
    if (bSuccess){
        for(i=0;i<256 && bSuccess;i++){
            printf("EEPROM[%03d]=%02Xh ", i, szData[i]);
            //
            if (i == 0)
                printf("(Number of serial PD bytes written/SPD device size/CRC coverage)\n");
            else if (i == 1)
                printf("(SPD revision)\n");
            else if (i == 2)
                printf("(Key bytes/DRAM device type[0Bh:DDR3])\n");
            else if (i == 3)
                printf("(Key byte/module type)\n");
            else if (i == 4)
                printf("(SDRAM density and banks)\n");
            else if (i == 5)
                printf("(SDRAM addressing)\n");
            else if (i == 6)
                printf("(Module nominal voltage, VDD)\n");
            else if (i == 7)
                printf("(Module organization)\n");
            else if (i == 8)
                printf("(Module memory bus width)\n");
            else if (i == 9)
                printf("(Fine timebase (FTB)dividend/divisor)\n");
            else if (i == 10)
                printf("(Medium timebass (MTB) dividend)\n");
            else if (i == 11)
                printf("(Medium timebass (MTB)divisor)\n");
            else if (i == 12)
                printf("(SDRAM minimum cycle time)\n");
            else if (i == 13)
                printf("(Reserved)\n");
            else if (i == 14)
                printf("(SDRAM /CAS latencies supported,LSB)\n");
            else if (i == 16)
                printf("(SDRAM minimum /CAS latencies time)\n");
            else if (i == 17)
                printf("(SDRAM write recovery time)\n");
            else if (i == 18)
                printf("(SDRAM minimum /RAS to CAS delay)\n");
            else if (i == 19)
                printf("(SDRAM minimum row active to row active delay)\n");
            else if (i == 20)
                printf("(SDRAM minimum row precharge time)\n");
            else if (i == 21)
                printf("(SDRAM upper nibbles for t RAS and t RC)\n");
            else if (i == 22)
                printf("(SDRAM minimum active to precharge time)\n");
            else if (i == 23)
                printf("(SDRAM minimum active to active /autorefresh time)\n");
            else if (i == 24)
                printf("(SDRAM minimum refresh recovery time delay ,LSB)\n");
            else if (i == 25)
                printf("(SDRAM minimum refresh recovery time delay ,MSB)\n");
            else if (i == 26)
                printf("(SDRAM minimum internal write to read command delay)\n");
            else if (i == 27)
                printf("(SDRAM minimum internal read to prechange command delay)\n");
            else if (i == 28)
                printf("(Upper nibble for t FAW)\n");
            else if (i == 29)
                printf("(Minimum for activate window delay time)\n");
            else if (i == 30)
                printf("(SDRAM output drivers supported)\n");
            else if (i == 31)
                printf("(SDRAM refresh options)\n");
            else if (i == 32)
                printf("(Module thermal sensor)\n");
            else if (i == 33)
                printf("(SDAM device type)\n");
            else if (i == 34)
                printf("(34to59 Reserved)\n");
            else if (i == 60)
                printf("(Module Nominal height)\n");
            else if (i == 61)
                printf("(Module maximum thickness)\n");
            else if (i == 62)
                printf("(Reference raw card used)\n");
            else if (i == 63)
                printf("(Address mapping from edge connecter to DRAM)\n");
            else if (i == 126)
                printf("(Cyclical redundancy code (CRC))\n");
            else if (i == 127)
                printf("(Cyclical redundancy code (CRC))\n");
            else if (i == 128)
                printf("(128~142: Module part number)\n");
            else
                printf("\n");
        }
    }else{
        printf("Failed to read EEPROM\n");
    }

#else
    alt_u8 ControlAddr, Value;
    printf("DDR3 EEPROM Dump\n");
    bSuccess = TRUE;
    usleep(20*1000);
    for(i=0;i<256 && bSuccess;i++){
        ControlAddr = i;
        bSuccess = I2C_Read(DDR3_I2C_SCL_BASE, DDR3_I2C_SDA_BASE, DeviceAddr, ControlAddr, &Value);
        if (bSuccess){
            printf("EEPROM[%03d]=%02Xh\n", ControlAddr, Value);
        }else{
            printf("Failed to read EEPROM\n");
        }
    }
#endif

    return bSuccess;
}


int main(){

    bool bPass, bLoop = FALSE;
    int MemSize = UNIPHY_DDR3_SPAN;
    int TimeStart, TimeElapsed, TestIndex = 0;
    alt_u32 InitValue;
    alt_u8 ButtonMask;

    vRstcReleaseSimucamReset(0);

    printf("===== TR4 DDR3 Test Program =====\n");
    printf("DDR3 Clock: 533 MHZ\n");
    printf("DDR3  Size: %d MBytes\n", UNIPHY_DDR3_SPAN/1024/1024);

#ifdef TEST_I2C
    printf("DDR3 SPD Test: Yes\n");
#endif

    while(1){
        printf("\n==========================================================\n");
        printf("Press any BUTTON to start test [BUTTON0 for continued test] \n");
        ButtonMask = 0x0F;
        while((ButtonMask & 0x0F) == 0x0F){
            ButtonMask = IORD(BUTTON_BASE, 0) & 0x0F;
        }

        if ((ButtonMask & 0x01) == 0x00){
            bLoop = TRUE;
        }else{
            bLoop = FALSE;
        }

        bPass = TRUE;
        TestIndex = 0;

        do{

            TimeStart = alt_nticks();
            TestIndex++;

#ifdef TEST_I2C
            // i2c test
            printf("=====> I2C Testing, Iteration: %d\n", TestIndex);
            if (DDR3_I2C_Read())
                printf("I2C Pass\n");
            else
                printf("I2C NG\n");
#endif

            // memory test
            printf("=====> DDR3 Testing, Iteration: %d\n", TestIndex);
            InitValue = alt_nticks();
            bPass = TMEM_Verify((alt_u32)UNIPHY_DDR3_BASE, MemSize, InitValue);
            TimeElapsed = alt_nticks()-TimeStart;
            if (bPass){
                printf("DDR3 test pass, size=%d bytes, %.3f sec\n", MemSize, (float)TimeElapsed/(float)alt_ticks_per_second());
            }else{
                printf("DDR3 test fail\n");
            }
        }while(bLoop && bPass);
    }
    return 0;

}
