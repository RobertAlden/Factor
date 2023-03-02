USING: kernel math math.functions prettyprint sequences ;
IN: pe9

: pythag ( a b -- c ) [ dup * ] bi@ + sqrt ;
: whole? ( a -- ? ) >integer - 0.0 = ;
: findB ( a -- b ) -1000 * 500000 + ;
: validB? ( a b -- a b ? )  < ;
: answer ( -- ) 500 findB . ; 
 
MAIN: answer

