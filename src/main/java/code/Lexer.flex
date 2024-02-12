package code;
import static code.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
public String lexeme;
%}
%%
entero |
cadena |
caracter|
flotante|
si|
sino |
principal|
ciclo|
eleccion|
caso|
parar|
presenta|
haz|
mientras|
while {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*."*/" {/*Ignore*/}
"'".*."'" {return Cadena;}
"=" {return Asignacion;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"==" {return Comparacion;}
"(" {return ParentesisApertura;}
")" {return ParentesisCierre;}
"{" {return LlaveApertura;}
"}" {return LlaveCierre;}
";" {return PuntoYComa;}
">" {return Mayor;}
"<" {return Menor;}
">=" {return MayorIgual;}
"<=" {return MenorIgual;}
"?" {return OpTernario;}
":" {return OpSeparacion;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
