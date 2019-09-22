all:	parser parser.so

parser:	bison flex main.cpp tree.h tree.cpp
	g++ tree.cpp y.tab.c lex.yy.c main.cpp -o $@ 

parser.so: bison flex tree.h tree.cpp build_tree.cpp
	g++ -shared -fPIC -O0 -o $@ y.tab.c lex.yy.c tree.cpp build_tree.cpp
#	g++ tree.cpp y.tab.c lex.yy.c build_tree.cpp -o testso

bison: c11.y
	bison -d -y c11.y

flex: c11.l
	flex c11.l

clean:
	rm -rf parser parser.so a.out *.o lex.yy.* y.tab.* *.gch