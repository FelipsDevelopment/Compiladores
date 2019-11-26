 lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

PARENTESESDIR   : ')';	 
PARENTESESESQ   : '(';
CHAVEDIR        : '}';
CHAVESQ         : '{';
COLCHETEDIR	    : ']';
COLCHETESQ	    : '[';
BARRAVERTICAL	  : '|';
BOOLEAN		: 'boolean';
CALL	   	: 'callout';
CLASS		  : 'class';
T_INT		  : 'int';
RETURN		: 'return';
VOID	  	: 'void';
FOR		    : 'for';
BREAK		  : 'break';
PROGRAM   : 'Program';
CONTINUE	: 'continue';
IF	      : 'if';
ELSE		  : 'else';
OPERADORES      : ('+' | '-' | '*' | '/' | '%');
COMPARACAO      : ('<' | '>' | '<=' | '>=' );
OP_DE_IGUALDADE : ('==' | '!=');
EE              : ('&&' | '||');
ATRIBUICAO      : ('+=' | '-=');
IGUAL		        : '='	;
PONTUACAO       : ','|';'|'!';
HIFEN           : '-';
INTLIT     : [0-9]+ ('x' ([a-fA-F] | [0-9])+)?;
BOOLEANLIT : 'true'|'false';


CHAR       : '\'' ([!#-&(-.0-Z^-~] | INT | ESC)'\'';

STRING     : '"' ( ID | SIMB )+'"';

ID         : ('a'..'z'|'A'..'Z'|'_'|'%' )+ ([0-9])* ID?;	

WS_        : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


fragment
ESC :  '\\' ('n'|'t'|'"'|'\\');

fragment 
SIMB : ('.'|'?'|','|':'|';'|' '|'!'| ESP);

fragment
ESP:  '\\' ('\'' | '\"' | '\\' | ID);

fragment
INT : ('0'..'9');




