
module MebX_Qsys_Project (
	board_led_export,
	button_export,
	clk50_clk,
	csense_adc_fo_export,
	csense_cs_n_export,
	csense_sck_export,
	csense_sdi_export,
	csense_sdo_export,
	m0_ddr3_i2c_scl_export,
	m0_ddr3_i2c_sda_export,
	m0_ddr3_memory_mem_a,
	m0_ddr3_memory_mem_ba,
	m0_ddr3_memory_mem_ck,
	m0_ddr3_memory_mem_ck_n,
	m0_ddr3_memory_mem_cke,
	m0_ddr3_memory_mem_cs_n,
	m0_ddr3_memory_mem_dm,
	m0_ddr3_memory_mem_ras_n,
	m0_ddr3_memory_mem_cas_n,
	m0_ddr3_memory_mem_we_n,
	m0_ddr3_memory_mem_reset_n,
	m0_ddr3_memory_mem_dq,
	m0_ddr3_memory_mem_dqs,
	m0_ddr3_memory_mem_dqs_n,
	m0_ddr3_memory_mem_odt,
	m0_ddr3_memory_pll_sharing_pll_mem_clk,
	m0_ddr3_memory_pll_sharing_pll_write_clk,
	m0_ddr3_memory_pll_sharing_pll_locked,
	m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk,
	m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk,
	m0_ddr3_memory_pll_sharing_pll_avl_clk,
	m0_ddr3_memory_pll_sharing_pll_config_clk,
	m0_ddr3_memory_status_local_init_done,
	m0_ddr3_memory_status_local_cal_success,
	m0_ddr3_memory_status_local_cal_fail,
	m0_ddr3_oct_rdn,
	m0_ddr3_oct_rup,
	rst_reset_n,
	rst_controller_conduit_reset_input_t_reset_input_signal,
	rst_controller_conduit_simucam_reset_t_simucam_reset_signal,
	sd_card_wp_n_io_export,
	slide_sw_export,
	temp_scl_export,
	temp_sda_export,
	timer_1ms_external_port_export,
	timer_1us_external_port_export,
	tristate_conduit_tcm_address_out,
	tristate_conduit_tcm_read_n_out,
	tristate_conduit_tcm_write_n_out,
	tristate_conduit_tcm_data_out,
	tristate_conduit_tcm_chipselect_n_out);	

	output	[3:0]	board_led_export;
	input	[3:0]	button_export;
	input		clk50_clk;
	output		csense_adc_fo_export;
	output	[1:0]	csense_cs_n_export;
	output		csense_sck_export;
	output		csense_sdi_export;
	input		csense_sdo_export;
	output		m0_ddr3_i2c_scl_export;
	inout		m0_ddr3_i2c_sda_export;
	output	[14:0]	m0_ddr3_memory_mem_a;
	output	[2:0]	m0_ddr3_memory_mem_ba;
	output	[1:0]	m0_ddr3_memory_mem_ck;
	output	[1:0]	m0_ddr3_memory_mem_ck_n;
	output	[1:0]	m0_ddr3_memory_mem_cke;
	output	[1:0]	m0_ddr3_memory_mem_cs_n;
	output	[7:0]	m0_ddr3_memory_mem_dm;
	output	[0:0]	m0_ddr3_memory_mem_ras_n;
	output	[0:0]	m0_ddr3_memory_mem_cas_n;
	output	[0:0]	m0_ddr3_memory_mem_we_n;
	output		m0_ddr3_memory_mem_reset_n;
	inout	[63:0]	m0_ddr3_memory_mem_dq;
	inout	[7:0]	m0_ddr3_memory_mem_dqs;
	inout	[7:0]	m0_ddr3_memory_mem_dqs_n;
	output	[1:0]	m0_ddr3_memory_mem_odt;
	output		m0_ddr3_memory_pll_sharing_pll_mem_clk;
	output		m0_ddr3_memory_pll_sharing_pll_write_clk;
	output		m0_ddr3_memory_pll_sharing_pll_locked;
	output		m0_ddr3_memory_pll_sharing_pll_write_clk_pre_phy_clk;
	output		m0_ddr3_memory_pll_sharing_pll_addr_cmd_clk;
	output		m0_ddr3_memory_pll_sharing_pll_avl_clk;
	output		m0_ddr3_memory_pll_sharing_pll_config_clk;
	output		m0_ddr3_memory_status_local_init_done;
	output		m0_ddr3_memory_status_local_cal_success;
	output		m0_ddr3_memory_status_local_cal_fail;
	input		m0_ddr3_oct_rdn;
	input		m0_ddr3_oct_rup;
	input		rst_reset_n;
	input		rst_controller_conduit_reset_input_t_reset_input_signal;
	output		rst_controller_conduit_simucam_reset_t_simucam_reset_signal;
	input		sd_card_wp_n_io_export;
	input	[3:0]	slide_sw_export;
	output		temp_scl_export;
	inout		temp_sda_export;
	output		timer_1ms_external_port_export;
	output		timer_1us_external_port_export;
	output	[25:0]	tristate_conduit_tcm_address_out;
	output	[0:0]	tristate_conduit_tcm_read_n_out;
	output	[0:0]	tristate_conduit_tcm_write_n_out;
	inout	[15:0]	tristate_conduit_tcm_data_out;
	output	[0:0]	tristate_conduit_tcm_chipselect_n_out;
endmodule
