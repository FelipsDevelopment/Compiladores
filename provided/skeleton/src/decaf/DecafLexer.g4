lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}


PARENTESESDIR   : ')';	 
PARENTESESESQ   : '(';
CHAVEDIR        : '}';
CHAVESQ         : '{';
COLCHETEDIR	: ']';
COLCHETESQ	: '[';
PONTOVIRGULA	: ';';
VIRGULA		: ',';
BARRAVERTICAL	: '|';
BARRABARRA	: '||';
BARRA		: '/'; 
PORCENTAGEM	: '%'; 
AND        	: '&&';
BOOL		: 'boolean';
CALL		: 'callout';
CLASS		: 'class';
INT		: 'int';
RETURN		: 'return';
VOID		: 'void';
FOR		: 'for';
BREAK		: 'break';
MAIN		: 'main';
PROGRAM		: 'Program';
CONTINUE	: 'continue';
ADICAO		: '+'	;
SUBTRACAO	: '-'	;
MULTIPLICACAO	: '*'	;
EXCLAMACAO	: '!'	;
DIFERENTED	: '!='	;
IGUAL		: '='	;
IGUALIGUAL	: '=='  ;
MAIORQUE	: '>'	;
MENORQUE	: '<'	;
MAIORIGUAL	: '>='	;
MENORIGUAL	: '<='	;
MAISIGUAL	: '+='	;
MENOSIGUAL	: '-='	;
BOOLEAN		: 'true'|'false';
IF	        : 'if';
ELSE		: 'else';




HEXLIT : (HEXDIGITO|NUM)+;

NUM : ('0'..'9');

CHAR : '\'' (ESC|NUM|LET)'\'';

STRING : '\"' (WS_|ESC|NUM|LET|SIMB)*'\"';

ID  : (LET|'_'|NUM|'forpar')+;	

WS_ : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

HEXLITERAL : HEXDIGITO; 


fragment
ESC :  '\\' ('n'|'t'|'"'|'\\');

fragment 
SIMB : ('\\\"'|'.'|','|'\\\''|'?'|':');

fragment 
LET :  ('a'..'z'|'A'..'Z');

fragment
HEXDIGITO : '0x'(NUM|'a'..'f'|'A'..'F')+; 


