#include <iostream>
#include <map>
#include <fstream>
#include <string>
#include <vector>
/*
NOTE FOR TOM
the asm file should have something like SLMALS rd[5], r1[3], r2[5], r3[6]
can you seperate the command and the registers
so place the reg numbers in the appropriate string name and convert to binary 
you can use this link to convert the string to binary https://peter.bloomfield.online/convert-a-number-to-a-binary-string-and-back-in-cpp/*/
#pragma warning(disable : 4996)

using namespace std;

int main()
{
    ifstream in("Mips.asm");

    string ins;
    string word1;
    string rs;
    string rsd;
    string rt;
    string rs3;
    string rs2;
    string rs1;
    string opcode;
    string LongInt;
    string SubAdd;
    string HighLow;
    string imm;
    string loadindex;


    while (getline(in, ins))
    {
        word1 = strtok(const_cast<char*>(ins.c_str()), " ");
        cout << word1;
        if (word1 == "LI") {//load imm
            opcode = "0" + loadindex + imm + rsd;
        }
        if (word1 == "SIMALS") {//signed int mult add low sat
            rs = strtok(nullptr, " ");
            opcode = "10000" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SIMAHS") {//signed int mylt add high sat
            opcode = "10001" + rs3 + rs2 + rs1 + rsd;
        }
            
        if (word1 == "SIMSLS") {//signed int mult sub low sat
            opcode = "10010" + rs3 + rs2 + rs1 + rsd;
        }
          
        if (word1 == "SIMSHS") {// sign in mult sub high sat
            opcode = "10011" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMALS") {//sign long int mult add low sat
            opcode = "10100" + rs3 + rs2 + rs1 + rsd;
        }
          
        if (word1 == "SLIMAHS") {//sign long intt mult add high sat
            opcode = "10101" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMSLS") {//sign long intt mult sub low sat
            opcode = "10110" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMSHS") {//sign long int mult sub high sat
            opcode = "10111" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "nop") {//nop
            opcode = "1111110000" + rs2 + rs1 + rsd;
        }
            
        if (word1 == "clzw") {//clzw
            opcode = "1111110001" + rs2 + rs1 + rsd;
        }
        if (word1 == "au") {//AU
            opcode = "1111110010" + rs2 + rs1 + rsd;
        }
        
        if (word1 == "ahu") {//ahu
            opcode = "1111110011" + rs2 + rs1 + rsd;
        }

        if (word1 == "ahs") {//ahs
            opcode = "1111110100" + rs2 + rs1 + rsd;
        }
            
        if (word1 == "and") {//and
            opcode = "1111110101" + rs2 + rs1 + rsd;
        }
        if (word1 == "bcw") {//bcw
            opcode = "1111110110" + rs2 + rs1 + rsd;
        }
        if (word1 == "maxws") {//maxws
            opcode = "1111110111" + rs2 + rs1 + rsd;
        }
           
        if (word1 == "minws") {//minws
            opcode = "1111111000" + rs2 + rs1 + rsd;
        }
         
        if (word1 == "mlhu") {
            opcode = "1111111001" + rs2 + rs1 + rsd;
        }

        if (word1 == "mlhcu") {
            opcode = "1111111010" + rs2 + rs1 + rsd;
        }
        if (word1 == "or") {
            opcode = "1111111011" + rs2 + rs1 + rsd;
        }

        if (word1 == "pcntw") {
            opcode = "1111111100" + rs2 + rs1 + rsd;
        }

        if (word1 == "rotw") {
            opcode = "1111111101" + rs2 + rs1 + rsd;
        }

        if (word1 == "sfwu") {
            opcode = "1111111110" + rs2 + rs1 + rsd;
        }
        if (word1 == "sfhs") {
            opcode = "1111111111" + rs2 + rs1 + rsd;
        }
    }

    return 0;
}
