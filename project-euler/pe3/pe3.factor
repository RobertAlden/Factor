USING:  io kernel math math.order math.functions sequences 
        quotations continuations prettyprint ;
IN: pe3

: add ( a b c -- a b c ) over suffix rot pick / -rot ;
: inc ( a b -- a b ) swap 1 + swap ;
: iter ( a b c -- a b c ) 2over / 1 mod 0 = [ add ] [ inc ] if ;
: answer ( -- ) 600851475143 2 { } 
                [ pick 1 = ] [ iter ] until 
                last . 
                2drop ; 

MAIN: answer