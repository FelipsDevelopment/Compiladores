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


SINAIS     : '{'|'}'|'('|')'|'['|']'|'|'|';'|','|'&&';
OPERADORES : '+'|'-'|'*'|'<'|'>'|'<='|'!='|'=';
RESERVED   : 'boolean'|'callout'|'class'|'int'|'return'|'void'|'for'|'break'|'continue';
BOOLEAN	   : 'true'|'false';
IF	   : 'if'|'else';


HEXLIT : (HEXDIGITO|NUM)+;

NUM : ('0'..'9');

CHAR : '\'' (ESC|NUM|LET)'\'';

STRING : '\"' (WS_|ESC|NUM|LET|SIMB)*'\"';

ID  : (LET|'_'|NUM|'forpar')+;

WS_ : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


fragment
ESC :  '\\' ('n'|'t'|'"'|'\\');

fragment 
SIMB : ('\\\"'|'.'|','|'\\\''|'?'|':');

fragment 
LET :  ('a'..'z'|'A'..'Z');

fragment
HEXDIGITO : '0x'(NUM|'a'..'f'|'A'..'F')+; 


