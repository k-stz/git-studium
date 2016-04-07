
program BinarySearch (input, ouput);
{ shows different implementation of a binary search for a 1d-array.
The assignment is to tell which implementation actually works. }


 const
    FELDGROESSE = 6;

 var
    Feld	       : array[1..FELDGROESSE] of integer;
    i		       :  integer;

Procedure algA(Suchwert :  integer);
   var
   unten, oben, Mitte : integer;
   gefunden	      :  boolean;
begin
   unten := 1;
   oben := FELDGROESSE;
   repeat
      Mitte := (oben + unten) div 2;
      if Suchwert > Feld[Mitte] then
	 unten := Mitte + 1;
      if Suchwert < Feld[Mitte] then
	 oben := Mitte - 1;
      gefunden := (Suchwert = Feld[Mitte]) 
   until gefunden or (unten > oben);

   writeln(gefunden);
end;

Procedure algB(Suchwert :  integer);
   var
   unten, oben, Mitte : integer;
   gefunden	      :  boolean;
begin
   unten := 1;
   oben := FELDGROESSE;
   repeat
      Mitte := (oben + unten) div 2;
      if Suchwert > Feld[Mitte] then
	 unten := Mitte
      else
	 oben := Mitte;
      gefunden := (Feld[Mitte] = Suchwert) 
   until gefunden or (unten >= oben);

   writeln(gefunden);
end;

Procedure algC(Suchwert :  integer);
   var
   unten, oben, Mitte : integer;
   gefunden	      :  boolean;
begin
   gefunden := false;
   unten := 1;
   oben := FELDGROESSE;
   while (unten < oben) and not gefunden do
   begin
      Mitte := (oben + unten) div 2;
      if Suchwert = Feld[Mitte] then
	 gefunden := true
      else
	 if Suchwert < Feld[Mitte] then
	    oben := Mitte - 1
	 else
	    unten := Mitte + 1
   end;

   writeln(gefunden);
end;

Procedure algD(Suchwert :  integer);
   var
   unten, oben, Mitte : integer;
   gefunden	      :  boolean;
begin
   gefunden := false;
   unten := 1;
   oben := FELDGROESSE;
   while (unten <= oben) and not gefunden do
   begin
      Mitte := (oben + unten) div 2;
      if Suchwert = Feld[Mitte] then
	 gefunden := true
      else
	 if Suchwert < Feld[Mitte] then
	    oben := Mitte - 1
	 else
	    unten := Mitte + 1
   end;

   writeln(gefunden);
end;

Procedure algE(Suchwert :  integer);
   var
   unten, oben, Mitte : integer;
   gefunden	      :  boolean;
begin
   unten := 1;
   oben := FELDGROESSE;
   repeat
      Mitte := (oben + unten) div 2;
      if Suchwert <= Feld[Mitte] then
	 oben := Mitte - 1;
      if Feld[Mitte] <= Suchwert then
	 unten := Mitte + 1;
   until (unten > oben);
   gefunden := (Feld[Mitte] = Suchwert);

   writeln(gefunden);
end;

begin
   { init data }
   Feld[1] := 1;
   Feld[2] := 2;
   Feld[3] := 3;
   Feld[4] := 4;
   Feld[5] := 5;
   Feld[6] := 6;


   { WORKS: }
   { writeln('algA----------------'); }
   { for i := 0 to 10 do }
   { begin }
   {    write('i: ', i:2, ' '); }
   {    algA(i); }
   { end; }

   { this one is an endless loop! }
   { writeln('algB----------------'); }
   { for i := 0 to 10 do }
   { begin }
   {    write('i: ', i:2, ' '); }
   {    algB(i); }
   { end; }

   { doesn't work: }
   { writeln('algC----------------'); }
   { for i := 0 to 10 do }
   { begin }
   { write('i: ', i:2, ' '); }
   {    algC(i); }
   { end; }

   { WORKS: }
   { writeln('algD----------------'); }
   { for i := 0 to 10 do }
   { begin }
   { write('i: ', i:2, ' '); }
   {    algD(i); }
   { end; }

   { WORKS: }
   { writeln('algE----------------'); }
   { for i := 0 to 10 do }
   { begin }
   {    write('i: ', i:2, ' '); }
   {    algE(i); }
   { end; }

end.
