USING: ; 
IN: pe11


: fetchFile ( filepath -- seq ) utf8 file-contents split-lines ;
: fileToString ( filepath -- n ) fetchFile " " join ;
: loadData ( x -- x ) fileToString " " split [ string>number ] map ;
: answer ( -- ) 20 4 ".\\ProjectEuler\\PE11\\pe11.txt" loadData 0 [ + ] reduce . . . ; 


MAIN: answer