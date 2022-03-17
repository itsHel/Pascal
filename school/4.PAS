program prog;
uses crt;
var a:longint;
	b,c:string;

function kk(x,y:string):integer;   {prvni reseni}
var o,k:integer;
begin
k:=0;
for o:=1 to length(x) do
	if x[o]=y then k:=k+1;
kk:=k;
end;


function k1(x,y:string):integer;
var o:integer;
begin
o:=0;
repeat
delete(x,pos(y,x),1);
o:=o+1;
until pos(y,x)=0;
k1:=o;
end;


function k2(x:string):integer;
var o:integer;
begin
o:=1;
repeat
delete(x,pos(' ',x),1);
o:=o+1;
until pos(' ',x)=0;
k2:=o;
end;


function k3(x:string):integer;
var o:integer;
begin
o:=1;
repeat
delete(x,pos('  ',x),1);
until pos('  ',x)=0;
if x[1]=' ' then o:=o-1;
if pos(' .',x)<>0 then o:=o-1;
repeat
delete(x,pos(' ',x),1);
o:=o+1;
until pos(' ',x)=0;
k3:=o;
end;

function k4(x:string):integer;
var z,i:integer;
begin
z:=0;
for i:=1 to length(x) do begin
writeln(ord(x[i]));
readln;
if (x[i]>='A') and (x[i]<='Z') then z:=z+1;  end;
k4:=z;
end;

function k5(x:string):integer;
var y:string;
    i:integer;
begin
y:='';
for i:=0 to length(x)-1 do
y:=y+x[length(x);;-i];
k5:=y;
end;

begin
textcolor(green);
repeat
clrscr;
writeln('1. ');
writeln('2. ');
writeln('3. ');
writeln('4. ');
writeln('5. konec');
write('vase volba: ');
readln(a);
clrscr;
case a of
1: begin write('veta: ');         readln(b);
	write('hledany znak: ');  readln(c);
	writeln('ve vete je znak ',k1(b,c),'x');
	 end;
2: begin write('veta: ');         readln(b);
	writeln('ve vete je ',k2(b),' slov');
	 end;
3: begin write('veta: ');         readln(b);
	writeln('ve vete je ',k3(b),' slov');
	end;
4: begin
        write('veta: ');        readln(b);
        writeln(k4(b));end;
end;
readln;
clrscr;
until a=5;
end.