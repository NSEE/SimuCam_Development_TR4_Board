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


FUNCTION ftdi_data_dc_fifo 
(
	aclr,
	data[35..0],
	rdclk,
	rdreq,
	wrclk,
	wrreq
)

RETURNS (
	q[35..0],
	rdempty,
	rdfull,
	rdusedw[11..0],
	wrempty,
	wrfull,
	wrusedw[11..0]
);
