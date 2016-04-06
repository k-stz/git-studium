
program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
  ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }
        
  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);


  { Verschmelzungsprozess beginnen }
   { FELD1[1] := 1; FELD1[2] := 1; FELD1[3] := 1; FELD1[4] := 1; FELD1[5] := 1; }
   { FELD2[1] := -1; FELD2[2] := -1; FELD2[3] := -1; FELD2[4] := -1; FELD2[5] := -1; FELD2[6] := -1; }
   { FELD2[7] := -1; FELD2[8] := -1; }

   i := 1;
   j := 1;
   for k := 1 to ERGEBNISFELDLAENGE do
   begin
      if  (not (i > FELDLAENGE1)) and (not (j > FELDLAENGE2)) then
      begin 
	 if (Feld1[i] <= Feld2[j])  then
	 begin
	    ErgebnisFeld[k] := Feld1[i];
	    i := i + 1;
	 end
         else
	 begin
	    ErgebnisFeld[k] := Feld2[j];
	    j := j + 1;
	 end;
      end
      else
      begin
	 if (i > FELDLAENGE1) and (not (j > FELDLAENGE2)) then
	 begin
	    ErgebnisFeld[k] := Feld2[j];
	    j := j + 1;
	 end;
	 if (j > FELDLAENGE2) and (not (i > FELDLAENGE1)) then
	 begin
	    ErgebnisFeld[k] := Feld1[i];
	    i := i + 1;
	 end;
      end;
   end;


  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
  writeln
end.

