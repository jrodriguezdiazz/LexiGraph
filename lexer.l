%{
#include <stdio.h>

// Aquí puedes incluir definiciones de C necesarias o variables globales
int lin_num = 1;
%}

%%

main            { printf("MAIN %d\n", lin_num); }
int             { printf("INT %d\n", lin_num); }
float           { printf("FLOAT %d\n", lin_num); }
if              { printf("IF %d\n", lin_num); }
else            { printf("ELSE %d\n", lin_num); }
while           { printf("WHILE %d\n", lin_num); }
read            { printf("READ %d\n", lin_num); }
print           { printf("PRINT %d\n", lin_num); }
\(              { printf("LBRACKET %d\n", lin_num); }
\)              { printf("RBRACKET %d\n", lin_num); }
\{              { printf("LBRACE %d\n", lin_num); }
\}              { printf("RBRACE %d\n", lin_num); }
,               { printf("COMMA %d\n", lin_num); }
;               { printf("PCOMMA %d\n", lin_num); }
==              { printf("EQ %d\n", lin_num); }
!=              { printf("NE %d\n", lin_num); }
<=              { printf("LE %d\n", lin_num); }
>=              { printf("GE %d\n", lin_num); }
\|\|            { printf("OR %d\n", lin_num); }
&&              { printf("AND %d\n", lin_num); }
=               { printf("ATTR %d\n", lin_num); }
<               { printf("LT %d\n", lin_num); }
>               { printf("GT %d\n", lin_num); }
\+              { printf("PLUS %d\n", lin_num); }
-               { printf("MINUS %d\n", lin_num); }
\*              { printf("MULT %d\n", lin_num); }
\/              { printf("DIV %d\n", lin_num); }
[a-zA-Z]\w*     { printf("ID %d\n", lin_num); }
\d+\.\d+        { printf("FLOAT_CONST %d\n", lin_num); }
\d+             { printf("INTEGER_CONST %d\n", lin_num); }
\n              { ++lin_num; printf("NEWLINE %d\n", lin_num); }
[ \t]+          { /* Ignorar espacios y tabs */ }
.               { printf("MISMATCH %d\n", lin_num); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
