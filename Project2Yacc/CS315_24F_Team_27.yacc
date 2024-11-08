%token GET_HEADING GET_ALTITUDE GET_TIME MOVE_FORWARD DESCEND ASCEND
%token TURN_LEFT TURN_RIGHT WAIT STOP NOZZLE_ON NOZZLE_OFF CONNECT_DRONE
%token FUNCTION PRINT INPUT RETURN BREAK
%token IMPORT AS FROM
%token IF ELSE_IF ELSE WHILE FOR
%token AND OR NOT TRUE FALSE
%token ASSIGN EQUAL NOT_EQUAL GT GTE ST STE
%token PLUS_OP MINUS_OP MULT_OP DIV_OP MOD_OP NON_OP
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN INCREMENT DECREMENT
%token LP CLB RP RCB COMMA
%token STRING INTEGER FLOAT IDENTIFIER
%token MULTI_COMMENT COMMENT NEW_LINE UNKNOWN


%%

program: stmt { printf("\nInput program is valid\n"); return 0; }

stmt: assn_stmt;

assn_stmt: IDENTIFIER ASSIGN expr;

expr: INTEGER
    | IDENTIFIER;

%%
#include "lex.yy.c"

int yyerror(char* s){
  fprintf(stderr, "%s on line %d\n",s, yylineno);
  return 1;
}

int main(){
  yyparse();
  return 0;
}