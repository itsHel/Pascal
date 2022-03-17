program k;
uses dos,crt;
begin
clrscr;

exec('c:\windows\system32\notepad.exe','c:\k.bat');

writeln(doserror);
readln;
end.