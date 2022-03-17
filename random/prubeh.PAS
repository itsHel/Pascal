program p;
uses crt;
var i,a,b,n,m,l,o:integer;
    h:char;

begin
n:=0;
b:=13;
o:=4;
repeat
m:=1;
clrscr;
textcolor(white);
gotoxy(1,13);
for l:= 1 to 80 do
write('Ä');
a:=1;
textcolor(red);
n:=6;
n:=o+2;
repeat
      for i:= n to 25 do begin
          gotoxy(a,b);
          write('*');
          if keypressed then h:=readkey;
          if h=#27 then exit;
          m:=m+1;
          if (i=12)or(i=25) then
             a:=a
             else if i<12 then
                  b:=b-1
                  else
                  b:=b+1;
          a:=a+1;
          delay(200);
          if m>79 then
             break;
          o:=i;
      end;
n:=0;
if m>79 then
   break;
o:=i;
until false;
until false;
end.