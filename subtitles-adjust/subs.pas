program t;
uses crt;
var x,y,s:string;
    f1,f2:text;
    i,seti,sec,min,hod,ch,d:integer;
    a:longint;
    secs,mins,hods,setis:string;

procedure p(z:integer; var s:string);
begin
str(z,s);
if length(s)=1 then insert('0',s,1);
end;

begin
     clrscr;
     write('Zadejte soubor: ');
     readln(y);
     write('posun: ');
     gotoxy(14,2);
     write('[ms]');
     gotoxy(8,2);
     readln(i);
     assign(f1,y);
     assign(f2,'z.srt');
     reset(f1);
     rewrite(f2);
     repeat
           readln(f1,x);
           if pos('-->',x)=0 then
              writeln(f2,x)
              else begin
              for d:=1 to 2 do begin
                  s:=copy(x,pos(',',x)-2,2)+copy(x,pos(',',x)+1,3);
                  val(s,a,ch);
                  if ch<> 0 then begin writeln('spatny format'); readln; exit; end;
	          s:=copy(x,1,2);
		  val(s,hod,ch);
		  s:=copy(x,4,2);
		  val(s,min,ch);
                  a:=a+i;

                  if a>60000 then begin inc(min); a:=a-60000; end else
                  if a<0 then begin dec(min); a:=a+60000; end;
                  if min>60 then begin inc(hod); min:=min-60; end else
                  if min<0 then begin dec(hod); min:=min+60; end;

                  seti:=a mod 1000;
                  sec:=a div 1000;
                  p(sec,secs);
                  p(hod,hods);
                  p(min,mins);
                  p(seti,setis);
                  if length(setis)=2 then insert('0',setis,1);

                  write(f2,hods,':',mins,':',secs,',',setis);
                  if d=1 then write(f2,' --> ');
                  delete(x,1,pos('> ',x)+1);
              end;
              writeln(f2);
              end;
     until eof(f1);
     close(f2);
     erase(f1);
     assign(f2,'z.srt');
     rename(f2,y);

end.