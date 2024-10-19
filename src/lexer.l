%option main
%option noyywrap
%option yylineno

/* Define patterns */
letter        [A-Za-z]
symbols       [-_]
zero          [0]
nonZeroDigit  [1-9]
digit         ({zero}|{nonZeroDigit})
sign          [-+]
integer       {sign}?{digit}+
float         {sign}?{digit}*(\.)?{digit}+
number        ({float}|{integer})
alphanumeric  ({letter}+({zero}|{nonZeroDigit}|{letter})*)
identifier    ({alphanumeric}+({alphanumeric}|{symbols}|{digit})*)
comment       ("#"[^\n]*)
stringSingleQuote  (\'[^']*\')
stringDoubleQuote  (\"[^"]*\")
string             ({stringSingleQuote}|{stringDoubleQuote})

%%
{string}          { printf("STRING "); }

getHEADING        { printf("GET_HEADING "); }
getALTITUDE       { printf("GET_ALTITUDE "); }
getTIME           { printf("GET_TIME "); }
moveFORWARD       { printf("MOVE_FORWARD "); }
DESCEND           { printf("DESCEND "); }
ASCEND            { printf("ASCEND "); }
moveLEFT          { printf("MOVE_LEFT "); }
moveRIGHT         { printf("MOVE_RIGHT "); }
WAIT              { printf("WAIT "); }
STOP              { printf("STOP "); }
nozzleON          { printf("NOZZLE_ON "); }
nozzleOFF         { printf("NOZZLE_OFF "); }
connectDRONE      { printf("CONNECT_DRONE "); }

function          { printf("FUNCTION "); }
print             { printf("PRINT "); }
input             { printf("INPUT "); }
return            { printf("RETURN "); }

import          { printf("IMPORT "); }
as              { printf("AS "); }
from            { printf("FROM "); }

if                { printf("IF "); }
"else if"         { printf("ELSE_IF "); }
else              { printf("ELSE "); }
while             { printf("WHILE "); }
for               { printf("FOR "); }
and               { printf("AND "); }
or                { printf("OR "); }
TRUE              { printf("TRUE "); }
FALSE             { printf("FALSE "); }

"="               { printf("ASSIGN "); }
"=="              { printf("EQUAL "); }
"!="              { printf("NOT_EQUAL "); }

">"               { printf("GT "); }
">="              { printf("GTE "); }
"<"               { printf("ST "); }
"<="              { printf("STE "); }

"+"               { printf("PLUS_OP "); }
"-"               { printf("MINUS_OP "); }
"*"               { printf("MULT_OP "); }
"/"               { printf("DIV_OP "); }
"%"               { printf("MOD_OP "); }
"!"               { printf("NON_OP "); }

"("               { printf("LP "); }
"{"               { printf("CLB "); }
")"               { printf("RP "); }
"}"               { printf("RCB "); }

","               { printf("COMMA "); }

{integer}         { printf("INTEGER "); }
{float}           { printf("FLOAT "); }
{identifier}      { printf("IDENTIFIER "); }
{comment}         { printf("COMMENT "); }

[ \t]            { /* Ignore whitespace */ }
\n                  { printf("NEW_LINE "); }
\r\n                { printf("NEW_LINE "); }
.                { printf("Unknown token: %s\n  end", yytext);}
%%