unit sifr;

interface
 procedure sif(s2,s1,k:string);
 procedure desif(s2,s1,k:string);

implementation
procedure sif(s2,s1,k:string);
var f1,f2:text;
    x,y:string;
    i,o,u:integer;
begin
 assign(f1,s1);
 assign(f2,s2);
 rewrite(f1);
 reset(f2);
 while not eof(f2) do begin
  readln(f2,x);
  u:=0;
  y[0]:=chr(length(x));
  for i:=1 to length(x) do begin
   if x[i]=' ' then x[i]:=chr(ord('a')-1);
   inc(u); if u>length(k) then u:=1;
   o:=ord(x[i])+ord(k[u])-96;
  { if o>122 then o:=o-26; }
   y[i]:=chr(o);
  end;
  writeln(f1,y);
 end;
 close(f1);
end;

procedure desif(s2,s1,k:string);
var f1,f2:text;
    x,y:string;
    i,o,u:integer;
begin
 assign(f1,s1);
 assign(f2,s2);
 rewrite(f1);
 reset(f2);
 while not eof(f2) do begin
  readln(f2,x);
  u:=0;
  y[0]:=chr(length(x));
  for i:=1 to length(x) do begin
   inc(u); if u>length(k) then u:=1;
   o:=ord(x[i])-ord(k[u])+96;
  { if o<96 then o:=o+26;}
   if o=96 then o:=32;
   y[i]:=chr(o);
  end;
  writeln(f1,y);
  end;
 close(f1);
end;



begin

end.