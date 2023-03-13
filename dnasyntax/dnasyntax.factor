USING: bit-arrays combinators lexer sequences ;
IN: dnasyntax 

: dna>bits ( token -- bits ) {
    { CHAR: a [ { f f } ] }
    { CHAR: c [ { t t } ] }
    { CHAR: g [ { f t } ] }
    { CHAR: t [ { t f } ] }
} case ;

SYNTAX: DNA{ "}" parse-tokens concat [ dna>bits ] { } map-as concat >bit-array suffix! ;
