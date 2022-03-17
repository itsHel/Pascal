unit my;

interface
function fa(x:integer):longint;

implementation
function fa(x:integer):longint;
var b:integer;
    c:longint;
begin
c:=1;
for b:=1 to x do
c:=c*b;
fa:=c;
end;
end.