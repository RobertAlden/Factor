USING: unicode ; 
IN: scratch
! Combinators
: S ( x y z -- result )
    [ call ] dip call ;

: K ( x y -- x )
    drop ;

: I ( x -- x ) ;

! Parser
: parse-logic ( str -- parsed-expr )
    >upper
    [ 
        CHAR: S [ "S" ] bi*
        CHAR: K [ "K" ] bi*
        CHAR: I [ "I" ] bi*
    ] assoc-union { } map-as ;

! Evaluator
: evaluate ( parsed-expr -- result )
    [ dup "S" = ]
    [ drop S ]
    [ dup "K" = ]
    [ drop K ]
    [ dup "I" = ]
    [ drop I ]
    tri* ;

! Main Execution
: cl-execute ( str -- result )
    parse-logic evaluate ;

! Test combinatory logic expressions
"cl[ SKK ]" cl-execute .
"cl[ KI ]" cl-execute .
