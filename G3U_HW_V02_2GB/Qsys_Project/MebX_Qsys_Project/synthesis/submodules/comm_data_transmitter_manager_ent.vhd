library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.fee_data_controller_pkg.all;
use work.comm_data_transmitter_pkg.all;

entity comm_data_transmitter_manager_ent is
	port(
		clk_i                           : in  std_logic;
		rst_i                           : in  std_logic;
		comm_stop_i                     : in  std_logic;
		comm_start_i                    : in  std_logic;
		channel_sync_i                  : in  std_logic;
		housekeep_only_i                : in  std_logic;
		windowing_enabled_i             : in  std_logic;
		left_imgdataman_img_finished_i  : in  std_logic;
		left_imgdataman_ovs_finished_i  : in  std_logic;
		left_imgdata_img_valid_i        : in  std_logic;
		left_imgdata_ovs_valid_i        : in  std_logic;
		right_imgdataman_img_finished_i : in  std_logic;
		right_imgdataman_ovs_finished_i : in  std_logic;
		right_imgdata_img_valid_i       : in  std_logic;
		right_imgdata_ovs_valid_i       : in  std_logic;
		data_trans_housekeep_status_i   : in  t_comm_data_trans_status;
		data_trans_fullimage_status_i   : in  t_comm_data_trans_status;
		data_trans_windowing_status_i   : in  t_comm_data_trans_status;
		data_trans_finished_o           : out std_logic;
		data_trans_housekeep_control_o  : out t_comm_data_trans_control;
		data_trans_fullimage_control_o  : out t_comm_data_trans_control;
		data_trans_windowing_control_o  : out t_comm_data_trans_control
	);
end entity comm_data_transmitter_manager_ent;

architecture RTL of comm_data_transmitter_manager_ent is

	type t_comm_data_transmitter_manager_fsm is (
		STOPPED,                        -- data transmitter is stopped
		IDLE,                           -- data transmitter is in idle
		START_HOUSEKEEP_TRANS,          -- start the housekeep transmission
		WAIT_HOUSEKEEP_TRANS,           -- wait the housekeep transmission to finish
		RESET_HOUSEKEEP_TRANS,          -- reset the housekeep transmission
		START_FULLIMAGE_TRANS,          -- start the fullimage transmission
		WAIT_FULLIMAGE_TRANS,           -- wait the fullimage transmission to finish
		RESET_FULLIMAGE_TRANS,          -- reset the fullimage transmission
		START_WINDOWING_TRANS,          -- start the windowing transmission
		WAIT_WINDOWING_TRANS,           -- wait the windowing transmission to finish
		RESET_WINDOWING_TRANS,          -- reset the windowing transmission
		START_OVERSCAN_TRANS,           -- start the overscan transmission
		WAIT_OVERSCAN_TRANS,            -- wait the overscan transmission to finish
		RESET_OVERSCAN_TRANS,           -- reset the overscan transmission
		FINISHED                        -- data transmitter is finished
	);

	signal s_comm_data_transmitter_manager_state : t_comm_data_transmitter_manager_fsm;

	-- header data
	signal s_sequence_cnt : std_logic_vector(15 downto 0);

begin

	p_comm_data_transmitter_manager : process(clk_i, rst_i) is
		variable v_comm_data_transmitter_manager_state : t_comm_data_transmitter_manager_fsm;
		variable v_leftimg_finished                    : std_logic;
		variable v_leftimg_valid                       : std_logic;
		variable v_rightimg_finished                   : std_logic;
		variable v_rightimg_valid                      : std_logic;
	begin
		if (rst_i = '1') then

			-- fsm state reset
			s_comm_data_transmitter_manager_state <= STOPPED;
			v_comm_data_transmitter_manager_state := STOPPED;

			-- internal signals reset
			s_sequence_cnt      <= (others => '0');
			v_leftimg_finished  := '0';
			v_leftimg_valid     := '0';
			v_rightimg_finished := '0';
			v_rightimg_valid    := '0';

			-- outputs reset
			data_trans_finished_o          <= '0';
			data_trans_housekeep_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;
			data_trans_fullimage_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;
			data_trans_windowing_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;

		elsif rising_edge(clk_i) then

			-- States Transition --
			-- States transitions FSM
			case (s_comm_data_transmitter_manager_state) is

				-- state "STOPPED"
				when STOPPED =>
					-- data transmitter is stopped
					-- default state transition
					s_comm_data_transmitter_manager_state <= STOPPED;
					v_comm_data_transmitter_manager_state := STOPPED;
					-- default internal signal values
					s_sequence_cnt                        <= (others => '0');
					v_leftimg_finished                    := '0';
					v_leftimg_valid                       := '0';
					v_rightimg_finished                   := '0';
					v_rightimg_valid                      := '0';
					-- conditional state transition
					-- check if a start was issued
					if (comm_start_i = '1') then
						-- start issued, go to idle
						s_comm_data_transmitter_manager_state <= IDLE;
						v_comm_data_transmitter_manager_state := IDLE;
					end if;

				-- state "IDLE"
				when IDLE =>
					-- data transmitter is in idle
					-- default state transition
					s_comm_data_transmitter_manager_state <= IDLE;
					v_comm_data_transmitter_manager_state := IDLE;
					-- default internal signal values
					s_sequence_cnt                        <= (others => '0');
					v_leftimg_finished                    := '0';
					v_leftimg_valid                       := '0';
					v_rightimg_finished                   := '0';
					v_rightimg_valid                      := '0';
					-- conditional state transition
					-- check if a channel sync was received
					if (channel_sync_i = '1') then
						-- a channel sync was received
						-- go to start housekeep trans
						s_comm_data_transmitter_manager_state <= START_HOUSEKEEP_TRANS;
						v_comm_data_transmitter_manager_state := START_HOUSEKEEP_TRANS;
					end if;

				-- state "START_HOUSEKEEP_TRANS"
				when START_HOUSEKEEP_TRANS =>
					-- start the housekeep transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_HOUSEKEEP_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_HOUSEKEEP_TRANS;
				-- default internal signal values
				-- conditional state transition

				-- state "WAIT_HOUSEKEEP_TRANS"
				when WAIT_HOUSEKEEP_TRANS =>
					-- wait the housekeep transmission to finish
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_HOUSEKEEP_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_HOUSEKEEP_TRANS;
					-- default internal signal values
					-- conditional state transition
					-- check if the housekeep trans finished the transmission
					if (data_trans_housekeep_status_i.transmission_finished = '1') then
						-- the housekeep trans finished the transmission
						-- get the next sequence counter value
						s_sequence_cnt                        <= data_trans_housekeep_status_i.sequence_cnt_next_val;
						-- go to reset housekeep trans
						s_comm_data_transmitter_manager_state <= RESET_HOUSEKEEP_TRANS;
						v_comm_data_transmitter_manager_state := RESET_HOUSEKEEP_TRANS;
					end if;

				-- state "RESET_HOUSEKEEP_TRANS"
				when RESET_HOUSEKEEP_TRANS =>
					-- reset the housekeep transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= FINISHED;
					v_comm_data_transmitter_manager_state := FINISHED;
					-- default internal signal values
					-- conditional state transition
					-- check if the image is to be transmitted
					if (housekeep_only_i = '0') then
						-- the image is to be transmitted
						-- check if the windowing is disabled
						if (windowing_enabled_i = '0') then
							-- the windowing is disabled	
							-- go to start fullimage trans
							s_comm_data_transmitter_manager_state <= START_FULLIMAGE_TRANS;
							v_comm_data_transmitter_manager_state := START_FULLIMAGE_TRANS;
						else
							-- the windowing is enabled
							-- go to start windowing trans
							s_comm_data_transmitter_manager_state <= START_WINDOWING_TRANS;
							v_comm_data_transmitter_manager_state := START_WINDOWING_TRANS;
						end if;
					end if;

				-- state "START_FULLIMAGE_TRANS"
				when START_FULLIMAGE_TRANS =>
					-- start the fullimage transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_FULLIMAGE_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_FULLIMAGE_TRANS;
					-- default internal signal values
					v_leftimg_finished                    := '0';
					v_leftimg_valid                       := '0';
					v_rightimg_finished                   := '0';
					v_rightimg_valid                      := '0';
				-- conditional state transition

				-- state "WAIT_FULLIMAGE_TRANS"
				when WAIT_FULLIMAGE_TRANS =>
					-- wait the fullimage transmission to finish
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_FULLIMAGE_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_FULLIMAGE_TRANS;
					-- default internal signal values
					-- conditional state transition
					-- check if the left imgdata manager image is finished
					if (left_imgdataman_img_finished_i = '1') then
						-- the left imgdata manager image is finished
						-- set the leftimg finished flag 
						v_leftimg_finished := '1';
					end if;
					-- check if the right imgdata manager image is finished
					if (right_imgdataman_img_finished_i = '1') then
						-- the right imgdata manager image is finished
						-- set the rightimg finished flag 
						v_rightimg_finished := '1';
					end if;
					-- check if the left imgdata image is valid
					if (left_imgdata_img_valid_i = '1') then
						-- the  left imgdata image is valid
						-- set the leftimg valid flag 
						v_leftimg_valid := '1';
					end if;
					-- check if the right imgdata image is valid
					if (right_imgdata_img_valid_i = '1') then
						-- the  right imgdata image is valid
						-- set the rightimg valid flag 
						v_rightimg_valid := '1';
					end if;
					-- check if the fullimage trans finished the transmission
					if (data_trans_fullimage_status_i.transmission_finished = '1') then
						-- the fullimage trans finished the transmission
						-- get the next sequence counter value
						s_sequence_cnt                        <= data_trans_fullimage_status_i.sequence_cnt_next_val;
						-- go to reset fullimage trans
						s_comm_data_transmitter_manager_state <= RESET_FULLIMAGE_TRANS;
						v_comm_data_transmitter_manager_state := RESET_FULLIMAGE_TRANS;
					end if;

				-- state "RESET_FULLIMAGE_TRANS"
				when RESET_FULLIMAGE_TRANS =>
					-- reset the fullimage transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= START_OVERSCAN_TRANS;
					v_comm_data_transmitter_manager_state := START_OVERSCAN_TRANS;
				-- default internal signal values
				-- conditional state transition

				-- state "START_WINDOWING_TRANS"
				when START_WINDOWING_TRANS =>
					-- start the windowing transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_WINDOWING_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_WINDOWING_TRANS;
					-- default internal signal values
					v_leftimg_finished                    := '0';
					v_leftimg_valid                       := '0';
					v_rightimg_finished                   := '0';
					v_rightimg_valid                      := '0';
				-- conditional state transition

				-- state "WAIT_WINDOWING_TRANS"
				when WAIT_WINDOWING_TRANS =>
					-- wait the windowing transmission to finish
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_WINDOWING_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_WINDOWING_TRANS;
					-- default internal signal values
					-- conditional state transition
					-- check if the left imgdata manager image is finished
					if (left_imgdataman_img_finished_i = '1') then
						-- the left imgdata manager image is finished
						-- set the leftimg finished flag 
						v_leftimg_finished := '1';
					end if;
					-- check if the right imgdata manager image is finished
					if (right_imgdataman_img_finished_i = '1') then
						-- the right imgdata manager image is finished
						-- set the rightimg finished flag 
						v_rightimg_finished := '1';
					end if;
					-- check if the left imgdata image is valid
					if (left_imgdata_img_valid_i = '1') then
						-- the  left imgdata image is valid
						-- set the leftimg valid flag 
						v_leftimg_valid := '1';
					end if;
					-- check if the right imgdata image is valid
					if (right_imgdata_img_valid_i = '1') then
						-- the  right imgdata image is valid
						-- set the rightimg valid flag 
						v_rightimg_valid := '1';
					end if;
					-- check if the windowing trans finished the transmission
					if (data_trans_windowing_status_i.transmission_finished = '1') then
						-- the windowing trans finished the transmission
						-- get the next sequence counter value
						s_sequence_cnt                        <= data_trans_windowing_status_i.sequence_cnt_next_val;
						-- go to reset windowing trans
						s_comm_data_transmitter_manager_state <= RESET_WINDOWING_TRANS;
						v_comm_data_transmitter_manager_state := RESET_WINDOWING_TRANS;
					end if;

				-- state "RESET_WINDOWING_TRANS"
				when RESET_WINDOWING_TRANS =>
					-- reset the windowing transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= START_OVERSCAN_TRANS;
					v_comm_data_transmitter_manager_state := START_OVERSCAN_TRANS;
				-- default internal signal values
				-- conditional state transition

				-- state "START_OVERSCAN_TRANS"
				when START_OVERSCAN_TRANS =>
					-- start the overscan transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_OVERSCAN_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_OVERSCAN_TRANS;
					-- default internal signal values
					v_leftimg_finished                    := '0';
					v_leftimg_valid                       := '0';
					v_rightimg_finished                   := '0';
					v_rightimg_valid                      := '0';
				-- conditional state transition

				-- state "WAIT_OVERSCAN_TRANS"
				when WAIT_OVERSCAN_TRANS =>
					-- wait the overscan transmission to finish
					-- default state transition
					s_comm_data_transmitter_manager_state <= WAIT_OVERSCAN_TRANS;
					v_comm_data_transmitter_manager_state := WAIT_OVERSCAN_TRANS;
					-- default internal signal values
					-- conditional state transition
					-- check if the left imgdata manager overscan is finished
					if (left_imgdataman_ovs_finished_i = '1') then
						-- the left imgdata manager overscan is finished
						-- set the leftimg finished flag 
						v_leftimg_finished := '1';
					end if;
					-- check if the right imgdata manager overscan is finished
					if (right_imgdataman_ovs_finished_i = '1') then
						-- the right imgdata manager overscan is finished
						-- set the rightimg finished flag 
						v_rightimg_finished := '1';
					end if;
					-- check if the left imgdata overscan is valid
					if (left_imgdata_ovs_valid_i = '1') then
						-- the  left imgdata overscan is valid
						-- set the leftimg valid flag 
						v_leftimg_valid := '1';
					end if;
					-- check if the right imgdata overscan is valid
					if (right_imgdata_ovs_valid_i = '1') then
						-- the  right imgdata overscan is valid
						-- set the rightimg valid flag 
						v_rightimg_valid := '1';
					end if;
					-- check if the overscan trans finished the transmission
					if (data_trans_fullimage_status_i.transmission_finished = '1') then
						-- the overscan trans finished the transmission
						-- get the next sequence counter value
						s_sequence_cnt                        <= data_trans_fullimage_status_i.sequence_cnt_next_val;
						-- go to reset overscan trans
						s_comm_data_transmitter_manager_state <= RESET_OVERSCAN_TRANS;
						v_comm_data_transmitter_manager_state := RESET_OVERSCAN_TRANS;
					end if;

				-- state "RESET_OVERSCAN_TRANS"
				when RESET_OVERSCAN_TRANS =>
					-- reset the overscan transmission
					-- default state transition
					s_comm_data_transmitter_manager_state <= FINISHED;
					v_comm_data_transmitter_manager_state := FINISHED;
				-- default internal signal values
				-- conditional state transition

				-- state "FINISHED"
				when FINISHED =>
					-- data transmitter is finished
					-- default state transition
					s_comm_data_transmitter_manager_state <= FINISHED;
					v_comm_data_transmitter_manager_state := FINISHED;
					-- default internal signal values
					s_sequence_cnt                        <= (others => '0');
				-- conditional state transition

				-- all the other states (not defined)
				when others =>
					s_comm_data_transmitter_manager_state <= STOPPED;
					v_comm_data_transmitter_manager_state := STOPPED;

			end case;

			-- check if a stop was issued
			if (comm_stop_i = '1') then
				-- a stop was issued
				-- go to stopped
				s_comm_data_transmitter_manager_state <= STOPPED;
				v_comm_data_transmitter_manager_state := STOPPED;
			end if;

			-- Output Generation --
			-- Default output generation
			data_trans_finished_o          <= '0';
			data_trans_housekeep_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;
			data_trans_fullimage_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;
			data_trans_windowing_control_o <= c_COMM_DATA_TRANS_CONTROL_RST;
			-- Output generation FSM
			case (v_comm_data_transmitter_manager_state) is

				-- state "STOPPED"
				when STOPPED =>
					-- data transmitter is stopped
					-- default output signals
					null;
				-- conditional output signals

				-- state "IDLE"
				when IDLE =>
					-- data transmitter is in idle
					-- default output signals
					null;
				-- conditional output signals

				-- state "START_HOUSEKEEP_TRANS"
				when START_HOUSEKEEP_TRANS =>
					-- start the housekeep transmission
					-- default output signals
					data_trans_housekeep_control_o.start_transmission    <= '1';
					data_trans_housekeep_control_o.sequence_cnt_init_val <= s_sequence_cnt;
				-- conditional output signals

				-- state "WAIT_HOUSEKEEP_TRANS"
				when WAIT_HOUSEKEEP_TRANS =>
					-- wait the housekeep transmission to finish
					-- default output signals
					null;
				-- conditional output signals

				-- state "RESET_HOUSEKEEP_TRANS"
				when RESET_HOUSEKEEP_TRANS =>
					-- reset the housekeep transmission
					-- default output signals
					data_trans_housekeep_control_o.reset_transmitter <= '1';
				-- conditional output signals

				-- state "START_FULLIMAGE_TRANS"
				when START_FULLIMAGE_TRANS =>
					-- start the fullimage transmission
					-- default output signals
					data_trans_fullimage_control_o.start_transmission    <= '1';
					data_trans_fullimage_control_o.sequence_cnt_init_val <= s_sequence_cnt;
				-- conditional output signals

				-- state "WAIT_FULLIMAGE_TRANS"
				when WAIT_FULLIMAGE_TRANS =>
					-- wait the fullimage transmission to finish
					-- default output signals
					data_trans_fullimage_control_o.leftimg_finished  <= v_leftimg_finished;
					data_trans_fullimage_control_o.leftimg_valid     <= v_leftimg_valid;
					data_trans_fullimage_control_o.rightimg_finished <= v_rightimg_finished;
					data_trans_fullimage_control_o.rightimg_valid    <= v_rightimg_valid;
				-- conditional output signals

				-- state "RESET_FULLIMAGE_TRANS"
				when RESET_FULLIMAGE_TRANS =>
					-- reset the fullimage transmission
					-- default output signals
					data_trans_fullimage_control_o.reset_transmitter <= '1';
				-- conditional output signals

				-- state "START_WINDOWING_TRANS"
				when START_WINDOWING_TRANS =>
					-- start the windowing transmission
					-- default output signals
					data_trans_windowing_control_o.start_transmission    <= '1';
					data_trans_windowing_control_o.sequence_cnt_init_val <= s_sequence_cnt;
				-- conditional output signals

				-- state "WAIT_WINDOWING_TRANS"
				when WAIT_WINDOWING_TRANS =>
					-- wait the windowing transmission to finish
					-- default output signals
					data_trans_windowing_control_o.leftimg_finished  <= v_leftimg_finished;
					data_trans_windowing_control_o.leftimg_valid     <= v_leftimg_valid;
					data_trans_windowing_control_o.rightimg_finished <= v_rightimg_finished;
					data_trans_windowing_control_o.rightimg_valid    <= v_rightimg_valid;
				-- conditional output signals

				-- state "RESET_WINDOWING_TRANS"
				when RESET_WINDOWING_TRANS =>
					-- reset the windowing transmission
					-- default output signals
					data_trans_windowing_control_o.reset_transmitter <= '1';
				-- conditional output signals

				-- state "START_OVERSCAN_TRANS"
				when START_OVERSCAN_TRANS =>
					-- start the overscan transmission
					-- default output signals
					data_trans_fullimage_control_o.start_transmission    <= '1';
					data_trans_fullimage_control_o.sequence_cnt_init_val <= s_sequence_cnt;
				-- conditional output signals

				-- state "WAIT_OVERSCAN_TRANS"
				when WAIT_OVERSCAN_TRANS =>
					-- wait the overscan transmission to finish
					-- default output signals
					data_trans_fullimage_control_o.leftimg_finished  <= v_leftimg_finished;
					data_trans_fullimage_control_o.leftimg_valid     <= v_leftimg_valid;
					data_trans_fullimage_control_o.rightimg_finished <= v_rightimg_finished;
					data_trans_fullimage_control_o.rightimg_valid    <= v_rightimg_valid;
				-- conditional output signals

				-- state "RESET_OVERSCAN_TRANS"
				when RESET_OVERSCAN_TRANS =>
					-- reset the overscan transmission
					-- default output signals
					data_trans_fullimage_control_o.reset_transmitter <= '1';
				-- conditional output signals

				-- state "FINISHED"
				when FINISHED =>
					-- data transmitter is finished
					-- default output signals
					data_trans_finished_o <= '1';
					-- conditional output signals

			end case;

		end if;
	end process p_comm_data_transmitter_manager;

end architecture RTL;
