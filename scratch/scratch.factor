USING: io sequences stack-checker ;
IN: scratch

: hello ( -- ) { 5 3 5 1 3 } [ ] each infer.

MAIN: hello