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
constant clk_period : time := 50 ns;
signal clk: std_logic;
signal PC: integer;	  
signal instruction : a;
signal reg_data : b;
signal i : integer;
signal j : integer;

signal i_if_d: std_logic_vector(24 downto 0);
signal i_if_d2: std_logic_vector(24 downto 0);
signal i_id_ex1: std_logic_vector(127 downto 0);
signal i_id_ex2: std_logic_vector(127 downto 0);
signal i_id_ex3: std_logic_vector(127 downto 0);
signal i_id_ex4: integer := 0;
signal i_id_ex5: std_logic_vector(24 downto 0);
signal i_id_ex6: std_logic_vector(24 downto 0);
signal i_ex_wb1: std_logic_vector(127 downto 0);
signal i_ex_wb2: integer;
signal i_ex_wb3: std_logic_vector(24 downto 0);	
signal i_ex_wb4: std_logic_vector(24 downto 0);

	
	
signal o_if_d: std_logic_vector(24 downto 0);
signal o_if_d2: std_logic_vector(24 downto 0);
signal o_id_ex1: std_logic_vector(127 downto 0);
signal o_id_ex2: std_logic_vector(127 downto 0);
signal o_id_ex3: std_logic_vector(127 downto 0);
signal o_id_ex4: integer;
signal o_id_ex5: std_logic_vector(24 downto 0);
signal o_id_ex6: std_logic_vector(24 downto 0);
signal o_ex_wb1: std_logic_vector(127 downto 0);
signal o_ex_wb2: integer;
signal o_ex_wb3: std_logic_vector(24 downto 0);
signal o_ex_wb4: std_logic_vector(24 downto 0);
signal fwd_data: std_logic_vector(127 downto 0);
signal slct: integer;
begin
	
	process is
  variable current_line : line;  
  			 --ins 64 25 bit
        variable current_line_reg : line;	 
        variable result_line : line;
        file instr_file : text;
        file reg_file : text;
        file results_file : text; 
		--file reg_data : text;
        variable current_instr : std_logic_vector(24 downto 0);
        variable current_reg : std_logic_vector(127 downto 0);
		
		
      begin
		i <= 0;
		j <= 0;
		wait for 10 ns;
        file_open(instr_file, "binary_inputs.txt", read_mode);--read in the binary instructions
        while not endfile(instr_file) loop
              readline(instr_file, current_line);
              BREAD(current_line, current_instr);
            instruction(i) <= current_instr;
            i <= i + 1;
            wait for 10ns;
        end loop;
        file_close(instr_file);
		PC <= 0;
--        file_open(reg_file, "register_values.txt", read_mode);
        --while not endfile(reg_file) loop
--              readline(reg_file, current_line_reg);
--              BREAD(current_line_reg, current_reg);
--            reg_data(j) <= current_reg;
--            j <= j + 1;
--            wait for 10ns;
--        end loop;
--        file_close(reg_file);
		while j <= 31 loop
			reg_data(j) <= std_logic_vector(to_unsigned(j, 128));
			j <= j + 1;
			wait for 10 ns;
		end loop;
		
		clk <= '0';
		file_open(results_file, "testbench_results.txt", write_mode);
		while PC < 30 loop
			wait for clk_period/2;
			clk <= not clk;
			wait for clk_period/2;
			clk <= not clk;
			if( o_ex_wb2 > 0) then
				reg_data(o_ex_wb2) <= o_ex_wb1;
			end if;
			write(result_line, string'("PC: "));
			write(result_line, PC);
			writeLine(results_file, result_line);
			
			PC <= PC + 1;
		end loop;
		std.env.finish;
	 end process;
	
	UUT1 : entity instruction_buffer
		port map (
		clk => clk,
		PC => PC,
		reg => instruction,
		output => i_if_d,
		prev_output => i_if_d2
		);
	
	UUT2 : entity reg_file
		port map (
		clk => clk,
		reg => reg_data,
		write_reg => o_ex_wb1,
		sel => o_if_d,
		output1 => i_id_ex1,
		output2 => i_id_ex2,
		output3 => i_id_ex3,
		write => o_ex_wb2,
		write_o => i_id_ex4,
		fwd => o_if_d2,
		fwd_o => i_id_ex5,
		fwd_o2 => i_id_ex6
		--reg_o => reg_data
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
		i_id_ex6 => i_id_ex6,
		i_ex_wb1 => i_ex_wb1,
		i_ex_wb2 => i_ex_wb2,
		i_ex_wb3 => i_ex_wb3,
		i_ex_wb4 => i_ex_wb4,
		o_if_d => o_if_d,
		o_if_d2 => o_if_d2,
		o_id_ex1 => o_id_ex1,
		o_id_ex2 => o_id_ex2,
		o_id_ex3 => o_id_ex3, 
		o_id_ex4 => o_id_ex4,
		o_id_ex5 => o_id_ex5,
		o_id_ex6 => o_id_ex6,
		o_ex_wb1 => o_ex_wb1,
		o_ex_wb2 => o_ex_wb2,
		o_ex_wb3 => o_ex_wb3,
		o_ex_wb4 => o_ex_wb4
		);
		--nehal was here 
		UUT3 : entity alu 
		port map(
		clk => clk,
		reg1 => o_id_ex1,
		reg2 => o_id_ex2,
		reg3 => o_id_ex3,
		output =>  i_ex_wb1,
		fwd => o_id_ex6,
		fwd_o => i_ex_wb3,
		fwd2 => o_id_ex5,
		fwd_o2 => i_ex_wb4,
		regf => fwd_data,
		slct => slct,
		write_index => i_ex_wb2
		);
		
		UUT4: entity forwarding_unit
		port map(
		clk => clk,
		curr_instr => o_ex_wb4,
		prev_instr => o_ex_wb3,
		new_data => o_ex_wb1,
		fwd_data => fwd_data,
		slct => slct
		);

end tstbnch;
