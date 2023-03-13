USING: io.encodings.utf8 io.files kernel math.parser prettyprint
sequences sequences.windowed splitting ; 

IN: pe8

: fetchFile ( filepath -- seq ) utf8 file-contents split-lines ;
: fileToString ( filepath -- n ) fetchFile "" join ; 
: window ( n seq -- seq ) over <windowed-sequence> swap '[ length _ = ] filter ;
: answer ( -- ) 13 ".\\ProjectEuler\\PE08\\pe8-input.txt" fileToString window [ string>digits product ] map supremum . ;

MAIN: answer