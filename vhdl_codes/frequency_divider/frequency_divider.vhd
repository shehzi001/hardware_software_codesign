----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:06:44 10/12/2014 
-- Design Name: 
-- Module Name:    frequency_divider - Behavioral 
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

entity frequency_divider is
	 GENERIC(M : integer := 50_000_000); -- default: 1Hz
    Port ( rst : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           clk_out : BUFFER  STD_LOGIC);
end frequency_divider;

architecture Behavioral of frequency_divider is

begin
		PROCESS (clk_in, rst)
			VARIABLE count : integer RANGE 0 TO M/2;
		BEGIN
			IF rst='1' THEN
				count := 0;
				clk_out <= '0';
			ELSIF (clk_in'EVENT and clk_in='1') THEN
				count := count + 1;
				IF (count = M/2) THEN
					count := 0;
					clk_out <= not clk_out;
				END IF;
			END IF;
		END PROCESS;
end Behavioral;

