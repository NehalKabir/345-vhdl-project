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

package custom_types is
    use IEEE.std_logic_1164.all;	
--	type std_logic_aoa is array (0 to 31) of std_logic_vector(127 downto 0);
    type a is array (0  to 63) of std_logic_vector (24 downto 0);
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;		
use std.textio.all;

entity tstbnch is
end tstbnch;

--}} End of automatically maintained section

architecture tstbnch of tstbnch is
signal clk: std_logic;
signal PC: integer;
type a is array (0  to 63) of std_logic_vector (24 downto 0);	  
signal instruction : a;	 
type b is array ( 0 to 32) of std_logic_vector( 127 downto 0);
signal reg_data : b;   			 
--alu
signal reg1: std_logic_vector (127 downto 0 );
signal reg2: std_logic_vector (127 downto 0 );
signal reg3: std_logic_vector (127 downto 0 );
signal output_alu: std_logic_vector (127 downto 0 );	
--reg file
signal write_reg: std_logic_vector (127 downto 0 );	 
signal sel : std_logic_vector (24 downto 0);
signal write : std_logic; 
signal output1: std_logic_vector (127 downto 0 );	
signal output2: std_logic_vector (127 downto 0 );	
signal output3: std_logic_vector (127 downto 0 );	
--ins buffer	
signal reg : a;
signal output_ins: std_logic_vector (24 downto 0);
--for unit
signal curr_instr: std_logic_vector(24 downto 0);
signal	prev_instr: std_logic_vector(24 downto 0);
	
signal	slct:  std_logic ;



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

end tstbnch;
