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
{string}             { printf("string, %s\n", yytext); }

"getHeading"        { printf("KEYWORD: getHeading\n"); }
"getAltitude"       { printf("KEYWORD: getAltitude\n"); }
"getCurrentTime"    { printf("KEYWORD: getCurrentTime\n"); }
"moveForward"       { printf("KEYWORD: moveForward\n"); }
"descend"           { printf("KEYWORD: descend\n"); }
"ascend"            { printf("KEYWORD: ascend\n"); }
"turnLeft"          { printf("KEYWORD: turnLeft\n"); }
"turnRight"         { printf("KEYWORD: turnRight\n"); }
"wait"              { printf("KEYWORD: wait\n"); }
"stop"              { printf("KEYWORD: stop\n"); }
"enableNozzle"      { printf("KEYWORD: enableNozzle\n"); }
"disableNozzle"     { printf("KEYWORD: disableNozzle\n"); }
"connectToDrone"    { printf("KEYWORD: connectToDrone\n"); }

"print"             { printf("print, %s\n", yytext);}
"input"             { printf("input, %s\n", yytext);}


"if"                { printf("IF, %s\n", yytext); }
"else if"           { printf("ELSE_IF, %s\n", yytext); }
"else"              { printf("ELSE, %s\n", yytext); }
"while"             { printf("while, %s\n", yytext); }
"for"               { printf("for, %s\n", yytext); }

"and"             { printf("and (&&), %s\n", yytext);}
"or"              { printf("or (||), %s\n", yytext);}

"="               { printf("assign, %s\n", yytext);}
"=="              { printf("Equal, %s\n", yytext);}
"!="              { printf("Not Equal, %s\n", yytext);}

">"               { printf("Larger Than, %s\n", yytext);}
">="              { printf("Larger Than Equal, %s\n", yytext);}

"<"               { printf("Smaller Than, %s\n", yytext);}
"<="              { printf("Smaller Than Equal, %s\n", yytext);}

"+"               { printf("Addition OP, %s\n", yytext);}
"-"               { printf("Subtraction OP, %s\n", yytext);}
"*"               { printf("Multiplication OP, %s\n", yytext);}
"/"               { printf("Division OP, %s\n", yytext);}
"%"               { printf("Mod OP, %s\n", yytext);}

"("               { printf("Left Parenthesis, %s\n", yytext);}
"{"               { printf("Left Curly Parenthesis, %s\n", yytext);}
")"               { printf("Right Parenthesis, %s\n", yytext);}
"}"               { printf("Right Curly Parenthesis, %s\n", yytext);}

";"               { printf("Semi Colon, %s\n", yytext);}
","               { printf("Comma, %s\n", yytext);}


{integer}         { printf("integer, %s\n", yytext); }
{float}           { printf("float, %s\n", yytext); }
{identifier}      { printf("identifier, %s\n", yytext); }
{alphanumeric}    { printf("alphanumeric, %s\n", yytext); }
{comment}         { printf("comment, %s\n", yytext); }

\n                { /* Ignore newline */ }
[ \t\n]+          { /* Ignore whitespace */ }
.                 { printf("Unknown token: %s\n", yytext); }
%%
