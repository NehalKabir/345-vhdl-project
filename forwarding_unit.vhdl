-------------------------------------------------------------------------------
--
-- Title       : forwarding unit
-- Design      : project_part1
-- Author      : thomas plourde
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 345\Project_attempt2\project_part1\src\instruction_buffer.vhd
-- Generated   : Sun Nov 20 15:16:38 2022
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity forwarding_unit is
	port(
	curr_instr: in std_logic_vector(24 downto 0);
	prev_instr: in std_logic_vector(24 downto 0);
	new_data: in std_logic_vector (127 downto 0);
	clk: in std_logic;
	fwd_data: out std_logic_vector (127 downto 0);
	slct: out integer	-- 0 for regular instr buf, 1 for change rs1, 2 for rs2, and 3 for rs3,
	);
end forwarding_unit;

architecture forwarding_unit of forwarding_unit is
signal no_prev: std_logic_vector(24 downto 0);
begin
	no_prev <= "0000000000000000000000000";
	process(clk)
	variable tester: std_logic_vector(4 downto 0);
	begin
		tester := prev_instr(4 downto 0);
		if(rising_edge(clk)) then
			fwd_data <= new_data;
			if(prev_instr = no_prev) then	--if no prev instruction
				slct <= 0;
			elsif(curr_instr(24 downto 23) = "10") then --R4
				if tester = curr_instr(9 downto 5)then
					slct <= 1;	 
				elsif 	 tester = curr_instr(14 downto 10) then
					slct <= 2;
				elsif 	  tester = curr_instr (19 downto 15) then
					slct <= 3;
				else
					slct <= 0;
				end if;	
			elsif(curr_instr(24 downto 23) = "11") then --R3
				if(tester = curr_instr(9 downto 5)) then
					slct <= 1;
				elsif((tester = curr_instr(14 downto 10))) then
					slct <= 2;
				else
					slct <= 0;
				end if;
			end if;
		end if;
	end process;
end forwarding_unit;		
		
