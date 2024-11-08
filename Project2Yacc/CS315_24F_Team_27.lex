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
{string}          { return STRING; }

getHEADING        { return GET_HEADING; }
getALTITUDE       { return GET_ALTITUDE; }
getTIME           { return GET_TIME; }
moveFORWARD       { return MOVE_FORWARD; }
DESCEND           { return DESCEND; }
ASCEND            { return ASCEND; }
turnLEFT          { return TURN_LEFT; }
turnRIGHT         { return TURN_RIGHT; }
WAIT              { return WAIT; }
STOP              { return STOP; }
nozzleON          { return NOZZLE_ON; }
nozzleOFF         { return NOZZLE_OFF; }
connectDRONE      { return CONNECT_DRONE; }

function          { return FUNCTION; }
print             { return PRINT; }
input             { return INPUT; }
return            { return RETURN; }
break             { return BREAK; }

import           { return IMPORT; }
as               { return AS; }
from             { return FROM; }

if               { return IF; }
"else if"        { return ELSE_IF; }
else             { return ELSE; }
while            { return WHILE; }
for              { return FOR; }
and              { return AND; }
or               { return OR; }
not              { return NOT; }
TRUE             { return TRUE; }
FALSE            { return FALSE; }

"="              { return ASSIGN; }
"=="             { return EQUAL; }
"!="             { return NOT_EQUAL; }

">"              { return GT; }
">="             { return GTE; }
"<"              { return ST; }
"<="             { return STE; }

"+"              { return PLUS_OP; }
"-"              { return MINUS_OP; }
"*"              { return MULT_OP; }
"/"              { return DIV_OP; }
"%"              { return MOD_OP; }
"!"              { return NON_OP; }

"+="             { return ADD_ASSIGN; }
"-="             { return SUB_ASSIGN; }
"*="             { return MUL_ASSIGN; }
"/="             { return DIV_ASSIGN; }

"++"             { return INCREMENT; }
"--"             { return DECREMENT; }

"("              { return LP; }
"{"              { return CLB; }
")"              { return RP; }
"}"              { return RCB; }

","              { return COMMA; }

{integer}        { return INTEGER; }
{float}          { return FLOAT; }
{identifier}     { return IDENTIFIER; }
{multi_comment}  { return MULTI_COMMENT; }
{comment}        { return COMMENT; }

[ \t]            { /* Ignore whitespace */ }
\n               { return NEW_LINE; }
\r\n             { return NEW_LINE; }
.                { return UNKNOWN; }
%%