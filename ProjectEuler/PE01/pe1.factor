USING: io kernel math math.functions sequences quotations continuations prettyprint ;
IN: pe1

: rangeSum ( n -- n ) 2 swap dup 1 + * swap / ;
: rangeMultipleSum ( a b -- n ) over / floor rangeSum * ;
: answer ( -- ) { 15 5 3 } [ 999 rangeMultipleSum ] map [ + swap - ] with-datastack first . ;

MAIN: answer