grep '[xX][0-9]\{4\}$' grepdata.txt
echo ----------------------------------------
grep '^[0-9]\{3\}' grepdata.txt
echo ----------------------------------------
grep '[A-Z][a-z]\{2\}[.\][ ][0-9]\{1,2\}[\,][ ][2][0-9]\{3\}' grepdata.txt
echo ----------------------------------------
grep '\([aeiouAEIOU]\)[0-z]\1' grepdata.txt
echo ----------------------------------------
grep -v '^[S]' grepdata.txt
echo ----------------------------------------
egrep -i 'ca' grepdata.txt
echo ----------------------------------------
grep -n '@' grepdata.txt
echo ----------------------------------------
grep '\<Sep\>.' grepdata.txt
echo ----------------------------------------
grep '\<de\>' grepdata.txt
