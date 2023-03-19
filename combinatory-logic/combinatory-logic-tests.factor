USING: combinatory-logic tools.test kernel ; 

{ "" } [ "" elevate ] unit-test 
{ "ABC(DEF)" } [ "ABC(DEF)" elevate ] unit-test
{ "A(B(C))" } [ "(A(B(C)))" elevate ] unit-test
{ "A(B(C))DEF" } [ "(A(B(C)))DEF" elevate ] unit-test
{ "KxKx" } [ "(Kx)Kx" elevate ] unit-test

! { "" } [ "" compute ] unit-test

{ "Kx(Kx)" } [ "SKK" compute ] unit-test
{ "x" } [ "I" compute ] unit-test
{ "xx" } [ "(Kx)Kx" compute ] unit-test
{ "a" } [ "Kab" compute ] unit-test
{ "x" } [ "Kx" compute ] unit-test
{ "Ia" } [ "IIa" compute ] unit-test

{ "xy((Sx)y)" } [ "Sx(Sx)" compute ] unit-test 

{ "xz(yz)" } [ "S" evaluate ] unit-test
{ "yz((xy)z)" } [ "SS" evaluate ] unit-test
{ "xy((Sx)y)" } [ "SSS" evaluate ] unit-test

{ "(xz)y" } [ "C" compute ] unit-test
{ "xz((((KK)x)y)z)" } [ "(S(S(K(S(KS)K))S)(KK))" evaluate ] unit-test
{ "xzy" } [ "(S(S(K(S(KS)K))S)(KK))" resolve ] unit-test
{ t } [ "J" "((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S(K((S(KS))K)))((S(KS))K))))))))" [ resolve ] bi@ = ] unit-test