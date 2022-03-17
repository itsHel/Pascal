program kkk;
uses crt;
var p:array [1..10,1..22] of integer;
    o,s,x1,y1,y,x,x2,x3,x4,y2,y3,y4,i,u:integer;
    ch:char;
    k:boolean;
begin                 {219}
 clrscr; randomize;

 repeat
  for i:=1 to 10 do
      p[i,22]:=1;
  x:=4; y:=1; k:=false;
  gotoxy(x,y);
  o:=random(4); s:=1;
  repeat
   gotoxy(x,y);
   case o of
    0:begin
       write('лл');
       gotoxy(x,y+1);
       write('лл');
       x1:=x; y1:=y; x2:=x+1; y2:=y; x3:=x; y3:=y+1; x4:=x+1; y4:=y+1;
      end;
    1:begin
       if s=3 then s:=1;
       if s mod 2<>0 then begin
        write('лллл');
        x1:=x; y1:=y; x2:=x+1; y2:=y; x3:=x+2; y3:=y; x4:=x+3; y4:=y; end
       else begin
        write('л');
        gotoxy(x,y+1); write('л');
        gotoxy(x,y+2); write('л');
        gotoxy(x,y+3); write('л');
        x1:=x; y1:=y; x2:=x; y2:=y+1; x3:=x; y3:=y+2; x4:=1; y4:=y+3;
       end;
      end;
    2:begin
       if s=3 then s:=1;
       if s mod 2=0 then begin
        write('л');
        gotoxy(x,y+1); write('лл');
        gotoxy(x+1,y+2); write('л');
        x1:=x; y1:=y; x2:=x; y2:=y+1; x3:=x+1; y3:=y+1; x4:=x+1; y4:=y+2;
       end
       else begin
        write(' лл');
        gotoxy(x,y+1); write('лл');
        x1:=x+1; y1:=y; x2:=x+2; y2:=y; x3:=x; y3:=y+1; x4:=x+1; y4:=y+1;
       end;
      end;
    3:begin
       if s=5 then s:=1;
       case s of
        1:begin
           write('л');
           gotoxy(x,y+1); write('л');
           gotoxy(x,y+2); write('лл');
           x1:=x; y1:=y; x2:=x; y2:=y+1; x3:=x; y3:=y+2; x4:=x+1; y4:=y+2;
          end;
        2:begin
           write('  л');
           gotoxy(x,y+1); write('ллл');

           x1:=x+2; y1:=y; x2:=x; y2:=y+1; x3:=x+1; y3:=y+1; x4:=x+2; y4:=y+1;
          end;
        3:begin
           write('лл');
           gotoxy(x+1,y+1); write('л');
           gotoxy(x+1,y+2); write('л');
           x1:=x; y1:=y; x2:=x+1; y2:=y; x3:=x+1; y3:=y+1; x4:=x+1; y4:=y+2;
          end;
        4:begin
           write('ллл');
           gotoxy(x,y+1); write('л');
           x1:=x; y1:=y; x2:=x+1; y2:=y; x3:=x+2; y3:=y; x4:=x; y4:=y+1;
          end;
       end;
      end;
   end;
   delay(222);
   if keypressed then
   ch:=readkey;
   case ch of
        #27:begin exit; end;
        'a':begin x:=x-1; end;
        'd':begin x:=x+1; end;
        's':begin y:=y+1; end;
        #32:begin inc(s); end;

   end;
   ch:=#0;





   if (p[x1,y1+1]=1) or (p[x2,y2+1]=1) or  (p[x3,y3+1]=1) or (p[x4,y4+1]=1) then begin
    p[x1,y1]:=1;
    p[x2,y2]:=1;
    p[x3,y3]:=1;
    p[x4,y4]:=1;
    k:=true;
    c:=0;
    for i:=1 to 22 do begin
       for u:=1 to 10 do
           c:=c+p[u,i]
       if c=10 then begin

       end;
       c:=0;
       end;
   end
   else begin
    gotoxy(x1,y1); write(' ');
    gotoxy(x2,y2); write(' ');
    gotoxy(x3,y3); write(' ');
    gotoxy(x4,y4); write(' ');
   end;
    inc(y);
  until k;

 until false;

end.