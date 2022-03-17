program	q;
uses crt;
var
	f1,c:text;
	x,y:string;
	a,b,i,h,z,bo,m,l:integer;
	n:array [1..2000] of integer;



begin
clrscr; randomize;
write('Zadejte soubor: ');
readln(x);
assign(f1,x);
assign(c,'c');
reset(f1);
rewrite(c);
repeat
readln(f1,x);
h:=length(x) div 2;
for a:=1 to h do begin
if pos(' ',x)=0 then begin m:=1;
y:=x end else begin m:=0;
y:=copy(x,1,pos(' ',x)); end;
writeln(c,y);
delete(x,1,pos(' ',x));
if m=1 then break;
end;
until eof(f1);
close(f1);
close(c);



assign(f1,'prehoz.txt');
assign(c,'c');
rewrite(f1);
reset(c);

a:=0;				{pocet radku}
repeat
a:=a+1;
readln(c,x)
until eof(c);


z:=0;
bo:=0;
l:=0;
repeat				{hlavni}
reset(c);
z:=z+1;
repeat				{overeni randomu}
i:=random(a)+1;
for b:=1 to z do
if n[b]=i then begin bo:=1; break; end else bo:=0;
until bo=0;
n[z]:=i;
for b:=1 to i do
readln(c,x);
if pos(' ',x)=0 then x:=x+' ';
l:=l+length(x);
if l>80 then begin writeln(f1); l:=0; end;
write(f1,x);
until z=a;
erase(c);
close(f1);
close(c);

end.