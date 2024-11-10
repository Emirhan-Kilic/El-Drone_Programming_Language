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

program: stmt_list { printf("\nInput program is valid\n"); return 0; }

stmt_list: stmt_list | stmt;

stmt: assign_stmt | if_stmt | for_stmt | while_stmt | function_stmt | return_stmt | expr_stmt | operation_stmt | drone_stmt | print_stmt | comment_stmt | multicomment_stmt | break_stmt | import_stmt;

assign_stmt: assign NEW_LINE;

assign: string_assign | num_assign | logic_assign;

string_assign: IDENTIFIER ASSIGN string_expr;

num_assign: IDENTIFIER ASSIGN num_expr | num_short_assign;

logic_assign: IDENTIFIER ASSIGN logic_expr;

num_short_assign:
    IDENTIFIER ADD_ASSIGN num_expr
    | IDENTIFIER SUB_ASSIGN num_expr
    | IDENTIFIER MUL_ASSIGN num_expr
    | IDENTIFIER DIV_ASSIGN num_expr
;

if_stmt:
    IF LP logics RP CLB stmt_list RCB
    | IF LP logics RP CLB stmt_list RCB ELSE CLB stmt_list RCB
    | IF LP logics RP CLB stmt_list RCB else_if_seq ELSE CLB stmt_list RCB
    | IF LP logics RP CLB stmt_list RCB else_if_seq
;

else_if_seq: else_if | else_if_seq else_if;

else_if: ELSE_IF LP logics RP CLB stmt_list RCB;

while_stmt: WHILE LP logics RP CLB stmt_list RCB;

for_stmt:
    FOR LP expr COMMA logics COMMA num_short_assign RP CLB stmt_list RCB
    | FOR LP expr COMMA logics COMMA short_operation RP CLB stmt_list RCB
;

function_stmt:
    FUNCTION IDENTIFIER LP argument_list RP CLB stmt_list RCB
    | FUNCTION IDENTIFIER LP RP CLB stmt_list RCB
;

return_stmt: RETURN expr_stmt;

arguments:
    variables
    | expr
    | logics
    | FUNCTION IDENTIFIER LP RP
    | FUNCTION IDENTIFIER LP argument_list RP
;

argument_list:
    argument_list COMMA arguments
    | arguments
;

variables:
    STRING
    | INTEGER
    | IDENTIFIER
;

expr_stmt:
    expr NEW_LINE
;

expr:
    num_expr
    | string_expr
    | logic_expr
;

num_expr:
    additive_expr
;

additive_expr:
    additive_expr PLUS_OP multiplicative_expr
    | additive_expr MINUS_OP multiplicative_expr
    | multiplicative_expr
;

multiplicative_expr:
    multiplicative_expr MULT_OP primary_expr
    | multiplicative_expr DIV_OP primary_expr
    | multiplicative_expr MOD_OP primary_expr
    | primary_expr
;

primary_expr:
    INTEGER
    | IDENTIFIER
    | FUNCTION IDENTIFIER LP RP
    | FUNCTION IDENTIFIER LP argument_list RP
    | drone_attrb
    | LP additive_expr RP
    | primary_expr operators primary_expr
;

drone_attrb:
    GET_HEADING
    | GET_ALTITUDE
    | GET_TIME
;

string_expr:
    STRING
    | FUNCTION IDENTIFIER LP RP
    | FUNCTION IDENTIFIER LP argument_list RP
    | IDENTIFIER ASSIGN STRING
    | IDENTIFIER ASSIGN string_expr
    | string_expr PLUS_OP string_expr
    | LP string_expr RP
;

logics:
    NON_OP logics
    | num_expr comparators num_expr
    | string_expr comparators string_expr
    | FUNCTION IDENTIFIER LP RP
    | FUNCTION IDENTIFIER LP argument_list RP
    | TRUE
    | FALSE
    | IDENTIFIER
;

logic_expr: IDENTIFIER ASSIGN logics;

operation_stmt: operation NEW_LINE;

operation:
    expr operators expr
    | short_operation
;

short_operation:
    num_expr INCREMENT
    | num_expr DECREMENT
;

operators:
    PLUS_OP
    | MINUS_OP
    | MULT_OP
    | DIV_OP
    | MOD_OP
    | NON_OP
;

comparators:
    EQUAL
    | NOT_EQUAL
    | GT
    | GTE
    | ST
    | STE
;

drone_stmt:
    drone_attrb
    | drone_moves NEW_LINE
;

drone_moves:
    MOVE_FORWARD
    | DESCEND
    | ASCEND
    | TURN_LEFT
    | TURN_RIGHT
    | NOZZLE_ON
    | NOZZLE_OFF
    | WAIT
    | STOP
    | CONNECT_DRONE LP STRING COMMA INTEGER RP
;

print_stmt:
    PRINT LP printable RP NEW_LINE
;

printable:
    expr
    | printable COMMA expr
;

break_stmt:
    BREAK NEW_LINE
;

import_stmt:
    IMPORT IDENTIFIER NEW_LINE
    | IMPORT IDENTIFIER AS IDENTIFIER NEW_LINE
    | FROM IDENTIFIER IMPORT IDENTIFIER NEW_LINE
    | FROM IDENTIFIER IMPORT IDENTIFIER AS IDENTIFIER NEW_LINE
;

comment_stmt: COMMENT NEW_LINE;

multicomment_stmt: MULTI_COMMENT NEW_LINE;

%%
#include "lex.yy.c"

/* Buranın altı baştan yazılacak pancar yiyebilir gibi */
int yyerror(char* s){
  fprintf(stderr, "\n%s on line %d!\n",s, yylineno);
  return 1;
}

int main(){
  yyparse();
  return 0;
}