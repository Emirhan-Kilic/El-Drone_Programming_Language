eldrone: parser.c lexer.c
	gcc -o eldrone parser.c

parser.c: grammar.y lexer.c
	yacc -o parser.c grammar.y

lexer.c: tokens.lex
	lex -o lexer.c tokens.lex

clean:
	rm -f lexer.c parser.c eldrone
