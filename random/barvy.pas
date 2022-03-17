program q;
uses crt;
var a,b,c,d,n,m:integer;
    ch:char;
begin
textcolor(1);
clrscr;
m:=2;
repeat
c:=9;
n:=2;
for a:= 1 to 20 do begin
if keypressed then ch:=readkey;
if ch=#27 then exit;
delay(80);
for b:= 1 to c do
write(' ');
if a<10 then
c:=c-1
else if a<11 then
c:=0
else
c:=c+1;
for d:= 1 to n do
write('*');
if a<10 then
n:=n+2
else if a<11 then
n:=20
else
n:=n-2;
if a<21 then
writeln;
end;
textcolor(m);
m:=m+1;
until 1=0;
readln;
end.