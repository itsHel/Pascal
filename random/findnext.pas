program k;
uses dos;
var soub: searchrec;
begin
FindFirst('c:\*.*',anyfile,soub); (* najdeme prvn� soubor odpov�daj�c� zad�n� *)
while DosError = 0 do begin       (* dokud se soubor poda�� naj�t *)
 writeln(soub.name, ' - ',soub.size, ' byt�'); (* vyp�eme jm�no + velikost *)
 findnext(soub); (* najdeme dal�� soubor *)
 end;
end. 