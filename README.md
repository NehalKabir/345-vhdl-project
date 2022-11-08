# 345-vhdl-project
alu part 1
class ese 345 computer architecture
goal: to make an alu in vhdl
how it works:
we have 3 input of 128 bits and 1 output of 128 bits
we will also have a signal called select that will be responsible for which alu operation we are to perform dependning on the opcode
if the 24th bit of select is 0 then we will perform load immediate
we will load whatever is in the select signal in the bits selected in the X 7th bit position of the output 


