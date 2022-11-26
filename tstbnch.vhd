-------------------------------------------------------------------------------
--
-- Title       : tstbnch
-- Design      : project_part1
-- Author      : thomas plourde
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 345\Project_attempt2\project_part1\src\tstbnch.vhd
-- Generated   : Sat Nov 26 13:38:31 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {tstbnch} architecture {tstbnch}}

library IEEE;

package custom_types is
    use IEEE.std_logic_1164.all;	
--	type std_logic_aoa is array (0 to 31) of std_logic_vector(127 downto 0);
    type a is array (0  to 63) of std_logic_vector (24 downto 0);
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;

entity tstbnch is
end tstbnch;

--}} End of automatically maintained section

architecture tstbnch of tstbnch is
signal clk: std_logic;
signal PC: integer;

begin


end tstbnch;
