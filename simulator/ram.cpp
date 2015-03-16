#include <fstream>
#include <iostream>
#include <vector>
#include "ram.h"
#include "isa.h"

RAM::RAM(char* filename):
	ram(RAMSIZE, 0), tag1(CACHEWIDTH1, -1), tag2(CACHEWIDTH2, -1),
	tags1(CACHEWIDTH3, vector<uint32_t>(WAYSIZE1 ,-1)), age1(CACHEWIDTH3, vector<uint32_t>(WAYSIZE1,1))
{
	if(filename != nullptr){
		ifstream fin;
		fin.open(filename, ios::in|ios::binary);
		if(fin.fail()){
			cerr << "Can't open file" << endl;
			exit(1);
		}
		int c = 0;
		uint32_t tmp;
		while(fin.read(reinterpret_cast<char*>(&tmp),sizeof(tmp)) && c < RAMSIZE){
			ram[c] = tmp;
			c++;
		}
	}else{
		cerr << "RAM is initilaized with zero." << endl;
	}
	hitcounter1 = hitcounter2 = hitcounter3 = counter = 0;
}

int RAM::read(uint32_t addr, uint32_t& v){
	v = ram[addr];
	return 3;
}

void RAM::write(uint32_t addr, uint32_t v){
	ram[addr] = v;
}

vector<uint32_t>::const_iterator RAM::begin() const{
	return ram.begin();
}

vector<uint32_t>::const_iterator RAM::end() const{
	return ram.end();
}

void RAM::printramstatus(){
}
