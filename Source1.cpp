#include <iostream>
#include <map>
#include <fstream>
#include <string>
#include <vector>
#include <bitset>

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

    int temp;

     while (getline(in, ins))
     {
        word1 = strtok(const_cast<char*>(ins.c_str()), " ");
        //cout << word1;
        // format for registers and non instruction values is just the number, no characters included
        //load imm, format LI loadindex imm rsd
        if (word1 == "LI") { 
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            loadindex = bitset<3>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            imm = bitset<16>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "0" + loadindex + imm + rsd;
        }
        //R4, format instr r3 r2 r1 rd,
        if (word1 == "SIMALS") {//signed int mult add low sat 
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10000" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SIMAHS") {//signed int mylt add high sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10001" + rs3 + rs2 + rs1 + rsd;
        }

        if (word1 == "SIMSLS") {//signed int mult sub low sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10010" + rs3 + rs2 + rs1 + rsd;
        }

        if (word1 == "SIMSHS") {// sign in mult sub high sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10011" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMALS") {//sign long int mult add low sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10100" + rs3 + rs2 + rs1 + rsd;
        }

        if (word1 == "SLIMAHS") {//sign long intt mult add high sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10101" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMSLS") {//sign long intt mult sub low sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10110" + rs3 + rs2 + rs1 + rsd;
        }
        if (word1 == "SLIMSHS") {//sign long int mult sub high sat
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs3 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "10111" + rs3 + rs2 + rs1 + rsd;
        }
        //R3 format instr rs2 rs1 rsd
        if (word1 == "nop") {//nop
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110000" + rs2 + rs1 + rsd;
        }

        if (word1 == "clzw") {//clzw
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110001" + rs2 + rs1 + rsd;
        }
        if (word1 == "au") {//AU
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110010" + rs2 + rs1 + rsd;
        }

        if (word1 == "ahu") {//ahu
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110011" + rs2 + rs1 + rsd;
        }

        if (word1 == "ahs") {//ahs
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110100" + rs2 + rs1 + rsd;
        }

        if (word1 == "and") {//and
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110101" + rs2 + rs1 + rsd;
        }
        if (word1 == "bcw") {//bcw
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110110" + rs2 + rs1 + rsd;
        }
        if (word1 == "maxws") {//maxws
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111110111" + rs2 + rs1 + rsd;
        }

        if (word1 == "minws") {//minws
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111000" + rs2 + rs1 + rsd;
        }

        if (word1 == "mlhu") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111001" + rs2 + rs1 + rsd;
        }

        if (word1 == "mlhcu") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111010" + rs2 + rs1 + rsd;
        }
        if (word1 == "or") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111011" + rs2 + rs1 + rsd;
        }

        if (word1 == "pcntw") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111100" + rs2 + rs1 + rsd;
        }

        if (word1 == "rotw") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111101" + rs2 + rs1 + rsd;
        }

        if (word1 == "sfwu") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111110" + rs2 + rs1 + rsd;
        }
        if (word1 == "sfhs") {
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs2 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rs1 = bitset<5>(temp).to_string();
            rs = strtok(nullptr, " ");
            temp = stoi(rs);
            rsd = bitset<5>(temp).to_string();
            opcode = "1111111111" + rs2 + rs1 + rsd;
        }
        cout << opcode << endl;
     }

	return 0;
}
