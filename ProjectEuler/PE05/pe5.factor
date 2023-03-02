USING:  io kernel math math.order math.functions ranges sequences 
        quotations continuations prettyprint ;
IN: pe5

: answer ( -- ) 20 [1..b] 1 [ lcm ] reduce . ; 

MAIN: answer