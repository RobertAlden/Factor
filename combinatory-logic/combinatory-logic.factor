USING: lexer sequences strings kernel words quotations ;
IN: combinatory-logic


: I ( x -- x ) ;
: K ( a b -- a ) [ drop ] dip ;
: W ( a b -- a b b ) [ dup ] dip ;
: S ( a b c -- a c bc ) [ W curry swap ] dip ;
: C ( a b c -- a c b ) [ swap ] dip ;

: cmb>quot ( combinator -- quot ) 1string "combinatory-logic" lookup-word ;
SYNTAX: cl[ "]" parse-tokens concat [ cmb>quot ] { } map-as suffix! ;

