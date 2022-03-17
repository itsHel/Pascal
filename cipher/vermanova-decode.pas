program v;
uses crt;
var f1,f2,f3:text;
    p,o,i:integer;
    ch:char;
    x,k:string;
begin
clrscr; randomize;
write('Zadejte soubor: ');
readln(x);
if x='0' then exit;
assign(f1,x);
write('Zadejte klic: ');
readln(x);
if x='0' then exit;
assign(f2,x); assign(f3,'desifrovano.txt');
reset(f1); reset(f2); rewrite(f3);
repeat
readln(f1,x);
readln(f2,k);
for i:= 1 to length(x) do begin
p:=ord(x[i])-ord(k[i])+97;
if p=96 then p:=32;
if (p<97) and (p<>32) then p:=p+26;
ch:=chr(p);
write(f3,ch);
end;
writeln(f3);
until eof(f1);
close(f1); close(f2); close(f3);
end.