arith.tab.c arith.tab.h: arith.y
	bison -d arith.y

lex.yy.c: arith.lex arith.tab.h
	flex arith.lex

arith: lex.yy.c arith.tab.c arith.tab.h
	g++ arith.tab.c lex.yy.c -ll -o arith
