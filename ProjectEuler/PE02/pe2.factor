USING: io kernel math math.functions sequences quotations continuations prettyprint ;
IN: pe2

: fib ( x y -- y z ) swap over +
: iter ( a b c -- ) dup pick < [ fib iter ] [  ] if ;
: answer ( -- ) 4000000 0 1 + . ;

MAIN: answer