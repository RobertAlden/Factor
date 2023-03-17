USING: assocs kernel lexer math math.order quotations sequences strings words  ;
IN: combinatory-logic

: lookup-table ( C -- def ) 
    H{ 
        { "I" "a"   } 
        { "K" "ab"  } 
        { "W" "ab"  } 
        { "S" "abc" } 
        { "C" "abc" } 
    } at ;

: transform-table ( C -- res ) 
    H{
        { "I" "a"   }
        { "K" "a"   }
        { "W" "abb" }
        { "S" "ac(bc)" }
    } at ;

: translate ( C -- def abc ) [ transform-table ] [ lookup-table ] bi ;

: pad-vars ( C abcs -- Cxyz abcs ) 
        "xyznopqrstuvw0123456789" ! string of var sequence to pad with
        '[ 2dup [ length ] bi@    ! get lengths -todo fix for parens
        - 0 max                   ! and compare
        _ swap head               ! to find out how many vars to pad  
        append ] call ;           ! append and return

: binding-table ( C abcs -- bt ) [ "()" append ] bi@ zip ;

: paren? ( x -- x ) first CHAR: ( = ;

: extract ( (x) -- x ) [| s |  1 41 1 s index-from s subseq ] call ;

! : group-parens ( seq -- seq ) dup [ "(" swap index ] [ ")" swap last-index ] bi 1 + pick subseq "" join ;

: find-outer-parens ( str -- seq ) 
    [ [ 40 = [ 1 ] [ 0 ] if ] { } map-as ] 
    [ [ 41 = [ 1 ] [ 0 ] if ] { } map-as ] bi
    [ - ] 2map 
    0 [ + ] accumulate*
    0 swap indices ;

: atomize ( str -- seq ) dup length [1..b) split-indices ; 

: tokenize ( str -- seq ) dup 
    [ 40 swap index ] [ 41 swap last-index ] bi 
    1 + 2array split-indices 
    dup [ ] [ ] bi ;

: compute ( x -- x ) 
    1 cut [ translate ] [ pad-vars ] bi* 
    over length cut ! -- TODO: fix for parens
    [ binding-table ] dip [ '[ _ at ] map ] dip append ; 