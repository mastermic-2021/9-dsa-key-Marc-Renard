dsa_pub = [Mod(16, 2359457956956300567038105751718832373634513504534942514002305419604815592073181005834416173), 589864489239075141759526437929708093408628376133735628500576354901203898018295251458604043, 2028727269671031475103905404250865899391487240939480351378663127451217489613162734122924934];
check(s,dsa_pub) = {
  my(h,r,g,q,X);
  [h,r,s] = s;
  [g,q,X] = dsa_pub;
  lift( (g^h*X^r)^(1/s % q) ) % q == r;
}

signatures=readvec("input.txt");
[g,q,X]=dsa_pub;
\\On va chercher deux signatures qui ont le même r, et donc le même k
tmp1=0;
tmp2=0;
\\print(signatures);
\\print(signatures[1][1]);

\\Table des valeurs de r dans les signatures
rTable=Vec(0,#signatures);
for(i=1,#signatures,rTable[i]=signatures[i][2]);

\\Recherche de r identiques
find=0;
for(i=1,#signatures-1,if(find==1,break);r1=rTable[i];for(j=i+1,#signature,r2=rTable[j];if(r1==r2,print(r1,"\n",r2);break)));

