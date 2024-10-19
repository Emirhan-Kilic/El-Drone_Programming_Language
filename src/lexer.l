%option main

/* Define patterns */
letter        [A-Za-z]
zero          [0]
nonZeroDigit  [1-9]
digit         ({zero}|{nonZeroDigit})
sign          [-+]
integer       {sign}?{digit}+
float         {sign}?{digit}*(\.)?{digit}+
number        ({float}|{integer})
alphanumeric  ({letter}+(({zero}|{letter})*|({nonZeroDigit}|{letter})*))
whitespace    [ \t]+
newline       \n
tab           \t

/* Reserved Words */
IF              "if"
ELSE            "else"
WHILE           "while"
FUNCTION        "function"
RETURN          "return"
FOR             "for"

/* Primitive Functions */
MOVE_LEFT       "MOVELeft"
MOVE_RIGHT      "MOVERight"
MOVE_UP         "MOVEUp"
MOVE_DOWN       "MOVEDown"
WAIT            "WAIT"
FORWARD         "FORWARD"
NOZZLE_ON       "NOZZLEOn"
NOZZLE_OFF      "NOZZLEOff"
ALTITUDE        "ALTITUDE"
HEADING         "HEADING"
TIME            "TIME"

/* Delimiters */
CURLY_LEFT      "{"
CURLY_RIGHT     "}"
PL              "("
PR              ")"
COMMA           ":"

/* Ops */
PLUS_OP         "+"
MINUS_OP        "-"
MULT_OP         "*"
DIV_OP          "/"
NON_OP          "!"

/* Comparators */
ASSIGN          "="
EQUAL           "=="
NON_EQUAL       "!="
G_THAN          ">"
L_THAN          "<"
G_THAN_E        ">="
L_THAN_E        "<="

%%

{IF}              { printf("IF, %s\n", yytext); }
{ELSE}            { printf("ELSE, %s\n", yytext); }
{WHILE}           { printf("WHILE, %s\n", yytext); }
{FUNCTION}        { printf("FUNCTION, %s\n", yytext); }
{RETURN}          { printf("RETURN, %s\n", yytext); }
{FOR}             { printf("FOR, %s\n", yytext); }

{MOVE_LEFT}       { printf("MOVE_LEFT, %s\n", yytext); }
{MOVE_RIGHT}      { printf("MOVE_RIGHT, %s\n", yytext); }
{MOVE_UP}         { printf("MOVE_UP, %s\n", yytext); }
{MOVE_DOWN}       { printf("MOVE_DOWN, %s\n", yytext); }
{WAIT}            { printf("WAIT, %s\n", yytext); }
{FORWARD}         { printf("FORWARD, %s\n", yytext); }
{NOZZLE_ON}       { printf("NOZZLE_ON, %s\n", yytext); }
{NOZZLE_OFF}      { printf("NOZZLE_OFF, %s\n", yytext); }
{ALTITUDE}        { printf("ALTITUDE, %s\n", yytext); }
{HEADING}         { printf("HEADING, %s\n", yytext); }
{TIME}            { printf("TIME, %s\n", yytext); }

{PLUS_OP}         { printf("PLUS_OP, %s\n", yytext); }
{MINUS_OP}        { printf("MINUS_OP, %s\n", yytext); }
{MULT_OP}         { printf("MULT_OP, %s\n", yytext); }
{DIV_OP}          { printf("DIV_OP, %s\n", yytext); }
{NON_OP}          { printf("NON_OP, %s\n", yytext); }

{ASSIGN}          { printf("ASSIGN, %s\n", yytext); }
{EQUAL}           { printf("EQUAL, %s\n", yytext); }
{NON_EQUAL}       { printf("NON_EQUAL, %s\n", yytext); }
{G_THAN}          { printf("GREATER_THAN, %s\n", yytext); }
{L_THAN}          { printf("LESS_THAN, %s\n", yytext); }
{G_THAN_E}        { printf("GREATER_THAN_OR_EQUAL, %s\n", yytext); }
{L_THAN_E}        { printf("LESS_THAN_OR_EQUAL, %s\n", yytext); }

{CURLY_LEFT}      { printf("CURLY_LEFT, %s\n", yytext); }
{CURLY_RIGHT}     { printf("CURLY_RIGHT, %s\n", yytext); }
{PL}              { printf("LEFT_PARENTHESIS, %s\n", yytext); }
{PR}              { printf("RIGHT_PARENTHESIS, %s\n", yytext); }
{COMMA}           { printf("COMMA, %s\n", yytext); }

{integer}         { printf("integer, %s\n", yytext); }
{alphanumeric}    { printf("alphanumeric, %s\n", yytext); }
{whitespace}      { /* Ignore whitespace */ }
{newline}         { /* Ignore newlines */ }
.                 { printf("UNKNOWN_TOKEN, %s\n", yytext); }
%%