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

%%
{integer}         { printf("integer, %s\n", yytext); }
{alphanumeric}    { printf("alphanumeric, %s\n", yytext); }
{identifier}      { printf("identifier, %s\n", yytext); }
{comment}      { printf("comment, %s\n", yytext); }

\n                { /* Ignore newline */ }
[ \t\n]+          { /* Ignore whitespace */ }
.                 { printf("Unknown token: %s\n", yytext); }
%%
