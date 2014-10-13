----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:11:46 10/12/2014 
-- Design Name: 
-- Module Name:    state_machine - Behavioral 
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

entity state_machine is
    Port ( sel : in STD_LOGIC_VECTOR(1 DOWNTO 0);
			  a : out  STD_LOGIC;
           b : out  STD_LOGIC;
           c : out  STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is
	TYPE state_type IS (init, idle, running); -- declaring enumeration
	SIGNAL state: state_type;
begin
	mux : PROCESS(sel)
	BEGIN
		CASE sel IS
			WHEN "00" => 
				state <= init;
			WHEN "10" => 
				state <= idle;
			WHEN "01" => 
				state <= running;
			WHEN OTHERS => 
				state <= init;
		END CASE;
	END PROCESS;
	
	states : PROCESS(state)
	BEGIN
		CASE state IS
			WHEN init =>
				a <= '1';
				b <= '0';
				c <= '0';
			WHEN idle =>
				a <= '0';
				b <= '1';
				c <= '0';
			WHEN running =>
				a <= '0';
				b <= '0';
				c <= '1';
		END CASE;
	END PROCESS;

end Behavioral;

