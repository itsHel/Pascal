program k;
uses crt;
var f1,f2:text;
    x,y,q:string;
    chyba,h,m,z,u,s1,s2:integer;
    s,v,l,i:longint;
    r:real;
begin
clrscr;
write('Zadejte soubor: ');
readln(q);
assign(f1,q);
assign(f2,'titulky2.srt');
reset(f1);
rewrite(f2);
write('O kolik chcete posunout [ms]?: ');
readln(i);
z:=i div 60000;
l:=i mod 60000;
repeat
readln(f1,x);
if pos('-->',x)=0 then writeln(f2,x)
else begin
for u:=1 to 2 do begin
y:=copy(x,pos(',',x)-2,2);
insert(copy(x,pos(',',x)+1,3),y,3);
val(y,s,chyba);
y:=copy(x,1,2);
val(y,h,chyba);
y:=copy(x,4,2);
val(y,m,chyba);
s:=s+l;
if s>59999 then begin
s:=s-60000;
m:=m+1;
end;
m:=m+z;
if m>59 then begin
h:=h+1;
m:=m-60;
end;
r:=s/1000;
s1:=trunc(r);
r:=(r-s1)*1000;
s2:=trunc(r);
if s2 mod 2<>0 then s2:=s2+1;
if m<10 then
write(f2,'0',h,':0',m,':')
else
write(f2,'0',h,':',m,':');
if s<1000 then write(f2,'00',s1,',')
else if s<10000 then write(f2,'0',s1,',')
else write(f2,s1,',');
if s2<100 then write(f2,'0',s2)
else write(f2,s2);
if u=1 then begin
write(f2,' --> ');
x:=copy(x,18,12);
end;
if u=2 then writeln(f2);
end;
end;
until eof(f1);
erase(f1);
close(f1);
rename(f2,q);
close(f2);
if chyba=0 then write('OK') else
write ('chyba');
readln;
end.