import java_cup.runtime.Symbol;

/*
Directivas:
public: classe publica
cup: compatibilidade com cup
full: estende o alfabeto com todos os valores de 8 bits
linha: adicionar a variável int yyline, para indicar a linha do lexema
char: adicionar a variável int yychar, para indicar o índice do primeiro caractere do lexema
ignorecase: validar, independentemente de a letra ser maiúscula ou minúscula
eofval: especifica um valor de retorno no final do arquivo
*/

%%

%class Scanner
%cup
%full
%line
%char
%eofval{
	return new Symbol(Tokens.EOF,new String("Fim do arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
id = {letra}({letra}|{digito}|"_")*
espaco = \t|\f|" "|\r|\n

%%

"mais"			{return new Symbol(Tokens.MAIS, yytext());}
"menos"			{return new Symbol(Tokens.MENOS, yytext());}
"vezes"			{return new Symbol(Tokens.VEZES, yytext());}
//"d1v1d1do por"			{return new Symbol(Tokens.DIV, yytext());}
"ao quadrado"			{return new Symbol(Tokens.QUADRADO, yytext());}
//"ra1z quadrada de"			{return new Symbol(Tokens.RAIZ, yytext());}
"guardar"			{return new Symbol(Tokens.GUARDAR, yytext());}
"em"			{return new Symbol(Tokens.EM, yytext());}
"("			{return new Symbol(Tokens.APAR, yytext());}
")"			{return new Symbol(Tokens.FPAR, yytext());}
"se"			{return new Symbol(Tokens.SE, yytext());}
"entao"			{return new Symbol(Tokens.ENTAO, yytext());}
//"senao"			{return new Symbol(Tokens.SENAO, yytext());}
"maior"			{return new Symbol(Tokens.MAIOR, yytext());}
"menor"			{return new Symbol(Tokens.MENOR, yytext());}
"1gual"			{return new Symbol(Tokens.IGUAL, yytext());}
"que"			{return new Symbol(Tokens.QUE, yytext());}
"a"			{return new Symbol(Tokens.A, yytext());}
//"para"			{return new Symbol(Tokens.PARA, yytext());}
//"["			{return new Symbol(Tokens.ACOL, yytext());}
//"]"			{return new Symbol(Tokens.FCOL, yytext());}
//","			{return new Symbol(Tokens.VIRGULA, yytext());}
//"faca"			{return new Symbol(Tokens.FACA, yytext());}
//"enquanto"			{return new Symbol(Tokens.ENQUANTO, yytext());}
\n         {return new Symbol(Tokens.EOL, yytext());}
{id}		{return new Symbol(Tokens.ID, yytext());}
{digito}+	{return new Symbol(Tokens.NUMERO, new Integer(yytext()));}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
