program prog;
uses crt;
var a:longint;
	b,c:string;
	ch:char;
	k:boolean;
        l:integer;

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
while pos(y,x)<>0 do begin
delete(x,pos(y,x),1);
o:=o+1;
end;
k1:=o;
end;


function k2(x:string):integer;
var o:integer;
begin
o:=1;
while pos(' ',x)<>0 do begin
delete(x,pos(' ',x),1);
o:=o+1;
end;
k2:=o;
end;


function k3(x:string):integer;
var o:integer;
begin
o:=0;
repeat
delete(x,pos('  ',x),1);
until pos('  ',x)=0;
if x[1]=' ' then o:=o-1;
if pos(' .',x)<>0 then o:=o-1;
o:=o+k2(x);
k3:=o;
end;


begin
textcolor(green);
textbackground(0);
repeat
clrscr; a:=1; k:=false;
repeat
     l:=4;
     if k=true then
     ch:=readkey;
     if ch=#80 then a:=a+1 else if ch=#72 then a:=a-1;
     if a=0 then a:=5;
     if a=6 then a:=1;
     if a=1 then textbackground(l);       {nebo pres pole}
     writeln('1. hledani pismen');
     textbackground(0);
     if a=2 then textbackground(l);
     writeln('2. pocet slov');
     textbackground(0);
     if a=3 then textbackground(l);
     writeln('3. pocet slov lepsi');
     textbackground(0);
     if a=4 then textbackground(l);
     writeln('4. ???');
     textbackground(0);
     if a=5 then textbackground(l);
     writeln('5. konec');
     textbackground(0);
     k:=true;
     if ch=#27 then exit;
     gotoxy(1,1);
     until (ch=#13);
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
4: begin end;
end;
if a<>5 then
readln;
k:=false; ch:=#0;
until a=5;
end.