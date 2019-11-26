parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program	    : CLASS PROGRAM CHAVESQ (var_decl+)* method_decl* CHAVEDIR ;

method_decl : (type | VOID ) ID PARENTESESESQ ((var_decl)+ PONTUACAO*)? PARENTESESDIR block_decl ;

block_decl	: CHAVESQ var_decl* statement_decl* CHAVEDIR ;

var_decl    : type (ID PONTUACAO* )* array_decl? PONTUACAO*;

array_decl	: COLCHETESQ INTLIT COLCHETEDIR;

type_decl   : type ID;
 
type	    : T_INT | BOOLEAN;

statement_decl   : location_decl assign_op expr_decl PONTUACAO 
	    | method_call PONTUACAO 
	    | IF (expr_decl block_decl) (ELSE block_decl)?
	    | FOR ID IGUAL expr_decl PONTUACAO* expr_decl block_decl
  	    | RETURN  expr_decl? PONTUACAO
	    | BREAK PONTUACAO
	    | CONTINUE PONTUACAO
	    | block_decl;


assign_op   : ATRIBUICAO | IGUAL ;


method_call : ID PARENTESESESQ expr_decl (PONTUACAO expr_decl)* PARENTESESDIR 
			| CALL PARENTESESESQ STRING (PONTUACAO* (expr_decl | STRING)+ PONTUACAO*)? PARENTESESDIR;
	   
method_name : ID;


location_decl  : ID | ID COLCHETESQ expr_decl COLCHETEDIR;

expr_decl	: location_decl
	    | method_call
	    | identifier_decl
	    | expr_decl bin_op expr_decl
	    | bin_op expr_decl*
	    | PONTUACAO expr_decl*
	    | PARENTESESESQ expr_decl PARENTESESDIR;
	

identifier_decl: INTLIT INTLIT* | INTLIT | CHAR | BOOLEANLIT; 	

bin_op	    : op | comp | igual | and;

op : OPERADORES ;

comp : COMPARACAO;

igual: OP_DE_IGUALDADE;

and: EE;