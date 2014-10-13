----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:18:26 10/12/2014 
-- Design Name: 
-- Module Name:    serial_to_parallel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
------------- serial to parallel -------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------
ENTITY serial_to_parallel IS
PORT ( data_in: IN std_logic;
		clk, rst: IN std_logic;
		data_out: OUT std_logic_vector (7 DOWNTO 0));
END serial_to_parallel;
----------------------------------------------------
ARCHITECTURE Behavioral OF serial_to_parallel IS
	SIGNAL clk_2Hz: std_logic;
	TYPE state_type IS (idle,data);
	SIGNAL state_reg, state_next: state_type;
	SIGNAL counter_reg, counter_next: integer RANGE 0 TO 7;
	SIGNAL temp_reg, temp_next: std_logic_vector(7 DOWNTO 0);
BEGIN
	-------2 Hz clock for board-level testing----
	clk2Hz: entity work.frequency_divider(Behavioral)
	GENERIC MAP (M=>25_000_000)
	PORT MAP (clk_in=>clk, rst=>rst, clk_out=>clk_2Hz);
	------- state & data registers ---------------
	PROCESS (clk_2Hz, rst)
	BEGIN
		IF (rst = '1') THEN
			state_reg <= idle;
			counter_reg <= 0;
			temp_reg <= (OTHERS => '0');
		ELSIF (clk_2Hz'EVENT and clk_2Hz='1') THEN
			state_reg <= state_next;
			counter_reg <= counter_next;
			temp_reg <= temp_next;
		END IF;
		END PROCESS;
		---------- next state logic & data path ----------
		PROCESS (state_reg, counter_reg, temp_reg, clk_2Hz, data_in)
		BEGIN
			state_next <= state_reg;
			counter_next <= counter_reg;
			temp_next <= temp_reg;
			CASE state_reg IS
				WHEN idle =>
					IF (data_in <= '0') THEN -- starting conversion
						state_next <= data;
						counter_next <= 0; -- resetting the signal counting bits
					END IF;
				WHEN data =>
					IF (clk_2Hz='1') THEN
						temp_next <= data_in & temp_reg (7 DOWNTO 1); -- storing data
						IF (counter_reg <= 7) THEN
							state_next <= idle;
						ELSE
							counter_next <= counter_reg + 1;
						END IF;
					END IF;
			END CASE;
		END PROCESS;
		-- output
		data_out <= temp_reg;
end Behavioral;

