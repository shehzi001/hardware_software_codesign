----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:00:05 10/12/2014 
-- Design Name: 
-- Module Name:    mux-4-to-1 - Behavioral 
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

entity mux_4_to_1 is
    Port ( i0,i1,i2,i3 : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  q: out STD_LOGIC);
end mux_4_to_1;

architecture Behavioral of mux_4_to_1 is

begin
	--q <= i0 WHEN sel = "00" ELSE -- SIGNAL i0 has the highest priority
	--		i1 WHEN sel = "01" ELSE
	--		i2 WHEN sel = "10" ELSE
	--		i3;
	
	--mux : PROCESS (sel)
	--BEGIN
	--	IF sel="00" THEN
	--		q <= i0;
	--	ELSIF sel="10" THEN
	--		q <= i1;
	--	ELSIF sel="01" THEN
	--		q <= i2;
	--	ELSE
	--		q <= i3;
	--	END IF;
	--END PROCESS mux;
	
	--mux : PROCESS(sel)
	--BEGIN
	--	CASE sel IS
	--		WHEN "00" => 
	--			q <= i0;
	--		WHEN "10" => 
	--			q <= i1;
	--		WHEN "01" => 
	--			q <= i2;
	--		WHEN OTHERS => 
	--			q <= i3;
	--	END CASE;
	--END PROCESS;
end Behavioral;

