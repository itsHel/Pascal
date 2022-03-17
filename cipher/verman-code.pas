program v;
uses crt;
var f1,f2,f3:text;
    p,o,i:integer;
    ch:char;
    x:string;
begin
clrscr; randomize;
write('Zadejte soubor: ');
readln(x);
if x='0' then exit;
assign(f1,x); assign(f2,'zasifrovano.txt'); assign(f3,'klic.txt');
reset(f1); rewrite(f2); rewrite(f3);
repeat
readln(f1,x);
for i:= 1 to length(x) do begin
o:=random(26);
if x[i]=' ' then begin
x[i]:='`';
repeat
o:=random(26);
until o<>0;
end;
p:=ord(x[i])+o;
if p>122 then p:=p-26;
ch:=chr(p);
write(f2,ch);
write(f3,chr(o+97));
end;
writeln(f2);
writeln(f3);
until eof(f1);
close(f1); close(f2); close(f3);
end.