USING:  io kernel math math.order math.functions ranges sequences 
        quotations continuations prettyprint ;
IN: pe6

: squareOfSum ( seq -- x ) sum dup * ; 
: sumOfSquares ( seq -- x ) [ dup * ] map sum ;
: answer ( -- ) 1 100 [a..b] [ squareOfSum ] [ sumOfSquares ] bi - . ;

MAIN: answer