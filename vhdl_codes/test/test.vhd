----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:25 10/12/2014 
-- Design Name: 
-- Module Name:    test - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
    Port ( clk : in  STD_LOGIC;
           bcd : in  STD_LOGIC_VECTOR (3 downto 0); --BCD input
           segment7 : out  STD_LOGIC_VECTOR (6 downto 0); -- 7 bit decoded output
			  an : out  STD_LOGIC_VECTOR (3 downto 0)); 
end test;

--'a' corresponds to MSB of segment7 and g corresponds to LSB of segment7.
architecture Behavioral of test is

begin
	an <= "1110";
	process (clk,bcd)
	BEGIN
		if (clk'event and clk='1') then
			case  bcd is
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
		end if;
	end process;
end Behavioral;
