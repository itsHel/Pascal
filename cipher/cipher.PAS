program iop;
uses crt,sifr;
var ch:char;

begin
  if paramstr(1)='s' then
  sif(paramstr(2),paramstr(3),paramstr(4))
 else if paramstr(1)='d' then
  desif(paramstr(2),paramstr(3),paramstr(4))
 else writeln('error');
  if (paramstr(1)='s') or (paramstr(1)='d') then writeln('done');
end.