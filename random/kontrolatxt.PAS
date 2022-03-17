program k;
uses crt;
var f1,f2:text;
    x,y:string;

begin
clrscr;
write('soubor 1: ');
readln(x);
assign(f1,x);
write('soubor 2: ');
readln(x);
assign(f2,x);
reset(f1);
reset(f2);
repeat
readln(f1,x);
readln(f2,y);
if x<>y then begin
   writeln(x);
   writeln(y);
   readln;
   end;
until (eof(f1)) and (eof(f2));
close(f1);
close(f2);
end.