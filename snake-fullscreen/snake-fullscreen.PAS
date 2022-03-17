program kkk;
uses crt;
var x,y,a,b,d,c:integer;
    ch:char;
    px,py:array [1..100] of integer;

Procedure Putpixel (x,y : integer; col : byte); assembler;
 asm
  mov ah,0Ch
  mov al,[col]
  mov cx,[x]
  mov dx,[y]
  mov bx,[1]
  int 10h
 end;

function getpixel(x,y : word) : byte; assembler;
 asm
  mov ax,0a000h
  mov es,ax
  mov ax,y
  mov dx,320
  mul dx
  mov di,ax
  add di,x
  mov al,[es:di]
 end;

Procedure initgraph; assembler;
 asm
  mov ax,0013h;
  int 10h;
 end;

Procedure food;
 var a1,a2:integer;
 begin
  repeat
  a1:=random(320); a2:=random(240);
  until getpixel(a1,a2)=0;
  putpixel(a1,a2,1);
 end;

Procedure line(x1,y1,x2,y2,b:integer);
 var i:integer;
 begin
  if x1=x2 then
  for i:=1 to abs(y2-y1) do
   putpixel(x2,abs(y2-y1+i),b)
   else if y1=y2 then
   for i:=1 to abs(x2-x1) do
    putpixel(abs(x2-x1+i),abs(y2),b);
 end;

begin
 initgraph; randomize;
 x:=160; y:=120;
 a:=1; b:=0;
 d:=30;
 c:=1;
{asm
mov     ax,0003h
int     10h
end;}

 line(100,100,100,170,5);
 line(200,100,200,170,5);
 food;
 repeat
  putpixel(x,y,10);
  if c>d then
    putpixel(px[c-d],py[c-d],0)
    else
    putpixel(px[c-d+100],py[c-d+100],0);
  px[c]:=x;
  py[c]:=y;
  inc(c);
  if c=101 then c:=1;
  if getpixel(x+a,y+b)=1 then begin
   d:=d+1;
   food;
   end;
  if getpixel(a+x,y+b)=5 then exit;
  if keypressed then begin ch:=readkey;
    case ch of
      'a':begin a:=-1; b:=0; end;
      's':begin a:=0; b:=1; end;
      'd':begin a:=1; b:=0; end;
      'w':begin a:=0; b:=-1; end;
      #27:begin exit; end;
    end;
  end;
  x:=x+a; y:=y+b;
  if x<0 then x:=320;
  if y<0 then y:=200;
  if x>320 then x:=0;
  if y>200 then y:=0;
  delay(20);
 until false;
 end.