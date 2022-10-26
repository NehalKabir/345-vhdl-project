-------------------------------------------------------------------------------
--
-- Title       : half_adder
-- Design      : half_adder
-- Author      : Nehal Kabir
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
entity alu is
	 port(
	 reg1 :in std_logic_vector (127 downto 0);  
	 reg2 :in std_logic_vector (127 downto 0);
	 reg3 :in std_logic_vector (127 downto 0);

		 output : out std_logic_vector (127 downto 0)
	     );
end alu;	 


architecture alu of alu is 
signal sel : std_logic_vector (24 downto 0);
signal r : std_logic_vector(1 downto 0);  
signal op : std_logic_vector(2 downto 0);
begin  
	process 
	begin 					 
	op <= sel(22 downto 20);
		--r4 instructions 
	if sel(24 downto 23) = "10"	then 
		--mult add low--
		if sel(22 downto 20) = "000"	 then   
		
		--mult add high--
		elsif sel(22 downto 20) = "001"	then 
		
		--mult sub low
		elsif sel(22 downto 20) = "010"	 then 	 
		
		--mult sub high
		elsif sel (22 downto 20) = "011" then 
			
		--long int mult add low
		elsif sel(22 downto 20) = "100" then 
			
		--long mult add high
		elsif sel(22 downto 20) = "101" then		
			
		--long mult sub low
		elsif sel (22 downto 20 ) = "110" then 
		
		--long int mult sub high--
		elsif sel (22 downto 20 ) = "111" then
			
		end if;--r4 end
	
		
	 ---- r3 instructions--
	 elsif sel(24 downto 23) = "11" then 
		 --nop
		 if sel( 22 downto 15) = "----0000"	 then 
			 
		--count leading 0 in words--
		elsif sel( 22 downto 15) = "------10" then 
		
		--add word unsigned
		elsif sel( 22 downto 15) = "----0011" then 
		
		--add halfwors unsigned 
		elsif sel( 22 downto 15) = "----0100" then
			
		--bitwise logic and
		elsif sel( 22 downto 15) = "----0101" then
		
			--broadcast word
		elsif sel( 22 downto 15) = "----0110" then		
		
		--max signed word
		elsif sel( 22 downto 15) = "----0111" then 
			
		--min signed word
		elsif sel( 22 downto 15) = "----1000" then 
		
		--mult low unsigned 
		elsif sel( 22 downto 15) = "----1001" then 
		
		--mult low by constant unsigned
		elsif sel( 22 downto 15) = "----1010" then 
		
		--OR
		elsif sel( 22 downto 15) = "----1011" then 
			
		--count ones in words
		elsif sel( 22 downto 15) = "----1100" then 
		
		--rotate bits in words
		elsif sel( 22 downto 15) = "----1101" then 
			
		--sub from word unsiged 
		elsif sel( 22 downto 15) = "----1110" then 
			
		--sub from halfwarod saturated
		elsif sel( 22 downto 15) = "----1111" then 
			
		 
		end if; --r3 end  
		
	--load immediate
	elsif sel (24) = "0" then
		
		end if;
		 
	 end if;
	 
	  end process;

end alu;
	

