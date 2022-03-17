program k;
uses crt;
var i,b,d,l,ll,aa:integer;
    ch:char;
    r,a:longint;
    f:text;
    x:string;
procedure p;
begin
for l:=1 to 3 do
    if keypressed then begin
       b:=b+1;
       ch:=readkey;
       if ch=#27 then halt;
       if ch<>x[b] then
                   b:=0;
       if b=length(x) then begin
       b:=0;
       d:=d-2;
       ll:=1;
       end;
       end;

clrscr;
if ll<>1 then begin
gotoxy(1,i);
for aa:=1 to b do
write(' ');
for aa:=b+1 to length(x) do
write(x[aa]);
end;
if i=25 then begin clrscr; gotoxy(38,13); textbackground(red);
write('KONEC'); textbackground(0); readln; halt; end;
end;

begin
clrscr; b:=0; randomize; d:=175;
assign(f,'list.txt');
repeat
ll:=0;
b:=0;
reset(f);
a:=random(60000)+random(60000)+random(42000);
for r:=1 to a do
readln(f,x);
for i:=1 to 25 do begin
if ll<>1 then begin
if b<>0 then
delay(d);
p;            end;
if ll<>1 then begin
delay(d);
p;            end;
if ll<>1 then begin
delay(d);
p;            end;
if ll<>1 then begin
delay(d);
p;            end;
end;
until ch=#27;
end.