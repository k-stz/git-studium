Program Aufgabe8 (input, output);

  type
  tPerson = record
              Name : string[20];
              Alter : integer
            end;

  var
  pPerson1,
  pPerson2 : ^tPerson;
  Zahl1,
  Zahl2 : integer;
  pZahl1,
  pZahl2 : ^integer;

begin
   new (pZahl1);
   Zahl1 := 34;
   pZahl1^ := Zahl1;
   pZahl2 := pZahl1;  { new nicht nötig, da auf ein bestehenden Speicher,
		        reserviert durch pZahl1, gezeicht wird}
   writeln('compiles.');
end.
