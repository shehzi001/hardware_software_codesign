----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:23:19 10/12/2014 
-- Design Name: 
-- Module Name:    e1 - Behavioral 
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

entity e1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  c : in  STD_LOGIC;
           x : out  STD_LOGIC);
end e1;

architecture Behavioral of e1 is

begin
	x <= (a and b) and c;
end Behavioral;

