-------------------------------------------------------------------------------
--
-- Title       : ese 345 project part 1
-- Design      : ese 345 project part 1
-- Author      : Nehal Kabir and Thomas Plourde
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : D:\ESE382\half_adder\half_adder\src\half_adder.vhd
-- Generated   : Wed Feb  9 09:44:48 2022
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
--{entity {half_adder} architecture {half_adder}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity reg_file is
	 port(
	 
	 clk: in std_logic;
	 
	 write_reg :in std_logic_vector (127 downto 0);
	 
	 read1:in integer;
	 read2:in integer;
	 read3:in integer;
	 
	 write:in std_logic;
	 
	 output1 : out std_logic_vector (127 downto 0);
	 output2 : out std_logic_vector (127 downto 0);
	 output3 : out std_logic_vector (127 downto 0)
	 
	     );
end reg_file;

--}} End of automatically maintained section

architecture reg_file of reg_file is
type std_logic_aoa is array (0 to 31) of std_logic_vector(127 downto 0);
signal write_to: integer;
signal regs : std_logic_aoa;

begin

	process(clk)
	begin
		if(rising_edge(clk)) then
			if(0 <= read1 and read1 <= 31) then
				output1 <= regs(read1)(127 downto 0);
			end if;
			if(0 <= read2 and read2 <= 31) then
				output2 <= regs(read2)(127 downto 0);
			end if;
			if(0 <= read3 and read3 <= 31) then
				output3 <= regs(read3)(127 downto 0);
			end if;
			if(write = '1') then
				regs(write_to) <= write_reg;
			end if;
		end if;
	end process;
	
end reg_file;
