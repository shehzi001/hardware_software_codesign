----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:33 10/12/2014 
-- Design Name: 
-- Module Name:    COUNT_3B - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNT_3B is
	 GENERIC(M : integer := 50_000_000); -- default: 1Hz
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           UP_DOWN : in  STD_LOGIC;
			  COUNT : out  STD_LOGIC_VECTOR (3 downto 0); --LED output
           segment7 : out  STD_LOGIC_VECTOR (6 downto 0); -- 7 bit decoded output
			  an : out  STD_LOGIC_VECTOR (3 downto 0)); 
end COUNT_3B;

architecture Behavioral of COUNT_3B is
	signal t_cnt : std_logic_vector(3 downto 0);
begin
process (CLK, RESET)
	VARIABLE count_dvd : integer RANGE 0 TO M/2;
	begin
		if (RESET = '1') then
			t_cnt <= "0000";
			count_dvd := 0;
		elsif (rising_edge(CLK)) then
			count_dvd := count_dvd + 1;
			if (count_dvd = M/2) THEN
				count_dvd := 0;
				if (UP_DOWN = '1') then
					if (t_cnt = 9) then
						t_cnt <= "0000";
					else
						t_cnt <= t_cnt + 1;
					end if;
				elsif (UP_DOWN = '0') then
					 if (t_cnt = 0) then
						t_cnt <= "1001";
					else
						t_cnt <= t_cnt - 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	an <= "1110";
	process (t_cnt)
	BEGIN
			case  t_cnt is
				when "0000"=> segment7 <="0000001";  -- '0'
				when "0001"=> segment7 <="1001111";  -- '1'
				when "0010"=> segment7 <="0010010";  -- '2'
				when "0011"=> segment7 <="0000110";  -- '3'
				when "0100"=> segment7 <="1001100";  -- '4'
				when "0101"=> segment7 <="0100100";  -- '5'
				when "0110"=> segment7 <="0100000";  -- '6'
				when "0111"=> segment7 <="0001111";  -- '7'
				when "1000"=> segment7 <="0000000";  -- '8'
				when "1001"=> segment7 <="0000100";  -- '9'
				 --nothing is displayed when a number more than 9 is given as input.
				when others=> segment7 <="1111111";
			end case;
	end process;
	COUNT <= t_cnt;
end Behavioral;
