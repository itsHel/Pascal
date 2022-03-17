program k;
uses dos,crt;
begin
clrscr;

exec('c:\windows\system32\cmd.exe','/c c:\k.bat');

writeln(doserror);
readln;
end.