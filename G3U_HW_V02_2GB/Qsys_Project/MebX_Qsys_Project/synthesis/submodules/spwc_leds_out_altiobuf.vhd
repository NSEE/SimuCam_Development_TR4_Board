-- megafunction wizard: %ALTIOBUF%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altiobuf_out 

-- ============================================================
-- File Name: spwc_leds_out_altiobuf.vhd
-- Megafunction Name(s):
-- 			altiobuf_out
--
-- Simulation Library Files(s):
-- 			stratixiv
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 18.1.0 Build 625 09/12/2018 SJ Standard Edition
-- ************************************************************


--Copyright (C) 2018  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details.


--altiobuf_out CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix IV" ENABLE_BUS_HOLD="FALSE" LEFT_SHIFT_SERIES_TERMINATION_CONTROL="FALSE" NUMBER_OF_CHANNELS=2 OPEN_DRAIN_OUTPUT="FALSE" PSEUDO_DIFFERENTIAL_MODE="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_OE="FALSE" USE_TERMINATION_CONTROL="FALSE" datain dataout
--VERSION_BEGIN 18.1 cbx_altiobuf_out 2018:09:12:13:04:24:SJ cbx_mgl 2018:09:12:13:10:36:SJ cbx_stratixiii 2018:09:12:13:04:24:SJ cbx_stratixv 2018:09:12:13:04:24:SJ  VERSION_END

 LIBRARY stratixiv;
 USE stratixiv.all;

--synthesis_resources = stratixiv_io_obuf 2 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  spwc_leds_out_altiobuf_iobuf_out_2ts IS 
	 PORT 
	 ( 
		 datain	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 dataout	:	OUT  STD_LOGIC_VECTOR (1 DOWNTO 0)
	 ); 
 END spwc_leds_out_altiobuf_iobuf_out_2ts;

 ARCHITECTURE RTL OF spwc_leds_out_altiobuf_iobuf_out_2ts IS

	 SIGNAL  wire_obufa_i	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_obufa_o	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_obufa_oe	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  oe_w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 COMPONENT  stratixiv_io_obuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		open_drain_output	:	STRING := "false";
		shift_series_termination_control	:	STRING := "false";
		sim_dynamic_termination_control_is_connected	:	STRING := "false";
		lpm_type	:	STRING := "stratixiv_io_obuf"
	 );
	 PORT
	 ( 
		dynamicterminationcontrol	:	IN STD_LOGIC := '0';
		i	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC;
		obar	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		parallelterminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0');
		seriesterminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	dataout <= wire_obufa_o;
	oe_w <= (OTHERS => '1');
	wire_obufa_i <= datain;
	wire_obufa_oe <= oe_w;
	loop0 : FOR i IN 0 TO 1 GENERATE 
	  obufa :  stratixiv_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "false",
		shift_series_termination_control => "false"
	  )
	  PORT MAP ( 
		i => wire_obufa_i(i),
		o => wire_obufa_o(i),
		oe => wire_obufa_oe(i)
	  );
	END GENERATE loop0;

 END RTL; --spwc_leds_out_altiobuf_iobuf_out_2ts
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY spwc_leds_out_altiobuf IS
	PORT
	(
		datain		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		dataout		: OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
END spwc_leds_out_altiobuf;


ARCHITECTURE RTL OF spwc_leds_out_altiobuf IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (1 DOWNTO 0);



	COMPONENT spwc_leds_out_altiobuf_iobuf_out_2ts
	PORT (
			datain	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			dataout	: OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	dataout    <= sub_wire0(1 DOWNTO 0);

	spwc_leds_out_altiobuf_iobuf_out_2ts_component : spwc_leds_out_altiobuf_iobuf_out_2ts
	PORT MAP (
		datain => datain,
		dataout => sub_wire0
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
-- Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
-- Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
-- Retrieval info: CONSTANT: number_of_channels NUMERIC "2"
-- Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
-- Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_oe STRING "FALSE"
-- Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
-- Retrieval info: USED_PORT: datain 0 0 2 0 INPUT NODEFVAL "datain[1..0]"
-- Retrieval info: USED_PORT: dataout 0 0 2 0 OUTPUT NODEFVAL "dataout[1..0]"
-- Retrieval info: CONNECT: @datain 0 0 2 0 datain 0 0 2 0
-- Retrieval info: CONNECT: dataout 0 0 2 0 @dataout 0 0 2 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf.inc TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf_inst.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL spwc_leds_out_altiobuf_syn.v TRUE
-- Retrieval info: LIB_FILE: stratixiv
