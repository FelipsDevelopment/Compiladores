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

field_decl  : (type ID | type id COLCHETESQ NUM COLCHETEDIR);

method_decl : (type | VOID) ID PARENTESESESQ COLCHETESESQ type ID COLCHETEDIR PARENTESESDIR block;

block	    : CHAVESESQ var_decl statement CHAVESDIR;

var_decl    : type ID;
 
type	    : NUM | BOOLEAN;

statement   : location assign_op expr



