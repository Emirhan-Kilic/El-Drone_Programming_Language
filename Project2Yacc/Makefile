CC         = gcc
YACC       = yacc
LEX        = lex

YACC_FLAGS = -v
LEX_FLAGS  =

YACC_SRC   = CS315_24F_Team_27.yacc
LEX_SRC    = CS315_24F_Team_27.lex
YACC_OUT   = y.tab.c
LEX_OUT    = lex.yy.c
EXEC       = parser
YACC_LOG   = y.output

all: $(EXEC)

$(EXEC): $(YACC_OUT) $(LEX_OUT)
	$(CC) -o $(EXEC) $(YACC_OUT)

$(YACC_OUT): $(YACC_SRC) $(LEX_OUT)
	$(YACC) $(YACC_FLAGS) $(YACC_SRC)

$(LEX_OUT): $(LEX_SRC)
	$(LEX) $(LEX_FLAGS) $(LEX_SRC)

clean:
	rm -f $(LEX_OUT) $(YACC_OUT) $(EXEC) $(YACC_LOG)
