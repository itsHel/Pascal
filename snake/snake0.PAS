program had;
uses crt;
var a,b,ap,bp,col,u,k:integer;
    ch:char;
    p1:array [1..300] of integer;
    p2:array [1..300] of integer;
begin
repeat
     clrscr;
     col:=1;
     u:=0;
     a:=0;
     b:=13;
     ap:=1;
     bp:=0;
     repeat
	   delay(200);
           if keypressed then ch:=readkey;
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
           u:=u+1;
           for k:=1 to u do
           if (a=p1[k]) and (b=p2[k]) then
           ch:='b';
           p1[u]:=a;
           p2[u]:=b;
           write('*');
           if ch=#27 then ch:='b';
           until ch='b';
           for k:=1 to u do begin
           p1[k]:=0;
           p2[k]:=0;
           end;
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