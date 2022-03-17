program kkk;
uses crt,graph;
var i,o,z,g,d:integer;



begin

detectgraph(g,d);
initgraph(g,d,'');
setgraphmode(4);
randomize;

 for i:=1 to 640 do
            for o:=1 to 480 do
	        Putpixel(i,o,11);
		readkey;
                exit;
repeat
{setcolor(random(30));
circle(320,240,random(400)); }

{for o:=0 to 13 do        begin
setcolor(o+1);
for i:=o*30+1 to o*30+30 do
circle(320,240,i);
readln;
end;}

{i:=random(640); o:=random(480);
for z:=1 to 22 do
circle(i,o,z);
setcolor(random(30)+1); }
until false;
end.