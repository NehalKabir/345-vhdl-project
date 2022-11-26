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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.custom_types.all;
use work.all;
use std.textio.all;

entity tstbnch is
end tstbnch;

--}} End of automatically maintained section

architecture tstbnch of tstbnch is
--basic
constant clk_period : time := 10 ns;
signal clk: std_logic;
signal PC: integer;	  
signal instruction : a;	 
type b is array ( 0 to 32) of std_logic_vector( 127 downto 0);
signal reg_data : b;   			 

signal i_if_d: std_logic_vector(24 downto 0);
signal i_id_ex1: std_logic_vector(127 downto 0);
signal i_id_ex2: std_logic_vector(127 downto 0);
signal i_id_ex3: std_logic_vector(127 downto 0);
signal i_id_ex4: integer;
signal i_ex_wb1: std_logic_vector(127 downto 0);
signal i_ex_wb2: integer;
	
	
signal o_if_d: std_logic_vector(24 downto 0);
signal o_id_ex1: std_logic_vector(127 downto 0);
signal o_id_ex2: std_logic_vector(127 downto 0);
signal o_id_ex3: std_logic_vector(127 downto 0);
signal o_id_ex4: integer;
signal o_ex_wb1: std_logic_vector(127 downto 0);
signal o_ex_wb2: integer;
-- buff
signal prev_ins: std_logic_vector(24 downto 0);
begin
	
	process is
  variable current_line : line;  
  			 --ins 64 25 bit
        variable current_line_reg : line;	 
		variable i : integer := 0;
		variable j : integer := 0;
        variable result_line : line;
        file instr_file : text;
        file reg_file : text;
        file results_file : text; 
		--file reg_data : text;
        variable current_instr : std_logic_vector(24 downto 0);
        variable current_reg : std_logic_vector(127 downto 0);
		
		
      begin
        file_open(instr_file, "binary inputs.txt", read_mode);--read in the binary inputs from the file "binary inputs.txt" that contains out instructions
        while not endfile(instr_file) loop--run until the end of the file
              readline(instr_file, current_line);--read current line of inputs
              BREAD(current_line, current_instr);
            instruction(i) <= current_instr;
            i := i + 1;
            wait for 50ns;
        end loop;
        file_close(instr_file);

        file_open(reg_file, "register_values.txt", read_mode);
        while not endfile(reg_file) loop
              readline(reg_file, current_line_reg);
              bread(current_line_reg, current_reg);
            reg_data(j) <= current_reg;
            j := j + 1;
            wait for 50ns;
        end loop;
        file_close(reg_file);
	 end process;
	
	UUT1 : entity instruction_buffer
		port map (
		clk => clk,
		PC => PC,
		reg => instruction,
		output => i_if_d,
		prev_output => prev_ins
		);
	
	UUT2 : entity reg_file
		port map (
		clk => clk,
		write_reg => o_ex_wb1,
		sel => o_if_d,
		output1 => i_id_ex1,
		output2 => i_id_ex2,
		output3 => i_id_ex3,
		write => o_ex_wb2,
		write_o => i_id_ex4
		);
	UUT5 : entity pipeline 
		port map( 
		clk => clk,
		i_if_d => i_if_d,
		i_if_d2 => i_if_d2,
		i_id_ex1 =>  i_id_ex1,
		i_id_ex2 => i_id_ex2,
		i_id_ex3 => i_id_ex3,
		i_id_ex4 => i_id_ex4,
		i_id_ex5 => i_id_ex5,
		i_ex_wb1 => i_ex_wb1,
		i_ex_wb2 => i_ex_wb2,
		i_ex_wb3 => i_ex_wb3,
		o_if_d => o_if_d,
		o_if_d2 => o_if_d2,
		o_id_ex1 => o_id_ex1,
		o_id_ex2 => o_id_ex2,
		o_id_ex3 => o_id_ex3, 
		o_id_ex4 => o_id_ex4,
		o_id_ex5 => o_id_ex5,
		o_ex_wb1 => o_ex_wb1,
		o_ex_wb2 => o_ex_wb2,
		o_ex_wb3 => o_ex_wb3
		);
		--nehal was here 
		UUT3 : entity alu 
		port map(
		reg1 => i_id_ex1,
		reg2 => i_id_ex2,
		reg3 => i_id_ex3,
		output =>  i_ex_wb1
		);
	
	
	-- System Clock Process
	clock_gen : process
	begin
		clk <= '0';
		wait for clk_period/2;
		loop	-- inifinite loop
			clk <= not clk;
			wait for clk_period/2;
			exit when END_SIM = true;
		end loop;
		std.env.finish;
	end process;

end tstbnch;
