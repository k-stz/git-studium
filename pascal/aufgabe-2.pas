Program Aufgabe2(input, output);
{ Program tut dies und jenes.. Kommentar nicht vergessen!! }

procedure angespartes(inZinsen : integer; inLaufzeit : integer; ioBetrag : real);

var 
  i	     : integer;		 { iterations variable}
begin
  i := 1;
  for i:= 1 to inLaufzeit do
  begin
    ioBetrag := ioBetrag + (ioBetrag * inZinsen * 0.01);
    writeln('Nach ', i, ' Jahren ', ioBetrag:6:2);
  end;
end;

begin
  angespartes(3, 4, 100);
end.
