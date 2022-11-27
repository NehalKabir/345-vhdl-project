-------------------------------------------------------------------------------
--
-- Title       : instruction_buffer
-- Design      : project_part1
-- Author      : thomas plourde
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 345\Project_attempt2\project_part1\src\instruction_buffer.vhd
-- Generated   : Sun Nov 13 15:16:38 2022
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
--{entity {instruction_buffer} architecture {instruction_buffer}}

 -- custom package
library IEEE;

package custom_types is
    use IEEE.std_logic_1164.all;	
--	type std_logic_aoa is array (0 to 31) of std_logic_vector(127 downto 0);
type a is array (0  to 63) of std_logic_vector (24 downto 0);
type b is array (0 to 31) of std_logic_vector(127 downto 0);
end package;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;	 
use work.custom_types.all;

entity instruction_buffer is 
	port (	 
	clk : in std_logic;
	PC :in integer;
	reg : in a ;
	output : out std_logic_vector (24 downto 0);
	prev_output : out std_logic_vector (24 downto 0)
	);
	
end instruction_buffer;

--}} End of automatically maintained section

architecture instruction_buffer of instruction_buffer is
begin
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			output <= reg(PC);
			if(PC > 0) then
				prev_output <= reg(PC - 1);
			else
				prev_output <= "0000000000000000000000000";
			end if;
		end if;
	end process;
	
end instruction_buffer;
