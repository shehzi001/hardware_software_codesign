----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:04:49 10/12/2014 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

---------------------------------------
ENTITY debouncer IS
	PORT ( rst,clk,data_in: IN std_logic;
	db_out: OUT std_logic );
END debouncer;

---------------------------------------
ARCHITECTURE arch OF debouncer IS
	CONSTANT M : integer := 1_000_000;
	TYPE state_type IS (idle, first20ms, active, last20ms);
	SIGNAL state_reg, state_next: state_type;
	SIGNAL counter_reg, counter_next : integer RANGE 0 TO M;
begin
	---- FSMD sequential part ----------------
	PROCESS (rst, clk)
	BEGIN
		IF rst='1' THEN
			state_reg <= idle;
			counter_reg <= 0;
		ELSIF (clk'EVENT and clk='1') THEN
			state_reg <= state_next;
			counter_reg <= counter_next;
		END IF;
	END PROCESS;
	---- next state, control & data path ------
	PROCESS (state_reg, data_in, counter_reg)
	BEGIN
		---- default assignments --------------
		state_next <= state_reg;
		counter_next <= counter_reg;
		db_out <= '0';
		CASE state_reg IS
			WHEN idle =>
				IF (data_in = '1') THEN
					state_next <= first20ms;
				END IF;
			WHEN first20ms =>
				db_out <= '1';
				counter_next <= counter_reg + 1;
				IF (counter_reg = M) THEN
					state_next <= active;
				END IF;
			WHEN active =>
				db_out <= '1';
				IF (data_in ='0') THEN
					state_next <= last20ms;
				END IF;
			WHEN last20ms =>
				counter_next <= counter_reg + 1;
				IF counter_reg = M THEN
					state_next <= idle;
				END IF;
		END CASE;
	END PROCESS;
end Behavioral;

