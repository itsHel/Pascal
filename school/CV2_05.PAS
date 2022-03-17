program kk;
uses crt;

var pp:array [1..100] of integer;
    w,x:integer;

procedure p1(n:integer; var p:array of integer);          {zadavani}
var i:integer;
begin
for i:=1 to n do begin
write(i,': ');
readln(p[i]);
end;
end;


procedure p2(u:integer; var p:array of integer);          {nahodne}
var i:integer;
begin
randomize;
for i:=1 to u do
p[i]:=random(32768);
end;

procedure p3(u:integer; p:array of integer);              {zobrazeni}
var a,b,i,x,o,y,l:integer;
begin
a:=1;  b:=10; l:=0;
repeat
x:=1; y:=1;
clrscr;
for o:=1 to 2 do begin
gotoxy(x,1);
writeln('index     prvek');
gotoxy(x,2);
writeln('---------------');
y:=2;
for i:=a to b do begin
y:=y+1;
gotoxy(x,y);
writeln(i:3,p[i]:11);
l:=l+1;
if u=l then begin gotoxy(1,13); writeln('---------------------------------'); readln; exit; end;
end;
x:=20; a:=a+10; b:=b+10;
end;
writeln('---------------------------------');
readln;
until l=u;
end;

function p4(n:integer; p:array of integer):integer;       {max}
var i,m:integer;
begin
     m:=p[1];
     for i:=2 to n do
         if p[i]>m then m:=p[i];
     p4:=m;
end;

function p5(n:integer; p:array of integer):integer;       {max index}
var i,m,m2:integer;
begin
     m2:=1;
     m:=p[1];
     for i:=2 to n do
         if p[i]>m then begin m:=p[i]; m2:=i; end;
     p5:=m2;
end;

function p7(n:integer; p:array of integer):integer;       {2nd min}
var  i,m,m2,mm,mm2:integer;
begin
     if p[1]>p[2] then begin
     m:=p[2]; m2:=p[1];  mm:=2; mm2:=1;
     end
     else begin
     m:=p[1]; m2:=p[2];  mm:=1; mm2:=2;
     end;
     for i:=3 to n do
         if p[i]<m2 then if p[i]<m then begin mm2:=mm; mm:=i; m2:=m; m:=p[i]; end else begin m2:=p[i]; mm2:=i; end;
     p7:=mm2;
end;

function p6(n:integer; p:array of integer):integer;       {2nd min index}
var  i,m,m2:integer;
begin
     if p[1]>p[2] then begin
     m:=p[2]; m2:=p[1];
     end
     else begin
     m:=p[1]; m2:=p[2];
     end;
     for i:=3 to n do
         if p[i]<m2 then if p[i]<m then begin m2:=m; m:=p[i]; end else m2:=p[i];
     p6:=m2;
end;

procedure bubble(n:integer; var p:array of integer);
var i,o,k:integer;
begin
     for i:=1 to n-1 do
         for o:=1 to n-i do
             if p[0]>p[o+1] then begin
                  k:=p[o];
                  p[o]:=p[o+1];
                  p[o+1]:=k;
                  end;
end;

procedure select(n:integer; var p:array of integer);
var i,o,k:integer;
begin
     for i:=1 to n-1 do
         for o:=1 to n-i do
             if p[i]>p[o] then begin
                  k:=p[o];
                  p[o]:=p[o+1];
                  p[o+1]:=k;
                  end;
end;

procedure insert(n:integer; var p:array of integer);
var i,o,k:integer;
begin
        for i:=2 to n do begin
            k:=p[i];
            o:=i-1;
            while (k<p[o]) and (o>0) do begin
                  p[o+1]:=p[o];
                  dec(o);
                  end;
            p[o+1]:=k;
            end;
end;

function h(n,k:integer; p:array of integer):integer;        {hledani}
var i:integer;
begin
     for i:=1 to n do
         if k=p[i] then begin h:=i; exit; end;
end;

begin
repeat
clrscr;
writeln('0 - Exit');
writeln('1 - Vlo§it hodnoty z kl vesnice');
writeln('2 - Vygenerovat hodnoty');
writeln('3 - Zobrazit pole');
writeln('4 - Maxim ln¡ prvek pole');
writeln('5 - Index maxim ln¡ho prvku pole');
writeln('6 - Druhì minim ln¡ prvek pole ');
writeln('7 - Index druh‚ho minim ln¡ho prvku pole');
writeln('8 - üazen¡ metodou BubbleSort');
writeln('9 - üazen¡ metodou SelectSort');
writeln('10- üazen¡ metodou InsertSort');
writeln('11- Hled n¡');
readln(x);
clrscr;
case x of
     0:begin exit; end;
     1:begin readln(w); p1(w,pp); end;
     2:begin readln(w); p2(w,pp); end;
     3:begin p3(w,pp); end;
     4:begin writeln('nejvetsi prvek je ',p4(w,pp)); readln; end;
     5:begin writeln('nejvetsi prvek je na ',p5(w,pp),' miste'); readln; end;
     6:begin writeln('druhy nejmensi prvek je ',p6(w,pp)); readln; end;
     7:begin writeln('index druheho nejmensiho prvku pole je ',p7(w,pp)); readln; end;
     8:begin bubble(w,pp); end;
     9:begin select(w,pp); end;
    10:begin insert(w,pp); end;
    11:begin write('Hledane cislo: '); readln(x); writeln(h(w,x,pp)); readln; end;
end;
until false;
end.