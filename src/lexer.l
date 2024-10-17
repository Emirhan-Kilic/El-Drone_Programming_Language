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
%%
{integer}           { printf("integer, %s\n", yytext); }
{alphanumeric}    { printf("alphanumeric, %s\n", yytext); }
\n                { /* Ignore newline */ }

