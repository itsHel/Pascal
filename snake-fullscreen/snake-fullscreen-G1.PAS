program kkk;
uses crt;
var g,d,i,f:integer;
    {o,z,p,}x,y,a,b:array [1..10] of integer;
    ch:char;
    k:array [1..11] of boolean;

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
  mov ax,0010h;
  int 10h;
 end;

procedure zm(xp,yp:integer; var ap,bp:integer);
 var z,z1,p1,p:integer;
 begin

 if ap=0 then begin
    for z:=2 to 320 do begin
        if getpixel(xp+z,yp)<>0 then begin z1:=z; break; end;
        if xp+z>640 then xp:=-z;
        end;
    for p:=2 to 320 do begin
        if getpixel(xp-p,yp)<>0 then begin p1:=p; break; end;
        if xp-p<0 then xp:=640+p;
        end;
        if z1>p1 then ap:=1 else ap:=-1;
        bp:=0;
        end
    else begin
    for z:=2 to 240 do begin
        if getpixel(xp,yp+z)<>0 then begin z1:=z; break; end;
        if yp+z>480 then yp:=-z;
        end;
    for p:=2 to 240 do begin
        if getpixel(xp,yp-p)<>0 then begin p1:=p; break; end;
        if yp-p<0 then yp:=480+p;
        end;
        if z1>p1 then bp:=1 else bp:=-1;
        ap:=0;
        end;
 end;

procedure ai(xp,yp:integer; var ap,bp:integer);
begin
if getpixel(xp+3*ap,yp+3*bp)<>0 then zm(xp,yp,ap,bp);
{case ap of
    -1:begin ap:=0; if random(2)=0 then bp:=1 else bp:=-1; end;
     0:begin bp:=0; if random(2)=0 then ap:=1 else ap:=-1; end;
     1:begin ap:=0; if random(2)=0 then bp:=1 else bp:=-1; end;
end; }
end;

begin
initgraph;
randomize;
repeat
x[1]:=320; y[1]:=240;
k[1]:=false;
a[1]:=1;
b[1]:=0;
for i:=2 to 10 do begin
    k[i]:=false;
    a[i]:=random(4);
    case a[i] of
         0:begin a[i]:=0; b[i]:=1; end;
         1:begin a[i]:=0; b[i]:=-1;end;
         2:begin a[i]:=1; b[i]:=0; end;
         3:begin a[i]:=-1; b[i]:=0; end;
    end;
    y[i]:=random(480);
    x[i]:=random(640);
end;
k[11]:=false;

repeat
for f:=1 to 10 do if k[f]=false then begin
if f<>1 then begin ai(x[f],y[f],a[f],b[f]);
   if random(100)=0 then zm(x[f],y[f],a[f],b[f]); end;
if keypressed then begin ch:=readkey;
   case ch of
     'a':begin a[1]:=-1; b[1]:=0; end;
     's':begin a[1]:=0; b[1]:=1; end;
     'd':begin a[1]:=1; b[1]:=0; end;
     'w':begin a[1]:=0; b[1]:=-1; end;
     #27:begin halt; end;
   end;
end;
x[f]:=x[f]+a[f]; y[f]:=y[f]+b[f];
if x[f]<0 then x[f]:=640;
if y[f]<0 then y[f]:=480;
if x[f]>640 then x[f]:=0;
if y[f]>480 then y[f]:=0;
delay(5);

if getpixel(x[f]+a[f],y[f]+b[f])<>0 then k[f]:=true;

if a[f]=0 then
   for i:=-1 to 1 do
    putpixel(x[f]+i,y[f],f)
    else
    for i:=-1 to 1 do
    putpixel(x[f],y[f]+i,f);

end;

until k[1];
exit;
ch:=readkey;
if ch=#27 then halt;
until false;
end.