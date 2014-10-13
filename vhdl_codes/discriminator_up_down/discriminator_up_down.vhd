----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:07 10/12/2014 
-- Design Name: 
-- Module Name:    discriminator_up_down - Behavioral 
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

entity discriminator_up_down is
    Port ( input : in  STD_LOGIC;
           reference : in  STD_LOGIC;
           output : out  STD_LOGIC);
end discriminator_up_down;

architecture Behavioral of discriminator_up_down is

begin
	PROCESS(input, reference)
	BEGIN
		IF input > reference THEN
			output <= '1';
		ELSE
			output <= '0';
		END IF;
	END PROCESS;
	
end Behavioral;

