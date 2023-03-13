USING:  io kernel math math.order math.functions ranges sequences 
        quotations continuations prettyprint ;
IN: pe4

: palindrome ( n -- ? ) number>string dup reverse = ;
: products ( x y -- seq ) [a..b] dup cartesian-product { } join [ product ] map ;
: answer ( -- ) 900 999 products [ palindrome ] filter supremum . ;
 
MAIN: answer