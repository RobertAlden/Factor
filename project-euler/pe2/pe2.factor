USING:  io kernel math math.functions sequences 
        quotations continuations prettyprint ;
IN: pe2

: fib ( x -- x ) dup reverse first2 + suffix ;
: iter ( a b -- a c ) dup last pick < [ fib iter ] when ;

: answer ( -- ) 4000000 { 0 1 } iter 
                [ even? ] filter 
                sum . drop ;

MAIN: answer