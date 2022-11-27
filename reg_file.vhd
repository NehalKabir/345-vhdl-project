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
use work.custom_types.all;
use work.all;
entity reg_file is
	 port(
	 
	 clk: in std_logic;
	 
	 write_reg :in std_logic_vector (127 downto 0);
	--take in 25 long what type it is li r3/4 read what reg file suppose to be  
	sel : in std_logic_vector(24 downto 0);
	reg : in b;
	 
	 write : in integer;
	 
	 fwd : in std_logic_vector(24 downto 0);
	 fwd_o : out std_logic_vector(24 downto 0);
	 fwd_o2 : out std_logic_vector(24 downto 0);
	 
	 write_o : out integer;
	 
	 output1 : out std_logic_vector (127 downto 0);
	 output2 : out std_logic_vector (127 downto 0);	
	 output3 : out std_logic_vector (127 downto 0)
	 --reg_o: out b
	 
	     );
end reg_file;

--}} End of automatically maintained section

architecture reg_file of reg_file is
signal write_to: integer;


begin
 process(clk)	
variable temp1 : integer;
variable temp2 : integer;
variable temp3 : integer;
variable temp4 : integer;
variable regs : b;
	begin


	
if(rising_edge(clk)) then 	

	regs := reg;
	if sel (24 downto 23) = "10"	then --r4	
			  temp1 := to_integer(unsigned (sel(9 downto 5)));
			--temp1 <= to_integer(unsigned (sel(9 downto 5)));
			write_to <= temp1;
			
			output1 <= regs( temp1)(127 downto 0);
			
			temp2 := to_integer(unsigned(sel(14 downto 10)));
			output2 <= regs(temp2)(	127 downto 0);
			
			temp3 := to_integer (unsigned (sel(19 downto 15)));
			output3 <= regs(temp3)(127 downto 0); 
			
		elsif sel (24 downto 23) = "11" then --r3
			-- temp1 <= to_integer(unsigned (sel(9 downto 5)));	 
			
			--output1 <= regs( temp1)(127 downto 0); 
			
			 temp1 := to_integer(unsigned (sel(9 downto 5)));
			--temp1 <= to_integer(unsigned (sel(9 downto 5)));	 
			
			output1 <= regs( temp1)(127 downto 0);
			
			temp2 := to_integer(unsigned(sel(14 downto 10)));
			output2 <= regs(temp2)(	127 downto 0);	 
			
		
		end if;
		
		temp4 := to_integer(unsigned(sel(4 downto 0)));
		write_o <= temp4;
		if  write >= 0 then	
			regs(write) := write_reg;
			--reg_o <= regs;
		end if;	
		
		fwd_o <= fwd;
		fwd_o2 <= sel;	  
	end if;
	end process;
	
end reg_file;
