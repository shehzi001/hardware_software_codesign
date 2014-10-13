----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:02:33 10/12/2014 
-- Design Name: 
-- Module Name:    combo - Behavioral 
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

entity combo is
    Port ( input : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           output : out  STD_LOGIC);
end combo;

architecture Behavioral of combo is
	SIGNAL sig1, sig2: STD_LOGIC;
begin
	--output <= input(0) and input(1) and input(2);
	gate1: ENTITY work.e1(Behavioral)
		PORT MAP (a=>input(0), b=>input(1), c=>input(2), x=>sig1);
	gate2: ENTITY work.e2(Behavioral)
		PORT MAP (d=>input(3), e=>input(4), y=>sig2);
	output <= sig1 or sig2;
end Behavioral;

