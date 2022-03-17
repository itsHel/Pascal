program k;
uses Dos;
var i: Integer;
    f:text;
begin
assign(f,'c:\kkk.txt');
rewrite(f);
 for i := 1 to EnvCount do begin
  writeln(f,EnvStr(i));
  end;
  readln;
end.