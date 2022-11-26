-------------------------------------------------------------------------------
--
-- Title       : pipeline
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
use work.all;

entity pipeline is
	port(
	i_if_d: in std_logic_vector(24 downto 0);
	i_if_d2: in std_logic_vector(24 downto 0);
    i_id_ex1: in std_logic_vector(127 downto 0);
    i_id_ex2: in std_logic_vector(127 downto 0);
	i_id_ex3: in std_logic_vector(127 downto 0);
	i_id_ex4: in integer;
	i_id_ex5: in std_logic_vector(24 downto 0);
	i_ex_wb1: in std_logic_vector(127 downto 0);
	i_ex_wb2: in integer;
	i_ex_wb3: in std_logic_vector(24 downto 0);
	
	
	o_if_d: out std_logic_vector(24 downto 0);
	o_if_d2: out std_logic_vector(24 downto 0);
    o_id_ex1: out std_logic_vector(127 downto 0);
    o_id_ex2: out std_logic_vector(127 downto 0);
	o_id_ex3: out std_logic_vector(127 downto 0);
	o_id_ex4: out integer;
	o_id_ex5: out std_logic_vector(24 downto 0);
	o_ex_wb1: out std_logic_vector(127 downto 0);
	o_ex_wb2: out integer;
	o_ex_wb3: out std_logic_vector(24 downto 0);
	
	clk: in std_logic
	);
end pipeline;

architecture pipeline of pipeline is

begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			o_if_d <= i_if_d;
			o_if_d2 <= i_if_d2;
			o_id_ex1 <= i_id_ex1;
			o_id_ex2 <= i_id_ex2;
			o_id_ex3 <= i_id_ex3;
			o_id_ex4 <= i_id_ex4;
			o_id_ex5 <= i_id_ex5;
			o_ex_wb1 <= i_ex_wb1;
			o_ex_wb2 <= i_ex_wb2;
			o_ex_wb3 <= i_ex_wb3;
		end if;
	end process;	
end pipeline;
	
