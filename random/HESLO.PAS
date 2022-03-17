program q;
uses crt;
var a:integer;
    x:string;
    ch:char;

begin
clrscr;      a:=0;
write('Heslo: ');
repeat
x:='';
gotoxy(40,1);
if a<>0 then
write('zbyva ',3-a,' pokusu');
gotoxy(8,1);
a:=a+1;
if a=4 then halt;
repeat
ch:=readkey;
if ch=#8 then begin delete(x,length(x),1); gotoxy(length(x)+8,1); write(' '); gotoxy(length(x)+8,1); end
else
if ch<>#13 then
write('*') else break;

if ch<>#8 then
x:=x+ch;
until false;
gotoxy(8,1);
write('                                ');
until x='ahoj';
writeln;
writeln('OK');
readln;
end.