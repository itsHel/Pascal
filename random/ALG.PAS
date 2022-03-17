program alg;
uses crt;
var d,x,k:integer;
    m:real;
    c,a,b:longint;
    ch:char;
            procedure p(z:string);
            begin
            for x:=1 to length(z) do begin
            if keypressed then begin
            ch:=readkey;
            d:=0;
            end;
            write(z[x]);
            delay(d);
            end;
            if z[1]<>'V' then
            writeln;
            end;
begin
d:=180;
repeat
clrscr;
textcolor(green);
p('0 - konec');
p('1 - zamena');
p('2 - cyklicka zamena');
p('3 - MAX a,b');
p('4 - MAX a,b,c');
p('5 - usporadani');
p('6 - nasobeni');
p('7 - posloupnost');
p('8 - faktorial');
p('9 - prevod casu');
p('10 - suda posloupnost');
p('11 - prumer');
p('12 - prumer kladnych, zapornych a pocet nul');
p('13 - MAX');
p('14 - 2nd MAX');
p('15 - kvadraticka rovnice');
p('16 - hadani cisla');
p('17 - hadani cisla - PC min');
writeln('컴컴컴컴컴컴컴컴컴컴컴컴컴컴�');
p('Vase volba: ');
read(k);
clrscr;
x:=0;
b:=0;
c:=0;
a:=0;
d:=0;
if (k>0) and (k<12) then begin
textbackground(red);
end;
d:=190;
case k of
0:   exit;
1:   begin
       p('zamena');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b: ');
       readln(a,b);
       x:=a;
       a:=b;
       b:=x;
       writeln('a=',a);
       write('b=',b)
     end;
2:   begin
       p('cyklicka zamena');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b,c,d: ');
       readln(a,b,c,d);
       x:=d;
       d:=c;
       c:=b;
       B:=a;
       a:=x;
       writeln('a b c d');
       write(a,' ',b,' ',c,' ',d);
     end;
3:   begin
       p('MAX a,b');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b: ');
       readln(a,b);
       if a>b then
       writeln('a(',a,') je vetsi')
       else
       writeln('b(',b,') je vetsi');
     end;
4:   begin
       p('MAX a,b,c');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b,c');
       readln(a,b,c);
       if (c>b) and (c>a) then
       write('c(',c,') je max')
       else if b>a then
       write('b(',b,') je max')
       else
       write('a(',a,') je max');
     end;
5:   begin
       p('usporadani');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b,c: ');
       readln(a,b,c);
       if (c<b) and (c<a) then begin
       write(c);
       if b<a then
       write(' ',b,' ',a)
       else write(' ',a,' ',b);
       end
       else if (b<c) and (b<a) then begin
       write(b,' ');
       if c<a then
       write (c,' ',a)
       else
       write(a,' ',c)
       end
       else begin
       write(a,' ');
       if b<c then
       write(b,' ',c)
       else
       write(c,' ',b)
       end
     end;
6:   begin
       p('nasobeni');
       writeln;
       textbackground(0);
       writeln('Zadejte a,b: ');
       readln(a,b);
       if a>b then
       for c:=1 to b do
       x:=x+a
       else
       for c:=1 to a do
       x:=x+b;
       write('vysledek: ',x);
     end;
7:   begin
       p('soucet vsech cisel posloupnosti');
       writeln;
       textbackground(0);
       writeln('Zadejte cislo: ');
       readln(c);
       if c<1 then exit;
       for d:=1 to c do
       x:=x+d;
       write('vysledek: ',x);
     end;
8:   begin
       p('faktorial');
       writeln;
       textbackground(0);
       writeln('Zadejte cislo: ');
       a:=1;
       readln(c);
       for b:= 1 to c do
       a:=a*b;
       write('vysledek: ',a);
     end;
9:   begin
       p('prevod casu');
       writeln;
       textbackground(0);
       writeln('Zadejte cas(s)');
       readln(c);
       d:=c div 3600;
       write(d,' : ');
       x:= c mod 3600;
       b:=x div 60;
       write (b,' : ');
       x:=x mod 60;
       write(x);
     end;
10:  begin
       p('soucet sudych cisel posloupnosti');
       writeln;
       x:=2;
       textbackground(0);
       writeln('Zadejte cislo: ');
       readln(c);
       while x<=c do begin
       a:=x+a;
       x:=x+2;
       end;
       write ('vysledek: ',a);
     end;
11:  begin
       p('prumer');
       writeln;
       m:=0;
       textbackground(0);
       write('Zadejte pocet cisel: ');
       readln(x);
       for b:= 1 to x do begin
       write('Zadejte ',b,' cislo: ');
       readln(a);
       m:=m+a;
       end;
       m:=m/x;
       write('prumer: ',m);
     end;
12:  begin
       p('coming soon...');
       readln;
     end;
13:  begin
       p('MAX') ;
       writeln;
       textbackground(0);
       write('Zadejte pocet cisel: ');
       readln(x);
       for d:=1 to x do begin
       write('Zadejte ',d,'. cislo: ');
       readln(a);
       if d=1 then b:=a;
       if b<a then b:=a;
       end;
       write('MAX: ',b);
     end;
14:  begin
       p('2nd MAX');
       writeln;
       textbackground(0);
       write('Zadejte po웕t 윞sel: ');
       readln(x);
       write('Zadejte 1. 윞slo: ');
       readln(b);
       write('Zadejte 2. 윞slo: ');
       readln(c);
       if b<c then begin
       a:=b;
       b:=c;
       c:=a;
       end;
       for d:=1 to x-2 do begin
       write('Zadejte ',d+2,'. 윞slo: ');
       readln(a);
       if b<a then begin
       c:=b;
       b:=a;
       end
       else
       if a>c then c:=a;
       end;
       write('2. MAX: ',c);
     end;
15:  begin
     p('coming soon...');
     readln;
     end;
16:  begin
     p('hadani cisla');
     randomize;
     d:=random(100)+1;
     repeat
     write('Hadej: ');
     readln(k);
     x:=x+1;
     if k<d then write('malo') else if k<>d then write('moc');
     readln;
     if k<>d then clrscr;
     until k=d;
     writeln('dobre');
     writeln(x,' pokusu');
     if x<5 then write('gj!');
     readln;
     end;
17:  begin
     clrscr;  randomize;
     p('hadani cisla');
     randomize;
     d:=random(10000)+1;
     k:=5000;
     x:=k;
     repeat
     if k<>1 then
     k:=k div 2;
     if x<d then begin  x:=x+k; writeln(' malo ') end;
     if x>d then begin  x:=x-k; writeln(' moc '); end;
     delay(300);
     until x=d;
     write('dobre ',d);
     readln;
     end;

end;
readln;
d:=180;
until false;
end.