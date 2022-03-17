program k;
uses dos;
var soub: searchrec;
begin
FindFirst('c:\*.*',anyfile,soub); (* najdeme první soubor odpovídající zadání *)
while DosError = 0 do begin       (* dokud se soubor podaøí najít *)
 writeln(soub.name, ' - ',soub.size, ' bytù'); (* vypíšeme jméno + velikost *)
 findnext(soub); (* najdeme další soubor *)
 end;
end. 