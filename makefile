
fooChecker_debug: fooChecker 
	lex fooChecker.lex
	yacc fooChecker_debug.yacc
	gcc y.tab.c lex.yy.c -o fooChecker_debug -lm

fooChecker: fooCheckerd
	lex fooChecker.lex
	yacc fooChecker.yacc
	gcc y.tab.c lex.yy.c -o fooChecker -lm


fooCheckerd: fooChecker.lex fooChecker.yacc
	lex -d fooChecker.lex
	yacc -dv fooChecker.yacc					#-v to create y.output file
	gcc y.tab.c lex.yy.c -o fooCheckerd -lm

.PHONY: clean
clean: ;
	rm -f y.tab.c y.tab.h y.output lex.yy.c fooCheckerd fooChecker 
	rm fooChecker_debug

