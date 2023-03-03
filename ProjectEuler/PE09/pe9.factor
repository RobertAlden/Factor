USING: arrays continuations grouping kernel math math.functions
prettyprint ranges sequences ;
IN: pe9

! m > n, a = m^2 - n^2; b = 2mn; c = m^2 + n^2; 
! If a + b + c = t, then n = (t / (2 * m)) - m;
! If m > n > 0, then  m > (t / (2 * m)) - m > 0, therefore sqrt(t / 2) > m > sqrt(t) / 2 ;
!

: getBounds ( t -- mf mc ) [ sqrt 2 / floor >integer ] [ 2 / sqrt >integer ] bi ; inline
: calculateN ( m -- mn ) dup dup 1000 swap 2 * / swap - 2array ;
: generateMNs ( ms -- mns ) [ 1array ] map [ [ calculateN ] with-datastack first ] map ; inline
: createA ( m n -- a ) 2array product 2 * ;
: createB ( m n -- b ) [ dup * ] bi@ - ;
: createC ( m n -- c ) 2array [ dup * ] map sum ;
: generateTriple ( m n -- a b c ) [ createA ] [ createB ] [ createC ] 2tri ; 
: applyFilters ( seq -- seq ) [ [ > ] monotonic? ] filter [ last integer? ] filter first ; inline

: answer ( -- ) 1000 getBounds [a..b) generateMNs applyFilters [ generateTriple ] with-datastack product . ; 



MAIN: answer

