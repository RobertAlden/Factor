USING: combinatory-logic kernel math math.functions sequences
tools.test ;

{ "" } [ "" elevate ] unit-test 
{ "ABC(DEF)" } [ "ABC(DEF)" elevate ] unit-test
{ "A(B(C))" } [ "(A(B(C)))" elevate ] unit-test
{ "A(B(C))DEF" } [ "(A(B(C)))DEF" elevate ] unit-test
{ "KxKx" } [ "(Kx)Kx" elevate ] unit-test

! { "" } [ "" compute ] unit-test

{ "Kz(Kz)" } [ "SKK" compute ] unit-test
{ "z" } [ "I" compute ] unit-test
{ "zz" } [ "(Kz)Kz" compute ] unit-test
{ "a" } [ "Kab" compute ] unit-test
{ "z" } [ "Kz" compute ] unit-test
{ "Ia" } [ "IIa" compute ] unit-test

{ "zy((Sz)y)" } [ "Sz(Sz)" compute ] unit-test 

{ "zx(yx)" } [ "S" evaluate ] unit-test
{ "yx((zy)x)" } [ "SS" evaluate ] unit-test
{ "zy((Sz)y)" } [ "SSS" evaluate ] unit-test

{ "(zx)y" } [ "C" compute ] unit-test
{ "zx((((KK)z)y)x)" } [ "(S(S(K(S(KS)K))S)(KK))" evaluate ] unit-test
{ "zxy" } [ "(S(S(K(S(KS)K))S)(KK))" normalize ] unit-test
{ t } [ "J" "((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S(K((S(KS))K)))((S(KS))K))))))))" [ normalize ] bi@ = ] unit-test

{ 2 } [ { 2 4 4 4 5 5 7 9 } [ '[ _ - sq ] map ] [ [ sum ] [ length ] [ / ] "P" run ] [ sqrt ] "H" run ] unit-test