program k;
uses crt;
var q:longint;

function p(x:real):real;
var z,i,aa,b,c,q,tt:longint;
t,a,l:real;
begin
c:=100000000;
l:=0;
q:=0;
t:=1;
for b:=1 to 9 do begin
a:=x / c;
aa:=trunc(a);
for z:=1 to q do
aa:=aa*10;
l:=l+aa;
c:=c div 10;
t:=exp((9-q-b)*ln(10));
if aa<>0 then q:=q+1;
x:=x-aa*t;
x:=round(x);
t:=1;
end;
p:=l;
end;

begin
clrscr;
write('Zadejte cislo: ');
readln(q);
writeln(p(q):8:0);
readln;
end.