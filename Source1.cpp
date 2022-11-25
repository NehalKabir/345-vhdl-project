#include <iostream>
#include <map>
#include <fstream>
#include <string>
#include <vector>

#pragma warning(disable : 4996)

using namespace std;

int main()
{
	ifstream in("Mips.asm");

	string ins;
	string word1;
    string var;

     while (getline(in, ins)) 
     {
        word1 = strtok(const_cast<char*>(ins.c_str()), " ");
        cout << word1;
        if (word1 == "add")
            int x;
        if (word1 == "addi")
            int x;
        if (word1 == "addiu")
            int x;
        if (word1 == "addu")
            int x;
        if (word1 == "and")
            int x;
        if (word1 == "andi")
            int x;
        if (word1 == "beq")
            int x;
        if (word1 == "bne")
            int x;
        if (word1 == "j")
            int x;
        if (word1 == "jal")
            int x;
        if (word1 == "jr")
            int x;
        if (word1 == "lbu")
            int x;
        if (word1 == "lhu")
            int x;
        if (word1 == "ll")
            int x;
        if (word1 == "lui")
            int x;
        if (word1 == "lw")
            int x;
        if (word1 == "nor")
            int x;
        if (word1 == "or")
            int x;
        if (word1 == "ori")
            int x;
        if (word1 == "slt")
            int x;
        if (word1 == "slti")
            int x;
        if (word1 == "sltiu")
            int x;
        if (word1 == "sltu")
            int x;
        if (word1 == "sll")
            int x;
        if (word1 == "srl")
            int x;
        if (word1 == "sb")
            int x;
        if (word1 == "sc")
            int x;
        if (word1 == "sh")
            int x;
        if (word1 == "sw")
            int x;
        if (word1 == "sub")
            int x;
        if (word1 == "subu")
        {
            var = strtok(nullptr, " ");

        }
    }

	return 0;
}
