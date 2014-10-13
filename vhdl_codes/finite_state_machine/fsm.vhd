----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:49:09 10/12/2014 
-- Design Name: 
-- Module Name:    fsm - Behavioral 
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

entity fsm is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end fsm;

architecture Behavioral of fsm is
	TYPE state_type IS (init, idle, running); -- declaring enumeration
	SIGNAL state_reg, state_next: state_type;
	SIGNAL temp: STD_LOGIC_VECTOR (1 downto 0);
begin
	----------- Lower section: ----------
	PROCESS (rst, clk)
		BEGIN
			IF (rst='1') THEN
				state_reg <= init;
			ELSIF (clk'EVENT and clk='1') THEN
				output <= temp;
				state_reg <= state_next;
			END IF;
		END PROCESS;
		
	----------- Upper section: ----------
	PROCESS (sel)
		BEGIN
		CASE sel IS
			WHEN "01" =>
				state_next <= idle;
			WHEN "11" =>
				state_next <= running;
			WHEN "00" =>
				state_next <= init;
			WHEN OTHERS =>
				state_next <= init;
		END CASE;
		END PROCESS;
		
	PROCESS (state_reg)
		BEGIN
		CASE state_reg IS
			WHEN init =>
				temp <= "00";
			WHEN idle =>
				temp <= "01";
			WHEN running =>
				temp <= "11";
		END CASE;
	END PROCESS;

end Behavioral;