parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program	    : TK_class ID CHAVESQ field_decl method_decl CHAVESDIR EOF;

field_decl  : PARENTESESESQ type ID | type ID COLCHETESQ NUM COLCHETEDIR PARENTESESDIR;

method_decl : PARENTESESESQ type | VOID PARENTESESDIR ID PARENTESESESQ C0LCHETESQ CHAVESQ type ID CHAVEDIR ADICAO VIRGULA COLCHETEDIR PARENTESESDIR block;

block	    : CHAVESESQ var_decl MULTIPLICACAO statement MULTIPLICACAO CHAVESDIR;

var_decl    : type ID ADICAO VIRGULA PONTOVIRGULA;
 
type	    : NUM | BOOLEAN;

statement   : location assign_op expr PONTOVIRGULA 
	    | method_call PONTOVIRGULA 
	    | IF PARENTESESESQ expr PARENTESESDIR block COLCHETESQ ELSE block COLCHETEDIR
	    | FOR ID = expr VIRGULA expr block
  	    | RETURN COLCHETESQ expr COLCHETDIR PONTOVIRGULA
	    | BREAK PONTOVIRGULA
	    | CONTINUE PONTOVIRGULA
	    | block;


assign_op   : IGUAL 
	    | MAISIGUAL
	    | MENOSIGUAL;


method_call : method_name PARENTESESQ COLCHETESQ expr COLCHETEDIR PARENTESESDIR
	    | CALL PARENTESESESQ string_literal COLCHETESQ callout_arg COLCHETEDIR PARENTESESDIR;


method_name : ID;


location    : ID
	    | ID COLCHETESQ expr COLCHETEDIR;

expr	    : location
	    | method_call
	    | literal
	    | expr bin_op expr
	    | SUBTRACAO expr
	    | EXCLAMACAO expr
	    | PARENTESESESQ expr PARENTESESDIR;

	
callout_arg : expr | string_literal;


bin_op	    : arith_op | rel_op | eq_op | cond_op;


arith_op    : ADICAO | SUBTRACAO | MULTIPLICACAO | BARRA  | PORCENTAGEM;


rel_op	    : MENORQUE | MAIORQUE | MENORIGUAL | MAIORIGUAL ;


eq_op 	    : IGUALIGUAL | DIFERENTED;


cond_op	    : AND | BARRABARRA;


literal	    : int_literal | char_literal | bool_literal;


id	    : alpha alpha_num MULPLICACAO;


alpha_num   : alpha | digit;


alpha 	    : LET;


digit	    : NUM;


hex_digit   : HEXLIT;


int_literal : decimal_literal | hex_literal;


decimal_literal : digit digit MULPLICACAO;


hex_literal : HEXLITERAL;


bool_literal : TRUE | FALSE;


char_literal : CHAR MULTIPLICACAO;


string_literal : STRING MULPLICACAO;


