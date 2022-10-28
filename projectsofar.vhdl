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
signal test1: std_logic_vector(127 downto 0);
signal test2: std_logic_vector(64 downto 0);
signal test3 :std_logic_vector(32 downto 0);		--for r4 000 - 011
begin  
	process(reg1, reg2, reg3)
	variable temp : std_logic_vector (127 downto 0);
	variable temp2 : std_logic_vector (127 downto 0);
	variable temp_ext1: std_logic_vector(64 downto 0);
	variable temp_ext2: std_logic_vector (32 downto 0);	--for r4
	variable ovflw: std_logic_vector(2 downto 0);
	begin 					 
	op <= sel(22 downto 20);
		--r4 instructions 
	if sel(24 downto 23) = "10"	then 
		--mult add low--
		if sel(22 downto 20) = "000"	 then   
			temp(31 downto 0)    := std_logic_vector(resize(signed(reg2(15 downto 0)) * signed(reg3(15 downto 0)), 32));	
		  temp (63 downto 32)  := std_logic_vector(resize(signed(reg2(47 downto 32)) * signed(reg3(47 downto 32)), 32));
		  temp (95 downto 64)  := std_logic_vector(resize(signed(reg2(79 downto 64)) * signed(reg3(79 downto 64)), 32));
		  temp (127 downto 96) := std_logic_vector(resize(signed(reg2(111 downto 96)) * signed(reg3(111 downto 96)), 32));	
		  
		  test1 <= temp;
		  -- 0 -31
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(31 downto 0)), 33) + resize(signed(temp(31 downto 0)), 33));
		  test3 <= temp_ext2;
		  ovflw := reg1(31) & temp(31) & temp_ext2(31);
		  	if ovflw = "001" then
				output(31 downto 0) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(31 downto 0) <= x"80000000";
			else
				output(31 downto 0) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  -- 32 - 63
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 32)), 33) + resize(signed(temp(63 downto 32)), 33));
		  test3 <= temp_ext2;
		  ovflw := reg1 (63) & temp(63) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(63 downto 32) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(63 downto 32) <= x"80000000";
			else
				output(63 downto 32) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  
		  -- 95 - 64
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(95 downto 64)), 33) + resize(signed(temp(95 downto 64)), 33));
		  	   test3 <= temp_ext2;
		  ovflw := reg1 (95) & temp(95) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(95 downto 64) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(95 downto 64) <= x"80000000";
			else
				output(95 downto 64) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  
		   -- 127 - 96
		   temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 96)), 33) + resize(signed(temp(127 downto 96)), 33));
		  	   test3 <= temp_ext2;
		  ovflw := reg1 (127) & temp(127) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(127 downto 96) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(127 downto 96) <= x"80000000";
			else
				output(127 downto 96) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		--mult add high--
		elsif sel(22 downto 20) = "001"	then 
			temp (31 downto 0) := std_logic_vector(resize(signed(reg2(31 downto 16)) * signed(reg3(31 downto 16)), 32));	
		  temp (63 downto 32)  := std_logic_vector(resize(signed(reg2(63 downto 48)) * signed(reg3(63 downto 48)), 32));
		  temp (95 downto 64)  := std_logic_vector(resize(signed(reg2(95 downto 80)) * signed(reg3(95 downto 80)), 32));
		  temp (127 downto 96)  := std_logic_vector(resize(signed(reg2(127 downto 112)) * signed(reg3(127 downto 112)), 32));	
		  
		  test1 <= temp;
		  -- 0 -31
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(31 downto 0)), 33) + resize(signed(temp(31 downto 0)), 33));
		  test3 <= temp_ext2;
		  ovflw := reg1(31) & temp(31) & temp_ext2(31);
		  	if ovflw = "001" then
				output(31 downto 0) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(31 downto 0) <= x"80000000";
			else
				output(31 downto 0) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  -- 32 - 63
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 32)), 33) + resize(signed(temp(63 downto 32)), 33));
		  test3 <= temp_ext2;
		  ovflw := reg1 (63) & temp(63) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(63 downto 32) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(63 downto 32) <= x"80000000";
			else
				output(63 downto 32) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  
		  -- 95 - 64
		  temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(95 downto 64)), 33) + resize(signed(temp(95 downto 64)), 33));
		  	   test3 <= temp_ext2;
		  ovflw := reg1 (95) & temp(95) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(95 downto 64) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(95 downto 64) <= x"80000000";
			else
				output(95 downto 64) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		  
		   -- 127 - 96
		   temp_ext2 (32 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 96)), 33) + resize(signed(temp(127 downto 96)), 33));
		  	   test3 <= temp_ext2;
		  ovflw := reg1 (127) & temp(127) & temp_ext2(31);
		  	  if ovflw = "001" then
				output(127 downto 96) <= x"7FFFFFFF";
			elsif ovflw = "110" then					 
				output(127 downto 96) <= x"80000000";
			else
				output(127 downto 96) <= std_logic_vector(resize(signed(temp_ext2), 32)) ;
			end if;
		--mult sub low
		elsif sel(22 downto 20) = "010"	 then 	 
		
		--mult sub high
		elsif sel (22 downto 20) = "011" then 
			
		--long int mult add low
		elsif sel(22 downto 20) = "100" then 
			temp(63 downto 0) := std_logic_vector(resize(signed(reg2(31 downto 0)) * signed(reg3(31 downto 0)), 64));
			temp(127 downto 64) := std_logic_vector(resize(signed(reg2(95 downto 64)) * signed(reg3(95 downto 64)), 64));
			test1 <= temp;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 0)), 65) + resize(signed(temp(63 downto 0)), 65));
			test2 <= temp_ext1;
			ovflw := reg1(63) & temp(63) & temp_ext1(63);
			if ovflw = "001" then
				output(63 downto 0) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "110" then					 
				output(63 downto 0) <= x"8000000000000000";
			else
				output(63 downto 0) <= std_logic_vector(resize(signed(temp_ext1), 64)) ;
			end if;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 64)), 65) + resize(signed(temp(127 downto 64)), 65));
			ovflw := reg1(127) & temp(127) & temp_ext1(63);
			if ovflw = "001" then
				output(127 downto 64) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "110" then					 
				output(127 downto 64) <= x"8000000000000000";
			else
				output(127 downto 64) <= std_logic_vector(resize(signed(temp_ext1), 64));
			end if;
						
		--long mult add high
		elsif sel(22 downto 20) = "101" then
			temp(63 downto 0) := std_logic_vector(resize(signed(reg2(63 downto 32)) * signed(reg3(63 downto 32)), 64));
			temp(127 downto 64) := std_logic_vector(resize(signed(reg2(127 downto 96)) * signed(reg3(127 downto 96)), 64));
			test1 <= temp;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 0)), 65) + resize(signed(temp(63 downto 0)), 65));
			test2 <= temp_ext1;
			ovflw := reg1(63) & temp(63) & temp_ext1(63);
			if ovflw = "001" then
				output(63 downto 0) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "110" then					 
				output(63 downto 0) <= x"8000000000000000";
			else
				output(63 downto 0) <= std_logic_vector(resize(signed(temp_ext1), 64)) ;
			end if;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 64)), 65) + resize(signed(temp(127 downto 64)), 65));
			ovflw := reg1(127) & temp(127) & temp_ext1(63);
			if ovflw = "001" then
				output(127 downto 64) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "110" then					 
				output(127 downto 64) <= x"8000000000000000";
			else
				output(127 downto 64) <= std_logic_vector(resize(signed(temp_ext1), 64));
			end if;		
			
		--long mult sub low
		elsif sel (22 downto 20 ) = "110" then
			temp(63 downto 0) := std_logic_vector(resize(signed(reg2(31 downto 0)) * signed(reg3(31 downto 0)), 64));
			temp(127 downto 64) := std_logic_vector(resize(signed(reg2(95 downto 64)) * signed(reg3(95 downto 64)), 64));
			test1 <= temp;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 0)), 65) - resize(signed(temp(63 downto 0)), 65));
			test2 <= temp_ext1;
			ovflw := reg1(63) & temp(63) & temp_ext1(63);
			if ovflw = "011" then
				output(63 downto 0) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "100" then					 
				output(63 downto 0) <= x"8000000000000000";
			else
				output(63 downto 0) <= std_logic_vector(resize(signed(temp_ext1), 64)) ;
			end if;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 64)), 65) - resize(signed(temp(127 downto 64)), 65));
			ovflw := reg1(127) & temp(127) & temp_ext1(63);
			if ovflw = "011" then
				output(127 downto 64) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "100" then					 
				output(127 downto 64) <= x"8000000000000000";
			else
				output(127 downto 64) <= std_logic_vector(resize(signed(temp_ext1), 64));
			end if;
		
		--long int mult sub high--
		elsif sel (22 downto 20 ) = "111" then
			temp(63 downto 0) := std_logic_vector(resize(signed(reg2(63 downto 32)) * signed(reg3(63 downto 32)), 64));
			temp(127 downto 64) := std_logic_vector(resize(signed(reg2(127 downto 96)) * signed(reg3(127 downto 96)), 64));
			test1 <= temp;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(63 downto 0)), 65) - resize(signed(temp(63 downto 0)), 65));
			test2 <= temp_ext1;
			ovflw := reg1(63) & temp(63) & temp_ext1(63);
			if ovflw = "011" then
				output(63 downto 0) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "100" then					 
				output(63 downto 0) <= x"8000000000000000";
			else
				output(63 downto 0) <= std_logic_vector(resize(signed(temp_ext1), 64)) ;
			end if;
			temp_ext1(64 downto 0) := std_logic_vector(resize(signed(reg1(127 downto 64)), 65) - resize(signed(temp(127 downto 64)), 65));
			ovflw := reg1(127) & temp(127) & temp_ext1(63);
			if ovflw = "011" then
				output(127 downto 64) <= x"7FFFFFFFFFFFFFFF";
			elsif ovflw = "100" then					 
				output(127 downto 64) <= x"8000000000000000";
			else
				output(127 downto 64) <= std_logic_vector(resize(signed(temp_ext1), 64));
			end if;
			
		end if;--r4 end
	
		
	 ---- r3 instructions-------------------------------------------------------------------
	 elsif sel(24 downto 23) = "11" then 
		 --nop-------------------------------------------------------------------------
		 if sel( 18 downto 15) = "0000"	 then 
			 null;
		--count leading 0 in words--
		elsif sel( 18 downto 15) = "0001" then 
		
		--add word unsigned
		elsif sel( 18 downto 15) = "0010" then 
		
		--add halfword unsigned 
		elsif sel( 18 downto 15) = "0011" then
			
		--add half ward saturated
		elsif sel(18 downto 15) = "0100" then 
			
		--bitwise logic and--------------------------------------------------------------
		elsif sel( 18 downto 15) = "0101" then
			  output <= reg1 and reg2;
			--broadcast word -------------------------------------------------------------------
		elsif sel( 18 downto 15) = "0110" then		
			output (31 downto 0) <= reg1( 31 downto 0);
			output (63 downto 32) <= reg1(31 downto 0);
			output (95 downto 64) <= reg1(31 downto 0);
			output (127 downto 96) <= reg1 (31 downto 0);
		--max signed word
		elsif sel( 18 downto 15) = "0111" then 
			
		--min signed word
		elsif sel( 18 downto 15) = "1000" then 
		
		--mult low unsigned -----------------------------------------------------------------------------------------------------------------
		elsif sel( 18 downto 15) = "1001" then 	
		  temp (31 downto 0) := std_logic_vector(resize(signed(reg1(15 downto 0)) * signed(reg2(15 downto 0)), 32));	
		  temp (63 downto 32)  := std_logic_vector(resize(signed(reg1(47 downto 32)) * signed(reg2(47 downto 32)), 32));
		  temp (95 downto 64)  := std_logic_vector(resize(signed(reg1(79 downto 64)) * signed(reg2(79 downto 64)), 32));
		  temp (127 downto 96)  := std_logic_vector(resize(signed(reg1(111 downto 96)) * signed(reg2(111 downto 96)), 32));	
		  
		  output <= temp;
		
		--mult low by constant unsigned
		elsif sel( 18 downto 15) = "1010" then 	
		  temp (31 downto 0) := std_logic_vector(resize(signed(reg1(15 downto 0)) * signed(sel(14 downto 10)), 32));	
		  temp (63 downto 32)  := std_logic_vector(resize(signed(reg1(47 downto 32)) * signed(sel(14 downto 10)), 32));
		  temp (95 downto 64)  := std_logic_vector(resize(signed(reg1(79 downto 64)) * signed(sel(14 downto 10)), 32));
		  temp (127 downto 96)  := std_logic_vector(resize(signed(reg1(111 downto 96)) * signed(sel(14 downto 10)), 32));	
		  
		  output <= temp;
		
		--OR
		elsif sel( 18 downto 15) = "1011" then 
			  output<= reg1 or reg2;
		--count ones in words
		elsif sel( 18 downto 15) = "1100" then 
		
		--rotate bits in words
		elsif sel( 18 downto 15) = "1101" then 
			
		--sub from word unsiged 
		elsif sel( 18 downto 15) = "1110" then 
			
		--sub from halfwarod saturated
		elsif sel( 18 downto 15) = "1111" then 
			
		 
		end if; --r3 end  
		
	--load immediate
	elsif sel (24) = '0' then		
		--first 16	  
		-- 0000000000000000 0
		-- 0123456789012345	 1
		-- 6789012345678901	  2
		-- 2345678901234567	   3
		-- 8901234567890123		4	  
		-- 4567890123456789		 5 
		-- 0123456789012345		  6	 
		-- 6789012345678901		   7
		-- 2345678901234567			8
		
		if sel (23 downto 21 ) = "000" then 
			output(15 downto 0)  <= sel (20 downto 5); 	 
		-- 2nd 16
		elsif sel (23 downto 21 ) = "001" then 	
			output (31 downto 16) <= sel (20 downto 5); 	 
		--3rd 16
		elsif sel (23 downto 21 ) = "010" then 
			output (47 downto 32) <= sel (20 downto 5);	
		-- 4th 16
		elsif sel (23 downto 21 ) = "011" then 
			output (63 downto 48) <= sel (20 downto 5);	
		 --5th 16 
		elsif sel (23 downto 21 ) = "100" then 	 
			output 	(79 downto 64) <= sel (20 downto 5);
		--6th 16 
		elsif sel (23 downto 21 ) = "101" then 	  
			output (95 downto 80) <= sel (20 downto 5);		
		--7th 16
		elsif sel (23 downto 21 ) = "110" then 
			output	(111 downto 96) <= sel (20 downto 5);
		--8th 16 
		elsif sel (23 downto 21) = "111" then 
			output (127 downto 112) <= sel (20 downto 5);
		end if;
	 end if;
	  end process;

end alu;
	


	

