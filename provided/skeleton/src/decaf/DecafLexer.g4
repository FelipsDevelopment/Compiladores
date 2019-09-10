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

IF : 'if'|'else';
LCURLY : '{';
RCURLY : '}';
PLEFT  : '('; 
PRIGHT : ')';
CLEFT  : '[';
CRIGHT : ']';
ADICAO : '+';
SUB    : '-';
MULTI  : '*';
MENORMAIOR : '<';
MENORIGUAL : '<=';
MENORDIFERENTE: '!=';
E : '&&';
RESERVED :'boolean'|'callout'|'class'|'int'|'return'|'void'|'for'|'break'|'continue';
BOOLEAN : 'true'|'false';


ID  :
  (LET|'_'|NUM|'forpar')+;

WS_ : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|LET|NUM)'\'';
STRING : '\"' (WS_|ESC|NUM|LET|SIMB)*'\"';
HEXLIT : '0x'(NUM|HEXDIGITO)+;
NUM : ('0'..'9');

fragment
ESC :  '\\' ('n'|'t'|'"'|'\\');

fragment 
SIMB : ('\\\"'|'.'|','|'\\\''|'?'|':');

fragment 
LET :  ('a'..'z'|'A'..'Z');

fragment
HEXDIGITO : ('a'..'f'|'A'..'F'); 


