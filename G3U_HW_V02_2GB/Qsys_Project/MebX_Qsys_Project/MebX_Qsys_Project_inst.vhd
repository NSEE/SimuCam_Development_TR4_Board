	component MebX_Qsys_Project is
		port (
			clk50_clk                                                   : in    std_logic                     := 'X';             -- clk
			csense_adc_fo_export                                        : out   std_logic;                                        -- export
			csense_cs_n_export                                          : out   std_logic_vector(1 downto 0);                     -- export
			csense_sck_export                                           : out   std_logic;                                        -- export
			csense_sdi_export                                           : out   std_logic;                                        -- export
			csense_sdo_export                                           : in    std_logic                     := 'X';             -- export
			m0_ddr3_i2c_scl_export                                      : out   std_logic;                                        -- export
			m0_ddr3_i2c_sda_export                                      : inout std_logic                     := 'X';             -- export
			m0_ddr3_memory_mem_a                                        : out   std_logic_vector(13 downto 0);                    -- mem_a
			m0_ddr3_memory_mem_ba                                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
			m0_ddr3_memory_mem_ck                                       : out   std_logic_vector(0 downto 0);                     -- mem_ck
			m0_ddr3_memory_mem_ck_n                                     : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			m0_ddr3_memory_mem_cke                                      : out   std_logic_vector(0 downto 0);                     -- mem_cke
			m0_ddr3_memory_mem_cs_n                                     : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			m0_ddr3_memory_mem_dm                                       : out   std_logic_vector(7 downto 0);                     -- mem_dm
			m0_ddr3_memory_mem_ras_n                                    : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			m0_ddr3_memory_mem_cas_n                                    : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			m0_ddr3_memory_mem_we_n                                     : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			m0_ddr3_memory_mem_reset_n                                  : out   std_logic;                                        -- mem_reset_n
			m0_ddr3_memory_mem_dq                                       : inout std_logic_vector(63 downto 0) := (others => 'X'); -- mem_dq
			m0_ddr3_memory_mem_dqs                                      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs
			m0_ddr3_memory_mem_dqs_n                                    : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dqs_n
			m0_ddr3_memory_mem_odt                                      : out   std_logic_vector(0 downto 0);                     -- mem_odt
			m0_ddr3_oct_rdn                                             : in    std_logic                     := 'X';             -- rdn
			m0_ddr3_oct_rup                                             : in    std_logic                     := 'X';             -- rup
			rst_reset_n                                                 : in    std_logic                     := 'X';             -- reset_n
			rst_controller_conduit_reset_input_t_reset_input_signal     : in    std_logic                     := 'X';             -- t_reset_input_signal
			rst_controller_conduit_simucam_reset_t_simucam_reset_signal : out   std_logic;                                        -- t_simucam_reset_signal
			sd_card_wp_n_io_export                                      : in    std_logic                     := 'X';             -- export
			temp_scl_export                                             : out   std_logic;                                        -- export
			temp_sda_export                                             : inout std_logic                     := 'X';             -- export
			timer_1ms_external_port_export                              : out   std_logic;                                        -- export
			timer_1us_external_port_export                              : out   std_logic;                                        -- export
			tristate_conduit_tcm_address_out                            : out   std_logic_vector(25 downto 0);                    -- tcm_address_out
			tristate_conduit_tcm_read_n_out                             : out   std_logic_vector(0 downto 0);                     -- tcm_read_n_out
			tristate_conduit_tcm_write_n_out                            : out   std_logic_vector(0 downto 0);                     -- tcm_write_n_out
			tristate_conduit_tcm_data_out                               : inout std_logic_vector(15 downto 0) := (others => 'X'); -- tcm_data_out
			tristate_conduit_tcm_chipselect_n_out                       : out   std_logic_vector(0 downto 0);                     -- tcm_chipselect_n_out
			m0_ddr3_memory_status_local_init_done                       : out   std_logic;                                        -- local_init_done
			m0_ddr3_memory_status_local_cal_success                     : out   std_logic;                                        -- local_cal_success
			m0_ddr3_memory_status_local_cal_fail                        : out   std_logic;                                        -- local_cal_fail
			m0_ddr3_memory_pll_sharing_pll_mem_clk                      : out   std_logic;                                        -- pll_mem_clk
			m0_ddr3_memory_pll_sharing_pll_write_clk                    : out   std_logic;                                        -- pll_write_clk
			m0_ddr3_memory_pll_sharing_pll_locked                       : out   std_logic;                                        -- pll_locked
			m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk        : out   std_logic;                                        -- pll_write_clk_pre_phy_clk
			m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk                 : out   std_logic;                                        -- pll_addr_cmd_clk
			m0_ddr3_memory_pll_sharing_pll_avl_clk                      : out   std_logic;                                        -- pll_avl_clk
			m0_ddr3_memory_pll_sharing_pll_config_clk                   : out   std_logic;                                        -- pll_config_clk
			button_export                                               : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			slide_sw_export                                             : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			board_led_export                                            : out   std_logic_vector(3 downto 0)                      -- export
		);
	end component MebX_Qsys_Project;

	u0 : component MebX_Qsys_Project
		port map (
			clk50_clk                                                   => CONNECTED_TO_clk50_clk,                                                   --                                clk50.clk
			csense_adc_fo_export                                        => CONNECTED_TO_csense_adc_fo_export,                                        --                        csense_adc_fo.export
			csense_cs_n_export                                          => CONNECTED_TO_csense_cs_n_export,                                          --                          csense_cs_n.export
			csense_sck_export                                           => CONNECTED_TO_csense_sck_export,                                           --                           csense_sck.export
			csense_sdi_export                                           => CONNECTED_TO_csense_sdi_export,                                           --                           csense_sdi.export
			csense_sdo_export                                           => CONNECTED_TO_csense_sdo_export,                                           --                           csense_sdo.export
			m0_ddr3_i2c_scl_export                                      => CONNECTED_TO_m0_ddr3_i2c_scl_export,                                      --                      m0_ddr3_i2c_scl.export
			m0_ddr3_i2c_sda_export                                      => CONNECTED_TO_m0_ddr3_i2c_sda_export,                                      --                      m0_ddr3_i2c_sda.export
			m0_ddr3_memory_mem_a                                        => CONNECTED_TO_m0_ddr3_memory_mem_a,                                        --                       m0_ddr3_memory.mem_a
			m0_ddr3_memory_mem_ba                                       => CONNECTED_TO_m0_ddr3_memory_mem_ba,                                       --                                     .mem_ba
			m0_ddr3_memory_mem_ck                                       => CONNECTED_TO_m0_ddr3_memory_mem_ck,                                       --                                     .mem_ck
			m0_ddr3_memory_mem_ck_n                                     => CONNECTED_TO_m0_ddr3_memory_mem_ck_n,                                     --                                     .mem_ck_n
			m0_ddr3_memory_mem_cke                                      => CONNECTED_TO_m0_ddr3_memory_mem_cke,                                      --                                     .mem_cke
			m0_ddr3_memory_mem_cs_n                                     => CONNECTED_TO_m0_ddr3_memory_mem_cs_n,                                     --                                     .mem_cs_n
			m0_ddr3_memory_mem_dm                                       => CONNECTED_TO_m0_ddr3_memory_mem_dm,                                       --                                     .mem_dm
			m0_ddr3_memory_mem_ras_n                                    => CONNECTED_TO_m0_ddr3_memory_mem_ras_n,                                    --                                     .mem_ras_n
			m0_ddr3_memory_mem_cas_n                                    => CONNECTED_TO_m0_ddr3_memory_mem_cas_n,                                    --                                     .mem_cas_n
			m0_ddr3_memory_mem_we_n                                     => CONNECTED_TO_m0_ddr3_memory_mem_we_n,                                     --                                     .mem_we_n
			m0_ddr3_memory_mem_reset_n                                  => CONNECTED_TO_m0_ddr3_memory_mem_reset_n,                                  --                                     .mem_reset_n
			m0_ddr3_memory_mem_dq                                       => CONNECTED_TO_m0_ddr3_memory_mem_dq,                                       --                                     .mem_dq
			m0_ddr3_memory_mem_dqs                                      => CONNECTED_TO_m0_ddr3_memory_mem_dqs,                                      --                                     .mem_dqs
			m0_ddr3_memory_mem_dqs_n                                    => CONNECTED_TO_m0_ddr3_memory_mem_dqs_n,                                    --                                     .mem_dqs_n
			m0_ddr3_memory_mem_odt                                      => CONNECTED_TO_m0_ddr3_memory_mem_odt,                                      --                                     .mem_odt
			m0_ddr3_oct_rdn                                             => CONNECTED_TO_m0_ddr3_oct_rdn,                                             --                          m0_ddr3_oct.rdn
			m0_ddr3_oct_rup                                             => CONNECTED_TO_m0_ddr3_oct_rup,                                             --                                     .rup
			rst_reset_n                                                 => CONNECTED_TO_rst_reset_n,                                                 --                                  rst.reset_n
			rst_controller_conduit_reset_input_t_reset_input_signal     => CONNECTED_TO_rst_controller_conduit_reset_input_t_reset_input_signal,     --   rst_controller_conduit_reset_input.t_reset_input_signal
			rst_controller_conduit_simucam_reset_t_simucam_reset_signal => CONNECTED_TO_rst_controller_conduit_simucam_reset_t_simucam_reset_signal, -- rst_controller_conduit_simucam_reset.t_simucam_reset_signal
			sd_card_wp_n_io_export                                      => CONNECTED_TO_sd_card_wp_n_io_export,                                      --                      sd_card_wp_n_io.export
			temp_scl_export                                             => CONNECTED_TO_temp_scl_export,                                             --                             temp_scl.export
			temp_sda_export                                             => CONNECTED_TO_temp_sda_export,                                             --                             temp_sda.export
			timer_1ms_external_port_export                              => CONNECTED_TO_timer_1ms_external_port_export,                              --              timer_1ms_external_port.export
			timer_1us_external_port_export                              => CONNECTED_TO_timer_1us_external_port_export,                              --              timer_1us_external_port.export
			tristate_conduit_tcm_address_out                            => CONNECTED_TO_tristate_conduit_tcm_address_out,                            --                     tristate_conduit.tcm_address_out
			tristate_conduit_tcm_read_n_out                             => CONNECTED_TO_tristate_conduit_tcm_read_n_out,                             --                                     .tcm_read_n_out
			tristate_conduit_tcm_write_n_out                            => CONNECTED_TO_tristate_conduit_tcm_write_n_out,                            --                                     .tcm_write_n_out
			tristate_conduit_tcm_data_out                               => CONNECTED_TO_tristate_conduit_tcm_data_out,                               --                                     .tcm_data_out
			tristate_conduit_tcm_chipselect_n_out                       => CONNECTED_TO_tristate_conduit_tcm_chipselect_n_out,                       --                                     .tcm_chipselect_n_out
			m0_ddr3_memory_status_local_init_done                       => CONNECTED_TO_m0_ddr3_memory_status_local_init_done,                       --                m0_ddr3_memory_status.local_init_done
			m0_ddr3_memory_status_local_cal_success                     => CONNECTED_TO_m0_ddr3_memory_status_local_cal_success,                     --                                     .local_cal_success
			m0_ddr3_memory_status_local_cal_fail                        => CONNECTED_TO_m0_ddr3_memory_status_local_cal_fail,                        --                                     .local_cal_fail
			m0_ddr3_memory_pll_sharing_pll_mem_clk                      => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_mem_clk,                      --           m0_ddr3_memory_pll_sharing.pll_mem_clk
			m0_ddr3_memory_pll_sharing_pll_write_clk                    => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_write_clk,                    --                                     .pll_write_clk
			m0_ddr3_memory_pll_sharing_pll_locked                       => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_locked,                       --                                     .pll_locked
			m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk        => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk,        --                                     .pll_write_clk_pre_phy_clk
			m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk                 => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk,                 --                                     .pll_addr_cmd_clk
			m0_ddr3_memory_pll_sharing_pll_avl_clk                      => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_avl_clk,                      --                                     .pll_avl_clk
			m0_ddr3_memory_pll_sharing_pll_config_clk                   => CONNECTED_TO_m0_ddr3_memory_pll_sharing_pll_config_clk,                   --                                     .pll_config_clk
			button_export                                               => CONNECTED_TO_button_export,                                               --                               button.export
			slide_sw_export                                             => CONNECTED_TO_slide_sw_export,                                             --                             slide_sw.export
			board_led_export                                            => CONNECTED_TO_board_led_export                                             --                            board_led.export
		);

