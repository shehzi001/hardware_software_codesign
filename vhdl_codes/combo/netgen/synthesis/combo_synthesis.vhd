--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: combo_synthesis.vhd
-- /___/   /\     Timestamp: Sun Oct 12 01:22:07 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm combo -w -dir netgen/synthesis -ofmt vhdl -sim combo.ngc combo_synthesis.vhd 
-- Device	: xc3s1200e-4-fg320
-- Input file	: combo.ngc
-- Output file	: D:\semester-4\HWSWCD\vhdl_codes\combo\netgen\synthesis\combo_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: combo
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity combo is
  port (
    output : out STD_LOGIC; 
    input : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end combo;

architecture Structure of combo is
  signal input_0_IBUF_3 : STD_LOGIC; 
  signal input_1_IBUF_4 : STD_LOGIC; 
  signal input_2_IBUF_5 : STD_LOGIC; 
  signal output_OBUF_7 : STD_LOGIC; 
begin
  output1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => input_2_IBUF_5,
      I1 => input_1_IBUF_4,
      I2 => input_0_IBUF_3,
      O => output_OBUF_7
    );
  input_2_IBUF : IBUF
    port map (
      I => input(2),
      O => input_2_IBUF_5
    );
  input_1_IBUF : IBUF
    port map (
      I => input(1),
      O => input_1_IBUF_4
    );
  input_0_IBUF : IBUF
    port map (
      I => input(0),
      O => input_0_IBUF_3
    );
  output_OBUF : OBUF
    port map (
      I => output_OBUF_7,
      O => output
    );

end Structure;

