-- --------------------------------------------------------------------
-- Copyright (c) 2011 by Terasic Technologies Inc.
-- --------------------------------------------------------------------
--
-- Permission:
--
--   Terasic grants permission to use and modify this code for use
--   in synthesis for all Terasic Development Boards and Altera Development
--   Kits made by Terasic.  Other use of this code, including the selling
--   ,duplication, or modification of any portion is strictly prohibited.
--
-- Disclaimer:
--
--   This VHDL/Verilog or C/C++ source code is intended as a design reference
--   which illustrates how these types of functions can be implemented.
--   It is the user's responsibility to verify their design for
--   consistency and functionality through the use of formal
--   verification methods.  Terasic provides no warranty regarding the use
--   or functionality of this code.
--
-- --------------------------------------------------------------------
--
--                     Terasic Technologies Inc
--                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
--                     HsinChu County, Taiwan
--                     302
--
--                     web: http://www.terasic.com/
--                     email: support@terasic.com
--
-- --------------------------------------------------------------------
--
-- Major Functions: TR4 DDR3 1G
--
-- --------------------------------------------------------------------
--
-- Revision History :
-- --------------------------------------------------------------------
--   Ver  :| Author            :| Mod. Date  :| Changes Made:
--   V1.0 :| Vic chang         :| 08/26/11   :| Initial Revision
--   V1.1 :| Dee Zeng          :| 2012/03/07 :| change ddr3 ip board skew (Q11.1SP2)
--   V1.2 :| Evelyn Zhou       :| 2020/11/26 :| Update to Quartus_20.1.1
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MebX_TopLevel is
    port (
        -- BUTTON
        BUTTON              : in std_logic_vector(3 downto 0);
        
        -- FAN
        FAN_CTRL            : out std_logic;
        
        -- FLASH
        FLASH_ADV_n         : out std_logic;
        FLASH_CE_n          : out std_logic;
        FLASH_CLK           : out std_logic;
        FLASH_RDY_BSY_n     : in std_logic;
        FLASH_RESET_n       : out std_logic;
        FLASH_WP_n          : out std_logic;
        
        -- FSM
        FSM_A               : out std_logic_vector(25 downto 0);
        FSM_D               : inout std_logic_vector(31 downto 0);
        FSM_OE_n            : out std_logic;
        FSM_WE_n            : out std_logic;
        
        -- HSMA
        HSMA_CLKIN0         : in std_logic;
        HSMA_CLKIN_n1       : in std_logic;
        HSMA_CLKIN_n2       : in std_logic;
        HSMA_CLKIN_p1       : in std_logic;
        HSMA_CLKIN_p2       : in std_logic;
        HSMA_D              : inout std_logic_vector(3 downto 0);
        HSMA_OUT0           : inout std_logic;
        HSMA_OUT_n1         : inout std_logic;
        HSMA_OUT_n2         : inout std_logic;
        HSMA_OUT_p1         : inout std_logic;
        HSMA_OUT_p2         : inout std_logic;
        HSMA_RX_n           : inout std_logic_vector(16 downto 0);
        HSMA_RX_p           : inout std_logic_vector(16 downto 0);
        HSMA_TX_n           : inout std_logic_vector(16 downto 0);
        HSMA_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- HSMB
        HSMB_CLKIN0         : in std_logic;
        HSMB_CLKIN_n1       : in std_logic;
        HSMB_CLKIN_n2       : in std_logic;
        HSMB_CLKIN_p1       : in std_logic;
        HSMB_CLKIN_p2       : in std_logic;
        HSMB_D              : inout std_logic_vector(3 downto 0);
        HSMB_OUT0           : inout std_logic;
        HSMB_OUT_n1         : inout std_logic;
        HSMB_OUT_n2         : inout std_logic;
        HSMB_OUT_p1         : inout std_logic;
        HSMB_OUT_p2         : inout std_logic;
        HSMB_RX_n           : inout std_logic_vector(16 downto 0);
        HSMB_RX_p           : inout std_logic_vector(16 downto 0);
        HSMB_SCL            : out std_logic;
        HSMB_SDA            : inout std_logic;
        HSMB_TX_n           : inout std_logic_vector(16 downto 0);
        HSMB_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- HSMC
        HSMC_CLKIN0         : in std_logic;
        HSMC_CLKIN_n1       : in std_logic;
        HSMC_CLKIN_n2       : in std_logic;
        HSMC_CLKIN_p1       : in std_logic;
        HSMC_CLKIN_p2       : in std_logic;
        HSMC_CLKOUT_n1      : inout std_logic;
        HSMC_CLKOUT_p1      : inout std_logic;
        HSMC_D              : inout std_logic_vector(3 downto 0);
        HSMC_OUT0           : inout std_logic;
        HSMC_OUT_n2         : inout std_logic;
        HSMC_OUT_p2         : inout std_logic;
        HSMC_RX_n           : inout std_logic_vector(16 downto 0);
        HSMC_RX_p           : inout std_logic_vector(16 downto 0);
        HSMC_TX_n           : inout std_logic_vector(16 downto 0);
        HSMC_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- HSMD
        HSMD_CLKIN0         : in std_logic;
        HSMD_CLKIN_n1       : in std_logic;
        HSMD_CLKIN_n2       : in std_logic;
        HSMD_CLKIN_p1       : in std_logic;
        HSMD_CLKIN_p2       : in std_logic;
        HSMD_CLKOUT_n1      : inout std_logic;
        HSMD_CLKOUT_p1      : inout std_logic;
        HSMD_D              : inout std_logic_vector(3 downto 0);
        HSMD_OUT0           : inout std_logic;
        HSMD_OUT_n2         : inout std_logic;
        HSMD_OUT_p2         : inout std_logic;
        HSMD_RX_n           : inout std_logic_vector(16 downto 0);
        HSMD_RX_p           : inout std_logic_vector(16 downto 0);
        HSMD_SCL            : out std_logic;
        HSMD_SDA            : inout std_logic;
        HSMD_TX_n           : inout std_logic_vector(16 downto 0);
        HSMD_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- HSME
        HSME_CLKIN0         : in std_logic;
        HSME_CLKIN_n1       : in std_logic;
        HSME_CLKIN_n2       : in std_logic;
        HSME_CLKIN_p1       : in std_logic;
        HSME_CLKIN_p2       : in std_logic;
        HSME_CLKOUT_n1      : inout std_logic;
        HSME_CLKOUT_p1      : inout std_logic;
        HSME_D              : inout std_logic_vector(3 downto 0);
        HSME_OUT0           : inout std_logic;
        HSME_OUT_n2         : inout std_logic;
        HSME_OUT_p2         : inout std_logic;
        HSME_RX_n           : inout std_logic_vector(16 downto 0);
        HSME_RX_p           : inout std_logic_vector(16 downto 0);
        HSME_TX_n           : inout std_logic_vector(16 downto 0);
        HSME_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- HSMF
        HSMF_CLKIN0         : in std_logic;
        HSMF_CLKIN_n1       : in std_logic;
        HSMF_CLKIN_n2       : in std_logic;
        HSMF_CLKIN_p1       : in std_logic;
        HSMF_CLKIN_p2       : in std_logic;
        HSMF_CLKOUT_n1      : inout std_logic;
        HSMF_CLKOUT_n2      : inout std_logic;
        HSMF_CLKOUT_p1      : inout std_logic;
        HSMF_CLKOUT_p2      : inout std_logic;
        HSMF_D              : inout std_logic_vector(3 downto 0);
        HSMF_OUT0           : inout std_logic;
        HSMF_RX_n           : inout std_logic_vector(16 downto 0);
        HSMF_RX_p           : inout std_logic_vector(16 downto 0);
        HSMF_TX_n           : inout std_logic_vector(16 downto 0);
        HSMF_TX_p           : inout std_logic_vector(16 downto 0);
        
        -- LED
        LED                 : out std_logic_vector(3 downto 0);
        
        -- LOOP
        LOOP_CLKIN0         : in std_logic;
        LOOP_CLKOUT0        : out std_logic;
        LOOP_CLKIN1         : in std_logic;
        LOOP_CLKOUT1        : out std_logic;
        
        -- MAX2
        MAX2_CS_n           : out std_logic;
        MAX2_I2C_SCL        : out std_logic;
        MAX2_I2C_SDA        : inout std_logic;
        
        -- mem
        mem_a               : out std_logic_vector(15 downto 0);
        mem_ba              : out std_logic_vector(2 downto 0);
        mem_cas_n           : out std_logic;
        mem_cke             : out std_logic_vector(1 downto 0);
        mem_ck              : out std_logic_vector(1 downto 0); -- [1:0] for 2 rank
        mem_ck_n            : out std_logic_vector(1 downto 0);
        mem_cs_n            : out std_logic_vector(1 downto 0);
        mem_dm              : out std_logic_vector(7 downto 0);
        mem_dq              : inout std_logic_vector(63 downto 0);
        mem_dqs             : inout std_logic_vector(7 downto 0);
        mem_dqs_n           : inout std_logic_vector(7 downto 0);
        mem_event_n         : in std_logic;
        mem_odt             : out std_logic_vector(1 downto 0);
        mem_ras_n           : out std_logic;
        mem_reset_n         : out std_logic;
        mem_scl             : out std_logic;
        mem_sda             : inout std_logic;
        mem_we_n            : out std_logic;
        
        -- OSC
        OSC_50_BANK1        : in std_logic;
        OSC_50_BANK3        : in std_logic;
        OSC_50_BANK4        : in std_logic;
        OSC_50_BANK7        : in std_logic;
        OSC_50_BANK8        : in std_logic;
        
        -- mem_oct_rdn
        mem_oct_rdn         : in std_logic;
        
        -- mem_oct_rup
        mem_oct_rup         : in std_logic;
        
        -- SMA
        SMA_CLKIN           : in std_logic;
        SMA_CLKOUT          : out std_logic;
        SMA_CLKOUT_n        : out std_logic;
        SMA_CLKOUT_p        : out std_logic;
        
        -- SSRAM
        SSRAM_ADSC_n        : out std_logic;
        SSRAM_ADSP_n        : out std_logic;
        SSRAM_ADV_n         : out std_logic;
        SSRAM_BE_n          : out std_logic_vector(3 downto 0);
        SSRAM_CE1_n         : out std_logic;
        SSRAM_CLK           : out std_logic;
        
        -- SW
        SW                  : in std_logic_vector(3 downto 0);
        
        -- TEMP
        TEMP_CLK            : out std_logic;
        TEMP_DATA           : inout std_logic;
        TEMP_INT_n          : in std_logic;
        TEMP_OVERT_n        : in std_logic
    );
end MebX_TopLevel;

architecture Behavioral of MebX_TopLevel is
    signal rst_ctrl_input   : std_logic := '0';
    signal simucam_rst      : std_logic := '0';
    signal rst_n            : std_logic;
    signal uniphy_ddr3_status_local_cal_success : std_logic;
    signal uniphy_ddr3_status_local_cal_fail : std_logic;
    signal uniphy_ddr3_status_local_init_done : std_logic;
	
    component MebX_Qsys_Project is
        port (
            board_led_export                                            : out   std_logic_vector(3 downto 0);                     -- export
            button_export                                               : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
            clk50_clk                                                   : in    std_logic                     := 'X';             -- clk
            csense_adc_fo_export                                        : out   std_logic;                                        -- export
            csense_cs_n_export                                          : out   std_logic_vector(1 downto 0);                     -- export
            csense_sck_export                                           : out   std_logic;                                        -- export
            csense_sdi_export                                           : out   std_logic;                                        -- export
            csense_sdo_export                                           : in    std_logic                     := 'X';             -- export
            m0_ddr3_i2c_scl_export                                      : out   std_logic;                                        -- export
            m0_ddr3_i2c_sda_export                                      : inout std_logic                     := 'X';             -- export
            m0_ddr3_memory_mem_a                                        : out   std_logic_vector(14 downto 0);                    -- mem_a
            m0_ddr3_memory_mem_ba                                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
            m0_ddr3_memory_mem_ck                                       : out   std_logic_vector(1 downto 0);                     -- mem_ck
            m0_ddr3_memory_mem_ck_n                                     : out   std_logic_vector(1 downto 0);                     -- mem_ck_n
            m0_ddr3_memory_mem_cke                                      : out   std_logic_vector(1 downto 0);                     -- mem_cke
            m0_ddr3_memory_mem_cs_n                                     : out   std_logic_vector(1 downto 0);                     -- mem_cs_n
            m0_ddr3_memory_mem_dm                                       : out   std_logic_vector(7 downto 0);                     -- mem_dm
            m0_ddr3_memory_mem_ras_n                                    : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
            m0_ddr3_memory_mem_cas_n                                    : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
            m0_ddr3_memory_mem_we_n                                     : out   std_logic_vector(0 downto 0);                     -- mem_we_n
            m0_ddr3_memory_mem_reset_n                                  : out   std_logic;                                        -- mem_reset_n
            m0_ddr3_memory_mem_dq                                       : inout std_logic_vector(63 downto 0) := (others => 'X'); -- mem_dq
            m0_ddr3_memory_mem_dqs                                      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs
            m0_ddr3_memory_mem_dqs_n                                    : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs_n
            m0_ddr3_memory_mem_odt                                      : out   std_logic_vector(1 downto 0);                     -- mem_odt
            m0_ddr3_memory_pll_sharing_pll_mem_clk                      : out   std_logic;                                        -- pll_mem_clk
            m0_ddr3_memory_pll_sharing_pll_write_clk                    : out   std_logic;                                        -- pll_write_clk
            m0_ddr3_memory_pll_sharing_pll_locked                       : out   std_logic;                                        -- pll_locked
            m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk        : out   std_logic;                                        -- pll_write_clk_pre_phy_clk
            m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk                 : out   std_logic;                                        -- pll_addr_cmd_clk
            m0_ddr3_memory_pll_sharing_pll_avl_clk                      : out   std_logic;                                        -- pll_avl_clk
            m0_ddr3_memory_pll_sharing_pll_config_clk                   : out   std_logic;                                        -- pll_config_clk
            m0_ddr3_memory_status_local_init_done                       : out   std_logic;                                        -- local_init_done
            m0_ddr3_memory_status_local_cal_success                     : out   std_logic;                                        -- local_cal_success
            m0_ddr3_memory_status_local_cal_fail                        : out   std_logic;                                        -- local_cal_fail
            m0_ddr3_oct_rdn                                             : in    std_logic                     := 'X';             -- rdn
            m0_ddr3_oct_rup                                             : in    std_logic                     := 'X';             -- rup
            rst_reset_n                                                 : in    std_logic                     := 'X';             -- reset_n
            rst_controller_conduit_reset_input_t_reset_input_signal     : in    std_logic                     := 'X';             -- t_reset_input_signal
            rst_controller_conduit_simucam_reset_t_simucam_reset_signal : out   std_logic;                                        -- t_simucam_reset_signal
            sd_card_wp_n_io_export                                      : in    std_logic                     := 'X';             -- export
            slide_sw_export                                             : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
            temp_scl_export                                             : out   std_logic;                                        -- export
            temp_sda_export                                             : inout std_logic                     := 'X';             -- export
            timer_1ms_external_port_export                              : out   std_logic;                                        -- export
            timer_1us_external_port_export                              : out   std_logic;                                        -- export
            tristate_conduit_tcm_address_out                            : out   std_logic_vector(25 downto 0);                    -- tcm_address_out
            tristate_conduit_tcm_read_n_out                             : out   std_logic_vector(0 downto 0);                     -- tcm_read_n_out
            tristate_conduit_tcm_write_n_out                            : out   std_logic_vector(0 downto 0);                     -- tcm_write_n_out
            tristate_conduit_tcm_data_out                               : inout std_logic_vector(15 downto 0) := (others => 'X'); -- tcm_data_out
            tristate_conduit_tcm_chipselect_n_out                       : out   std_logic_vector(0 downto 0)                      -- tcm_chipselect_n_out
        );
    end component MebX_Qsys_Project;
	
begin

	rst_ctrl_input <= SW(0);
	rst_n          <= not (simucam_rst);
    FAN_CTRL <= '1';

    SOPC_INST : component MebX_Qsys_Project
        port map (
            board_led_export(3 downto 1)                                => LED(3 downto 1),                              --                            board_led.export
			   board_led_export(0)                                         => open,                                         --                            board_led.export
            button_export                                               => BUTTON,                                       --                               button.export
            clk50_clk                                                   => OSC_50_BANK8,                                 --                                clk50.clk
            m0_ddr3_i2c_scl_export                                      => mem_scl,                                      --                      m0_ddr3_i2c_scl.export
            m0_ddr3_i2c_sda_export                                      => mem_sda,                                      --                      m0_ddr3_i2c_sda.export
            m0_ddr3_memory_mem_a                                        => mem_a(14 downto 0),                           --                       m0_ddr3_memory.mem_a
            m0_ddr3_memory_mem_ba                                       => mem_ba,                                       --                                     .mem_ba
            m0_ddr3_memory_mem_ck                                       => mem_ck,                                       --                                     .mem_ck
            m0_ddr3_memory_mem_ck_n                                     => mem_ck_n,                                     --                                     .mem_ck_n
            m0_ddr3_memory_mem_cke                                      => mem_cke,                                      --                                     .mem_cke
            m0_ddr3_memory_mem_cs_n                                     => mem_cs_n,                                     --                                     .mem_cs_n
            m0_ddr3_memory_mem_dm                                       => mem_dm,                                       --                                     .mem_dm
            m0_ddr3_memory_mem_ras_n(0)                                 => mem_ras_n,                                    --                                     .mem_ras_n
            m0_ddr3_memory_mem_cas_n(0)                                 => mem_cas_n,                                    --                                     .mem_cas_n
            m0_ddr3_memory_mem_we_n(0)                                  => mem_we_n,                                     --                                     .mem_we_n
            m0_ddr3_memory_mem_reset_n                                  => mem_reset_n,                                  --                                     .mem_reset_n
            m0_ddr3_memory_mem_dq                                       => mem_dq,                                       --                                     .mem_dq
            m0_ddr3_memory_mem_dqs                                      => mem_dqs,                                      --                                     .mem_dqs
            m0_ddr3_memory_mem_dqs_n                                    => mem_dqs_n,                                    --                                     .mem_dqs_n
            m0_ddr3_memory_mem_odt                                      => mem_odt,                                      --                                     .mem_odt
            m0_ddr3_memory_status_local_init_done                       => uniphy_ddr3_status_local_init_done,           --                m0_ddr3_memory_status.local_init_done
            m0_ddr3_memory_status_local_cal_success                     => uniphy_ddr3_status_local_cal_success,         --                                     .local_cal_success
            m0_ddr3_memory_status_local_cal_fail                        => uniphy_ddr3_status_local_cal_fail,            --                                     .local_cal_fail
            m0_ddr3_oct_rdn                                             => mem_oct_rdn,                                  --                          m0_ddr3_oct.rdn
            m0_ddr3_oct_rup                                             => mem_oct_rup,                                  --                                     .rup
            rst_reset_n                                                 => rst_n,                                        --                                  rst.reset_n
            rst_controller_conduit_reset_input_t_reset_input_signal     => rst_ctrl_input,                               --   rst_controller_conduit_reset_input.t_reset_input_signal
            rst_controller_conduit_simucam_reset_t_simucam_reset_signal => simucam_rst,                                  -- rst_controller_conduit_simucam_reset.t_simucam_reset_signal
            slide_sw_export                                             => SW,                                           --                             slide_sw.export
            tristate_conduit_tcm_address_out                            => FSM_A,                                        --                     tristate_conduit.tcm_address_out
            tristate_conduit_tcm_read_n_out(0)                          => FSM_OE_n,                                     --                                     .tcm_read_n_out
            tristate_conduit_tcm_write_n_out(0)                         => FSM_WE_n,                                     --                                     .tcm_write_n_out
            tristate_conduit_tcm_data_out                               => FSM_D(15 downto 0),                           --                                     .tcm_data_out
            tristate_conduit_tcm_chipselect_n_out(0)                    => FLASH_CE_n                                    --                                     .tcm_chipselect_n_out
        );

    FLASH_RESET_n <= rst_n;
	 FLASH_WP_n    <= '1';
    FLASH_ADV_n   <= '0';
    FLASH_CLK     <= '0';

    LED(0) <= '1' and (not uniphy_ddr3_status_local_cal_success) and (not uniphy_ddr3_status_local_cal_fail) and (not uniphy_ddr3_status_local_init_done);

end Behavioral;
