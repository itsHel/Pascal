program v;
uses crt;
var f1,f2:text;
    x,y:string;
    i,o,k,l:integer;

begin
clrscr;
assign(f1,'list.txt');
assign(f2,'slova.txt');
reset(f1);
rewrite(f2);
write('Zadejte pismena: ');
readln(x);
o:=0;    k:=0;
for i:=1 to length(x) do
if x[i]<>' ' then o:=o+1;
write('Vypsat na obrazovku nebo do souboru? (1/2)');
repeat
readln(l);
until (l=1) or (l=2);
repeat
    readln(f1,y);
    if length(y)<>length(x) then continue;
    for i:=1 to length(x) do
    if x[i]<>' ' then
    if x[i]=y[i] then k:=k+1;
    if o=k then if l=2 then writeln(f2,y)
    else writeln(y);
    k:=0;
until eof(f1);
close(f1);
close(f2);
if l=1 then readkey;
end.