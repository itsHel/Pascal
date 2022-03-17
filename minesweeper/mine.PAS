program miny;
uses crt,dos;
var x,y,i,m,x1,x2,y1,y2,m1,w:integer;
    p:array [1..56,1..25] of integer;
    c1,c2:array [1..100] of integer;
    ch:char;
    k:boolean;
    s:array [1..4] of string[15];
    h,min1,min2,sec1,sec2:word;

procedure barva(a:integer);
begin
               case a of
                    0:begin textcolor(white); end;
                    1:begin textcolor(9); end;
                    2:begin textcolor(10); end;
                    3:begin textcolor(12); end;
                    4:begin textcolor(1); end;
                    5:begin textcolor(4); end;
                    6:begin textcolor(3); end;
                    7:begin textcolor(5); end;
                    8:begin textcolor(8); end;
                    100:begin k:=true; end;
               end;
end;

procedure tabulka;
var xt,yt:integer;
begin
textcolor(white);
gotoxy(x1-1,y1-1);
write('Ú');
for xt:=1 to x2-x1+1 do
    write('Ä');
write('¿');
for yt:=1 to y2-y1+2 do begin
    gotoxy(x1-1,y1-1+yt);
    write('³');
    gotoxy(x2+1,y1+yt-1);
    write('³');
    end;
gotoxy(x1-1,y2+1);
write('À');
for xt:=1 to x2-x1+1 do
    write('Ä');
write('Ù');
end;

procedure nula(xx,yy:integer);
begin
if p[xx,yy]<>0 then exit;
for i:=1 to w do
if (xx=c1[i]) and (yy=c2[i]) then exit;
w:=w+1;
c1[w]:=xx; c2[w]:=yy;
   gotoxy(xx-1,yy-1); barva(p[xx-1,yy-1]); write(p[xx-1,yy-1]);
   gotoxy(xx,yy-1);   barva(p[xx,yy-1]); write(p[xx,yy-1]);
   gotoxy(xx+1,yy-1); barva(p[xx+1,yy-1]); write(p[xx+1,yy-1]);
   gotoxy(xx-1,yy);   barva(p[xx-1,yy]); write(p[xx-1,yy]);
   gotoxy(xx+1,yy);   barva(p[xx+1,yy]); write(p[xx+1,yy]);
   gotoxy(xx-1,yy+1); barva(p[xx-1,yy+1]); write(p[xx-1,yy+1]);
   gotoxy(xx,yy+1);   barva(p[xx,yy+1]); write(p[xx,yy+1]);
   gotoxy(xx+1,yy+1); barva(p[xx+1,yy+1]); write(p[xx+1,yy+1]);

nula(xx-1,yy-1);
nula(xx,yy-1);
nula(xx+1,yy-1);
nula(xx-1,yy);
nula(xx+1,yy);
nula(xx-1,yy+1);
nula(xx,yy+1);
nula(xx+1,yy+1);
end;

begin
{asm
   mov  ax,4f04h
   int  10h
end; }
repeat
textcolor(white);                              		{start menu}
textbackground(0);
s[1]:='male pole';
s[2]:='stredni pole';
s[3]:='velke pole';
s[4]:='konec';
randomize;  clrscr; i:=1;
writeln('                    (10x10/10)');
writeln('                    (16x16/40)');
writeln('                    (30x16/100)');
repeat
gotoxy(1,1);
for m:=1 to 4 do begin
    if m=i then textbackground(red) else textbackground(0);
    writeln(s[m]);
    end;
    ch:=readkey;
    if ch=#27 then halt;
    if ch=#72 then i:=i-1 else if ch=#80 then i:=i+1;
    if i=5 then i:=1;
    if i=0 then i:=4;
until (ch=#13) or (ch='n');
case i of
     4:begin halt; end;
     1:begin m1:=10; x1:=36; x2:=45; y1:=8; y2:=17; end;
     2:begin m1:=40; x1:=33; x2:=48; y1:=5; y2:=20; end;
     3:begin m1:=100;x1:=26; x2:=55; y1:=5; y2:=20; end;
     end;

repeat
for x:=25 to 56 do                         		{nulovani}
	for y:=4 to 21 do
		if (x=x1-1) or (x=x2+1) or (y=y1-1) or (y=y2+1) then p[x,y]:=1
                   else p[x,y]:=0;


for i:=1 to m1 do begin                        		{tvoreni min}
	repeat
		c1[i]:=random(x2-x1)+x1;
		c2[i]:=random(y2-y1)+y1;
                k:=true;
		for y:=1 to i-1 do
			if (c1[y]=c1[i]) and (c2[y]=c2[i]) then begin k:=false; continue; end;
	until k;
        p[c1[i],c2[i]]:=100;
end;

clrscr;

for x:=x1 to x2 do                             		{tvoreni cisel}
	for y:=y1 to y2 do
		if p[x,y]<>100 then
			p[x,y]:=(p[x-1,y-1]+p[x,y-1]+p[x+1,y-1]+p[x-1,y]+p[x+1,y]+p[x-1,y+1]+p[x,y+1]+p[x+1,y+1]) div 100;

tabulka;
y:=13; x:=40; k:=false; m:=0;

repeat
      gettime(h,min1,sec1,h);                           {hrani}
      repeat
            gettime(h,min2,sec2,h);
            gotoxy(60,5);
            textcolor(12);
            write(sec2-sec1+60*(min2-min1));
            gotoxy(x,y);
            delay(20);
            if keypressed then begin
            w:=0;
            ch:=readkey;
	    if ch=#0 then  begin ch:=readkey;
            case ch of
                 #72:begin y:=y-1; end;
                 #80:begin y:=y+1; end;
                 #75:begin x:=x-1; end;
                 #77:begin x:=x+1; end;
	    end;
            if x<x1 then x:=x+1;
            if x>x2 then x:=x-1;
            if y<y1 then y:=y+1;
            if y>y2 then y:=y-1;
            end
            else
	    case ch of
	         #27:begin k:=true;end;
                 'm':begin i:=1; end;
	         'n',#13:begin i:=2; end;
	    end;
            if i=2 then begin
		barva(p[x,y]);
                if p[x,y]=100 then break;
               write(p[x,y]);
               if p[x,y]=0 then begin nula(x,y); tabulka; end;
               end
               else if i=1 then begin textcolor(red);
                    write('*');
                    if p[x,y]=100 then m:=m+1;
                    end;
               gotoxy(x,y); i:=0;
               if m=m1 then begin gotoxy(8,13); k:=true; textcolor(white); textbackground(red);
               write('VYHRA'); textbackground(0); end;
               end;
      until k;

until k;
textcolor(red);                                		{vypsani min}
for x:=1 to 80 do
    for y:=1 to 25 do
        if p[x,y]=100 then begin gotoxy(x,y); write('*'); end;

gotoxy(1,1);                                   		{konec menu}
s[1]:='ANO';
s[2]:='NE';
s[3]:='vyber pole';
i:=1;
textcolor(white);
textbackground(red);
writeln('KONEC');
textbackground(0);
write('opakovat?');
repeat
      for m:=1 to 3 do begin
      if m=i then textbackground(red) else textbackground(0);
      gotoxy(12+m*5,2);
      write(s[m]);  end;
      ch:=readkey;
      if ch=#27 then halt;
      if ch=#75 then i:=i-1;
      if ch=#77 then i:=i+1;
      if i=4 then i:=1;
      if i=0 then i:=3;
until (ch=#13) or (ch='n');
case i of
     1:begin  end;
     2:begin halt; end;
     3:begin k:=false; break; end;
     end;
until false;
until k;
end.