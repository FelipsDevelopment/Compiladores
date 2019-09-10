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


ID  :
  (LET|'_'|NUM)+;

WS_ : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|LET|NUM)'\'';
STRING : '\"' (WS_|ESC|NUM|LET|SIMB)*'\"';
HEXLIT : '0x'(HEXDIGITO|NUM)+;
NUM : ('0'..'9');

fragment
ESC :  '\\' ('n'|'t'|'"'|'\\');

fragment 
SIMB : ('\\\"'|'.'|','|'\\\''|'?'|':');

fragment 
LET :  ('a'..'z'|'A'..'Z');

fragment
HEXDIGITO : ('a'..'f'|'A'..'F'); 


