program alg;
uses crt;
var x,k{,z}:integer;
    {m,m2,m3:real; }
    d,c,a,b:longint;
            procedure p(z:string);
            begin
            for x:=1 to length(z) do begin
            if keypressed then begin
            readkey;
            d:=0;
            end;
            write(z[x]);
            delay(d);
            end;
            if z[1]<>'V' then
            writeln;
            end;

            procedure zamena(var z,y:longint);
            var x:integer;
            begin
		x:=z;
        	z:=y;
        	y:=x;
            end;

            function k3(x,y:longint):longint;
            begin
		if x>y then
        	k3:=x
        	else k3:=y;

            end;

            procedure k4(x,y,z:longint);
            begin
               if (z>y) and (z>x) then
                write('c(',z,') je max')
                 else if y>x then
                 write('b(',y,') je max')
                 else
                 write('a(',x,') je max');
            end;

            procedure k5(x,y,z:longint);
            begin
             if (z<y) and (z<x) then begin
       write(z);
       if y<x then
       write(' ',y,' ',x)
       else write(' ',x,' ',y);
       end
       else if (y<z) and (y<x) then begin
       write(y,' ');
       if z<x then
       write (z,' ',x)
       else
       write(x,' ',z)
       end
       else begin
       write(x,' ');
       if y<c then
       write(y,' ',z)
       else
       write(z,' ',y)
       end
             end;

	function k6(x,y:integer):integer;
	var c,a:integer;
	begin
	a:=0;
       for c:=1 to x do
       a:=a+y;
	k6:=a;
	end;

       function k7(c:integer):integer;
       var a,b:integer;
       begin
       b:=0;
       for a:=1 to c do
       b:=b+a;
       k7:=b;
       end;

       function k8(x:longint):longint;
       var b,a:longint;
       begin
       a:=1;
       for b:= 1 to x do
       a:=a*b;
       k8:=a;
       end;

       function k9(c:integer):string;
       var h,m,s:integer;
           l,k:string;
       begin
       h:=c div 3600;
       c:=c mod 3600;
       m:=c div 60;
       s:=c mod 60;
       str(h,l);
       str(m,k);
       l:=l+':'+k;
       str(s,k);
       k9:=l+':'+k;
       end;

       function k10(c:integer):integer;
       var a,b:integer;
       begin
       a:=0;
       b:=0;
       while a<=c do begin
       b:=a+b;
       a:=a+2;
       end;
       k10:=b;
       end;

       function k11(c:integer):real;
       var a,m:integer;
       begin
       m:=0;
       for b:= 1 to c do begin
       write('Zadejte ',b,' cislo: ');
       readln(a);
       m:=m+a;
       end;
       k11:=m/x;
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
p('17 - hadani cisla - min pokusu');
writeln('컴컴컴컴컴컴컴컴컴컴컴컴컴컴�');
p('Vase volba: ');
read(k);
clrscr; {
x:=0;
b:=0;
c:=0;
a:=0;
d:=0;  }
if (k>0) and (k<12) then begin
end;
d:=190;
case k of
0:   exit;
1:   begin
       p('zamena');
       writeln;
       writeln('Zadejte a,b: ');
       readln(a,b);
	zamena(a,b);
       writeln('a=',a);
       write('b=',b)
     end;
2:   begin
       p('cyklicka zamena');
       writeln;
       writeln('Zadejte a,b,c,d: ');
       readln(a,b,c,d);
       zamena(a,b);
       zamena(a,d);
       zamena(c,d);
       writeln('a b c d');
       write(a,' ',b,' ',c,' ',d);
     end;
3:   begin
       p('MAX a,b');
       writeln;
       writeln('Zadejte a,b: ');
       readln(a,b);
       writeln(k3(a,b),' je vetsi');
     end;
4:   begin
       p('MAX a,b,c');
       writeln;
       writeln('Zadejte a,b,c');
       readln(a,b,c);
       k4(a,b,c);
     end;
5:   begin
       p('usporadani');
       writeln;
       writeln('Zadejte a,b,c: ');
       readln(a,b,c);
       k5(a,b,c);
     end;
6:   begin
       p('nasobeni');
       writeln;
       writeln('Zadejte a,b: ');
       readln(a,b);
	writeln(k6(a,b));
     end;
7:   begin
       p('soucet vsech cisel posloupnosti');
       writeln;
       writeln('Zadejte cislo: ');
       readln(x);
       write('vysledek: ',k7(x));
     end;
8:   begin
       p('faktorial');
       writeln;
       writeln('Zadejte cislo: ');
       a:=1;
       readln(c);
       write('vysledek: ',k8(c));
     end;
9:   begin
       p('prevod casu');
       writeln;
       writeln('Zadejte cas [s]');
       readln(x);
       write(k9(x));
     end;
10:  begin
       p('soucet sudych cisel posloupnosti');
       writeln;
       writeln('Zadejte cislo: ');
       readln(x);
       write ('vysledek: ',k10(x));
     end;
11:  begin
       p('prumer');
       writeln;
       write('Zadejte pocet cisel: ');
       readln(x);
       write(k11(x):8:2);
     end;                       {
12:  begin
       p('Prumer kladnych,zapornych a pocet nul');
       writeln;
       write('Zadejte pocet cisel: ');
       readln(x);
       for d:=1 to x do begin
       write('Zadejte ',d,'. cislo: ');
       readln(k);
       if k=0 then c:=c+1;
       if k<0 then begin b:=b+k; z:=z+1 end else a:=a+k;
       end;
       writeln('Pocet nul: ',c);
       if z<>0 then begin
       m:=b/z;
       writeln('Prumer zapornych: ',m:8:2); end;
       m:=a/(x-z-c);
       writeln('Prumer kladnych: ',m:8:2);
     end;
13:  begin
       p('MAX') ;
       writeln;
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
     p('kvadraticka rovnice');
     write('Zadejte a: ');
     readln(a);
     write('Zadejte b: ');
     readln(b);
     write('Zadejte c: ');
     readln(c);
if (b*b-4*a*c)>=0 then begin
m:=(-b+sqrt(b*b-4*a*c))/2*a;
m2:=(-b-sqrt(b*b-4*a*c))/2*a;
write('x1 = ',m:8:2,'     x2 = ',m2:8:2);
end else begin m:=-b/2*a; m2:=sqrt(-1*(b*b-4*a*c))/2*a;
writeln('x1 = ',m:8:2,' +',m2:8:2,'i');
m:=-b/2*a; m2:=-sqrt(-1*(b*b-4*a*c))/2*a;
write('x2 = ',m:8:2,' ',m2:8:2,'i');end
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
     end;}

end;
readln;
d:=180;
until false;
end.