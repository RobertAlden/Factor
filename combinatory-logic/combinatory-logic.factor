USING: arrays assocs kernel lexer math math.order quotations
ranges sequences sets splitting strings words unicode tools.test ;
IN: combinatory-logic

: vars ( -- vars ) "xyzwvutsrqponmlkjihgfedcba" ;

: lookup-table ( C -- def ) 
    H{ 
        { "I" "a"   } 
        { "K" "ab"  } 
        { "W" "ab"  } 
        { "S" "abc" } 
        { "C" "abc" } 
        { "B" "abc" }
        { "M" "a" }
        { "J" "abcd" }
    } at ;

: transform-table ( C -- res ) 
    H{
        { "I" "a"   }
        { "K" "a"   }
        { "W" "abb" }
        { "S" "ac(bc)" }
        { "C" "(ac)b" }
        { "B" "a(bc)" }
        { "M" "aa" }
        { "J" "ab(adc)" }
    } at ;

: translate ( C -- def abc ) [ transform-table ] [ lookup-table ] bi ;

: extract ( (x) -- x ) [| s |  1 41 s last-index s subseq ] call ;

: spop ( str -- f str ) dup dup length 0 > [ 1 head ] when ; 

: scut ( str -- f rest ) dup length 0 > [ 1 cut ] [ dup ] if ;

: find-outer-parens ( str -- seq ) 
    [ [ 40 = [ 1 ] [ 0 ] if ] { } map-as ] 
    [ [ 41 = [ 1 ] [ 0 ] if ] { } map-as ] bi
    [ - ] 2map 
    0 [ + ] accumulate*
    0 swap indices 
    1 head* [ 1 + ] { } map-as ;

: tokenize ( str -- seq ) dup 
    length 0 = not 
    [ dup find-outer-parens split-indices ] 
    when ; 

: pad-vars ( C abcs -- Cxyz abcs ) 
        dup vars swap diff ! string of var sequence to pad with
        '[ 2dup [ tokenize length ] bi@    ! get lengths 
        - 0 max                   ! and compare
        _ swap head               ! to find out how many vars to pad  
        append ] call ;           ! append and return

: truncate ( a b -- c a b ) tokenize over length cut [ "" join ] bi@ ; 

: binding-table ( C abcs -- bt ) 
    [ tokenize ] bi@ zip 
    { { "("  "(" } { ")"  ")" } } append ;

: atomize ( str -- seq ) dup length [1..b) split-indices ;

: paren? ( str -- str ? ) spop "(" = ;

: compute? ( str -- str ? ) spop upper? ; 

: elevate ( (a)bc -- abc ) tokenize scut swap [ paren? [ extract ] when ] map prepend "" join ;

: compute ( x -- x ) 
    [ paren? ] [ elevate ] while
    compute? 
    [ scut [ translate ] [ pad-vars truncate ] bi* 
    [ binding-table [ atomize ] dip '[ _ at ] map "" join ] [ append ] bi* ] when ;
    
: evaluate ( C -- F ) [ compute? ] [ compute ] while ; 

: resolve ( F -- Ff ) 
    evaluate 
    [ dup lower? ] [ 
        tokenize 
        [ paren? [ resolve dup length 1 > [ "(" prepend ")" append ] when ] when 
        ] map 
        "" join 
    ] until ; inline recursive

: compile ( str -- quot )  ;

: run-tests ( -- ) "combinatory-logic" test ;