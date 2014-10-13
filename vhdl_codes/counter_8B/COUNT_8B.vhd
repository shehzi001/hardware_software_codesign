----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:08 10/12/2014 
-- Design Name: 
-- Module Name:    COUNT_8B - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNT_8B is
	 GENERIC(M : integer := 50_000_000); -- default: 1Hz
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LD : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           DIN : in  STD_LOGIC_VECTOR (7 downto 0);
           COUNT : out  STD_LOGIC_VECTOR (7 downto 0));
end COUNT_8B;

architecture Behavioral of COUNT_8B is
	signal t_cnt : std_logic_vector(7 downto 0);
begin
	process (CLK, RESET)
	VARIABLE count_dvd : integer RANGE 0 TO M/2;
	begin
		if (RESET = '1') then
			t_cnt <= "00000000";
			count_dvd := 0;
		elsif (rising_edge(CLK)) then
			if (LD = '1') then t_cnt <= DIN;
			else
			   count_dvd := count_dvd + 1;
				if (count_dvd = M/2) THEN
					count_dvd := 0;
					if (UP = '1') then t_cnt <= t_cnt + 1;
					else t_cnt <= t_cnt - 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	COUNT <= t_cnt;
end Behavioral;