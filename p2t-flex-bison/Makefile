all: clean parser

parser: lex.l parse.y
	flex lex.l
	bison -t -d parse.y
	$(CC) -c lex.yy.c -o lex.yy.o
	$(CXX) parse.tab.c lex.yy.o -o parser -lfl

clean:
	rm -f parse.tab.h parse.tab.c lex.yy.c parser lex.yy.o

.PHONY: clean
