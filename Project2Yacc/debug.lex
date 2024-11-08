%option noyywrap
%option yylineno

/* Define patterns */
letter        [A-Za-z]
symbols       [_]
zero          [0]
nonZeroDigit  [1-9]
digit         ({zero}|{nonZeroDigit})
sign          [-+]
integer       {digit}+
float         {digit}*(\.)?{digit}+
number        ({float}|{integer})
alphanumeric  ({letter}+({zero}|{nonZeroDigit}|{letter})*)
identifier    ({alphanumeric}+({alphanumeric}|{symbols}|{digit})*)
comment       ("#"[^\n]*)
multi_comment  "##"([^#]|#[^#])*"##"
stringSingleQuote  (\'[^']*\')
stringDoubleQuote  (\"[^"]*\")
string             ({stringSingleQuote}|{stringDoubleQuote})

%%

{string}          {
                    printf("Token: STRING -> %s\n", yytext);
                    return STRING;
                  }

getHEADING        {
                    printf("Token: GET_HEADING -> %s\n", yytext);
                    return GET_HEADING;
                  }
getALTITUDE       {
                    printf("Token: GET_ALTITUDE -> %s\n", yytext);
                    return GET_ALTITUDE;
                  }
getTIME           {
                    printf("Token: GET_TIME -> %s\n", yytext);
                    return GET_TIME;
                  }
moveFORWARD       {
                    printf("Token: MOVE_FORWARD -> %s\n", yytext);
                    return MOVE_FORWARD;
                  }
DESCEND           {
                    printf("Token: DESCEND -> %s\n", yytext);
                    return DESCEND;
                  }
ASCEND            {
                    printf("Token: ASCEND -> %s\n", yytext);
                    return ASCEND;
                  }
turnLEFT          {
                    printf("Token: TURN_LEFT -> %s\n", yytext);
                    return TURN_LEFT;
                  }
turnRIGHT         {
                    printf("Token: TURN_RIGHT -> %s\n", yytext);
                    return TURN_RIGHT;
                  }
WAIT              {
                    printf("Token: WAIT -> %s\n", yytext);
                    return WAIT;
                  }
STOP              {
                    printf("Token: STOP -> %s\n", yytext);
                    return STOP;
                  }
nozzleON          {
                    printf("Token: NOZZLE_ON -> %s\n", yytext);
                    return NOZZLE_ON;
                  }
nozzleOFF         {
                    printf("Token: NOZZLE_OFF -> %s\n", yytext);
                    return NOZZLE_OFF;
                  }
connectDRONE      {
                    printf("Token: CONNECT_DRONE -> %s\n", yytext);
                    return CONNECT_DRONE;
                  }

function          {
                    printf("Token: FUNCTION -> %s\n", yytext);
                    return FUNCTION;
                  }
print             {
                    printf("Token: PRINT -> %s\n", yytext);
                    return PRINT;
                  }
input             {
                    printf("Token: INPUT -> %s\n", yytext);
                    return INPUT;
                  }
return            {
                    printf("Token: RETURN -> %s\n", yytext);
                    return RETURN;
                  }
break             {
                    printf("Token: BREAK -> %s\n", yytext);
                    return BREAK;
                  }

import           {
                    printf("Token: IMPORT -> %s\n", yytext);
                    return IMPORT;
                  }
as               {
                    printf("Token: AS -> %s\n", yytext);
                    return AS;
                  }
from             {
                    printf("Token: FROM -> %s\n", yytext);
                    return FROM;
                  }

if               {
                    printf("Token: IF -> %s\n", yytext);
                    return IF;
                  }
"else if"        {
                    printf("Token: ELSE_IF -> %s\n", yytext);
                    return ELSE_IF;
                  }
else             {
                    printf("Token: ELSE -> %s\n", yytext);
                    return ELSE;
                  }
while            {
                    printf("Token: WHILE -> %s\n", yytext);
                    return WHILE;
                  }
for              {
                    printf("Token: FOR -> %s\n", yytext);
                    return FOR;
                  }
and              {
                    printf("Token: AND -> %s\n", yytext);
                    return AND;
                  }
or               {
                    printf("Token: OR -> %s\n", yytext);
                    return OR;
                  }
not              {
                    printf("Token: NOT -> %s\n", yytext);
                    return NOT;
                  }
TRUE             {
                    printf("Token: TRUE -> %s\n", yytext);
                    return TRUE;
                  }
FALSE            {
                    printf("Token: FALSE -> %s\n", yytext);
                    return FALSE;
                  }

"="              {
                    printf("Token: ASSIGN -> %s\n", yytext);
                    return ASSIGN;
                  }
"=="             {
                    printf("Token: EQUAL -> %s\n", yytext);
                    return EQUAL;
                  }
"!="             {
                    printf("Token: NOT_EQUAL -> %s\n", yytext);
                    return NOT_EQUAL;
                  }

">"              {
                    printf("Token: GT -> %s\n", yytext);
                    return GT;
                  }
">="             {
                    printf("Token: GTE -> %s\n", yytext);
                    return GTE;
                  }
"<"              {
                    printf("Token: ST -> %s\n", yytext);
                    return ST;
                  }
"<="             {
                    printf("Token: STE -> %s\n", yytext);
                    return STE;
                  }

"+"              {
                    printf("Token: PLUS_OP -> %s\n", yytext);
                    return PLUS_OP;
                  }
"-"              {
                    printf("Token: MINUS_OP -> %s\n", yytext);
                    return MINUS_OP;
                  }
"*"              {
                    printf("Token: MULT_OP -> %s\n", yytext);
                    return MULT_OP;
                  }
"/"              {
                    printf("Token: DIV_OP -> %s\n", yytext);
                    return DIV_OP;
                  }
"%"              {
                    printf("Token: MOD_OP -> %s\n", yytext);
                    return MOD_OP;
                  }
"!"              {
                    printf("Token: NON_OP -> %s\n", yytext);
                    return NON_OP;
                  }

"+="             {
                    printf("Token: ADD_ASSIGN -> %s\n", yytext);
                    return ADD_ASSIGN;
                  }
"-="             {
                    printf("Token: SUB_ASSIGN -> %s\n", yytext);
                    return SUB_ASSIGN;
                  }
"*="             {
                    printf("Token: MUL_ASSIGN -> %s\n", yytext);
                    return MUL_ASSIGN;
                  }
"/="             {
                    printf("Token: DIV_ASSIGN -> %s\n", yytext);
                    return DIV_ASSIGN;
                  }

"++"             {
                    printf("Token: INCREMENT -> %s\n", yytext);
                    return INCREMENT;
                  }
"--"             {
                    printf("Token: DECREMENT -> %s\n", yytext);
                    return DECREMENT;
                  }

"("              {
                    printf("Token: LP -> %s\n", yytext);
                    return LP;
                  }
"{"              {
                    printf("Token: CLB -> %s\n", yytext);
                    return CLB;
                  }
")"              {
                    printf("Token: RP -> %s\n", yytext);
                    return RP;
                  }
"}"              {
                    printf("Token: RCB -> %s\n", yytext);
                    return RCB;
                  }

","              {
                    printf("Token: COMMA -> %s\n", yytext);
                    return COMMA;
                  }

{integer}        {
                    printf("Token: INTEGER -> %s\n", yytext);
                    return INTEGER;
                  }
{float}          {
                    printf("Token: FLOAT -> %s\n", yytext);
                    return FLOAT;
                  }
{identifier}     {
                    printf("Token: IDENTIFIER -> %s\n", yytext);
                    return IDENTIFIER;
                  }
{multi_comment}  {
                    printf("Token: MULTI_COMMENT -> %s\n", yytext);
                    return MULTI_COMMENT;
                  }
{comment}        {
                    printf("Token: COMMENT -> %s\n", yytext);
                    return COMMENT;
                  }

[ \t]            { /* Ignore whitespace */ }
\n               { return NEW_LINE; }
\r\n             { return NEW_LINE; }
.                {
                    printf("Token: UNKNOWN -> %s\n", yytext);
                    return UNKNOWN;
                  }

%%

