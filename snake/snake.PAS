program had;
uses crt;
var a,b,ap,bp,col,u,k,t,j,oo,j1,j2:integer;
    ch:char;
    p1,p2:array[1..3000] of integer;
begin
randomize;
asm
   mov  ax,4f04h
   int  10h
end;
repeat
     clrscr;
     col:=1;
     t:=6;
     u:=0;
     oo:=0;
     a:=0;
     j:=1;
     b:=13;
     ap:=1;
     bp:=0;
     gotoxy(random(40),random(26));
     j1:=wherex;
     j2:=wherey;
     write('*');
     repeat
	   delay(150);
           if keypressed then ch:=readkey;
           if ch=#0 then ch:=readkey;
           if ch=#72 then begin
           if bp<>1 then begin
           ap:=0;
           bp:=-1;
           end
           end
           else if ch=#75 then begin
           if ap<>1 then begin
           ap:=-1;
           bp:=0;
           end
           end
           else if ch=#80 then begin
           if bp<>-1 then begin
           ap:=0;
           bp:=1;
           end
           end
           else if ch=#77 then begin
           if ap<>-1 then begin
           ap:=1;
           bp:=0;
           end
           end
           else if ch=#32 then begin
           ch:=#0;
           repeat
           ch:=readkey;
           until ch=#32;
           ch:=#0;
           end
           else if ch=#9 then begin
           textcolor(col);
           col:=col+1;
           if col=16 then col:=1;
           ch:=#0;
           end;
           a:=a+ap;
           b:=b+bp;
           if (a=80) or (b=0) or (a=0) or (b=26) then ch:='b';
           gotoxy(a,b);
           if (a=j1) and (b=j2) then begin
           t:=t+1;
           repeat
           gotoxy(random(40),random(26));
	   for k:=1 to u  do
           if ((wherex=p1[k]) and (wherey=p2[k])) or ((wherex=a) and (wherey=b))
            or ((wherex=a+ap) and (wherey=b+bp)) then oo:=1
           else oo:=0;
	   until oo<>1;
	   oo:=0;
           j1:=wherex;
           j2:=wherey;
	   write('*');                  {jidlo}
           gotoxy(a,b);
           end;
	   for k:=1 to u do
           if (a=p1[k]) and (b=p2[k]) then
           ch:='b';
           u:=u+1;
           write('*');                  {had}
           if ch=#27 then ch:='b';
           p1[u]:=a;
           p2[u]:=b;
           if u>6 then begin
           gotoxy(p1[u-t],p2[u-t]);
	   if p1[u-t]<>0 then
           write(' ');                  {mezera}
           p1[u-t]:=0;
           p2[u-t]:=0;
           gotoxy(p1[u],p2[u]);
           end;
           until ch='b';
           gotoxy(2,2);
           textcolor(white);
           textbackground(red);
           writeln('KONEC');
           textbackground(black);
           write(' opakovat? (A/N)');
           readln(ch);
           if ch<>'a' then exit;
           until false;
end.