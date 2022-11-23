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
	--take in 25 long what type it is li r3/4 read what reg file suppose to be  
	 sel : in std_logic_vector(24 downto 0);
	 
	 write:in std_logic;
	 
	 output1 : out std_logic_vector (127 downto 0);
	 output2 : out std_logic_vector (127 downto 0);	
	 output : out std_logic_vector (4 downto 0);
	 output3 : out std_logic_vector (127 downto 0)
	 
	     );
end reg_file;

--}} End of automatically maintained section

architecture reg_file of reg_file is
type std_logic_aoa is array (0 to 31) of std_logic_vector(127 downto 0);
signal write_to: integer;
signal regs : std_logic_aoa;
signal temp1 : integer;
signal temp2 : integer ;
signal temp3 : integer;	

begin

	process(clk)	

	begin


	
if(rising_edge(clk)) then 	

	
	if sel (24 downto 23) = "10"	then --r4	
	
			temp1 <= to_integer(unsigned (sel(9 downto 5)));	 
			
			output1 <= regs( temp1)(127 downto 0);
			
			temp2 <= to_integer(unsigned(sel(14 downto 10)));
			output2 <= regs(temp2)(	127 downto 0);
			
			temp3 <= to_integer (unsigned (sel(19 downto 15)));
			output3 <= regs(temp3)(127 downto 0); 
			
		elsif sel (24 downto 23) = "11" then --r3
			 temp1 <= to_integer(unsigned (sel(9 downto 5)));	 
			
			output1 <= regs( temp1)(127 downto 0);
			
			temp2 <= to_integer(unsigned(sel(14 downto 10)));
			output2 <= regs(temp2)(	127 downto 0);	 
			
		
		end if;	
			
		if(write = '1') then
				regs(write_to) <= write_reg;
			end if;
		--end if;	  
	end if;
	end process;
	
end reg_file;
