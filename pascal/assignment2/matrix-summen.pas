
program MatrixSummen (input, output);
{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

  const
  ZEILENMAX = 3;
  SPALTENMAX = 4;

  type
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

  var
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;

  function ZeilenSummeKleiner (var inMatrix : tMatrix;
                                     inZeilenNr : integer) : boolean;
    { ergibt true, falls die Summe aller Elemente mit dem
      uebergebenen Zeilenindex kleiner ist als jede
      Spaltensumme }
    var
    ZeilenIndex,  { zum iterieren über Zeilen }
    ZeilenSumme,
    SpaltenIndex, { zum iterieren über Spalten }
    SpaltenSumme : integer;
    SpaltenSummeKleinerGleich : boolean;
  begin
     { init }
     SpaltenSummeKleinerGleich := false;
     ZeilenSumme := 0;
     SpaltenSumme := 0;
     { ZeilenSumme berechnen: }
     for ZeilenIndex := 1 to SPALTENMAX do
	ZeilenSumme := ZeilenSumme + inMatrix[inZeilenNr, ZeilenIndex];
     
     { SpaltenSummen nacheinander berechnen und sogleich vergleichen mit der Zeilensumme }
     writeln('Spaltensummen:');
     for ZeilenIndex := 1 to SPALTENMAX do
     begin
        if (not SpaltenSummeKleinerGleich) then { vielleicht schöner mit einem repeat until zu lösen }
	begin
	   SpaltenSumme := 0; { vor jeder Iteration wieder auf 0 setzen }
	   for SpaltenIndex := 1 to ZEILENMAX do
	   begin
	      SpaltenSumme := SpaltenSumme + inMatrix[SpaltenIndex, ZeilenIndex];
	   end;
	   { Es mag bisschen verwirrend sein, aber die Anzahl der Zeilen ist gleich der Anzahl
	   der Spaltenelemente: }
	   write('  Spalte ', ZeilenIndex, ': ', SpaltenSumme, ', ', SpaltenSumme);
	   if SpaltenSumme > ZeilenSumme then
	      writeln(' > ', ZeilenSumme)
	   else
	   begin
	      writeln(' <= ', ZeilenSumme);
	      SpaltenSummeKleinerGleich := true; { unser 'terminierender' Flagg wird gesetzt }
	   end;
	end;
     end;
     if SpaltenSummeKleinerGleich then
	ZeilenSummeKleiner := false
     else
	ZeilenSummeKleiner := true;
	
 
  end; { ZeilenSummeKleiner } 

begin { Matrixelemente einlesen } 
   { for ZeilenNr := 1 to ZEILENMAX do  }
   {    for SpaltenNr := 1 to SPALTENMAX do  }
   { 	 read (Matrix[ZeilenNr, SpaltenNr]);  }
   Matrix[1,1] := 5;  Matrix[1,2] := 6; Matrix[1,3] := 8; Matrix[1,4] := 2;
   Matrix[2,1] := 9;  Matrix[2,2] := 4; Matrix[2,3] := 6; Matrix[2,4] := 3;
   Matrix[3,1] := 5;  Matrix[3,2] := 3; Matrix[3,3] := 7; Matrix[3,4] := 1;
   
   repeat write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX, ') (anderes = Ende) '); 
      readln (Eingabe); if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then begin ZeilenNr := Eingabe; 
	 { hier wird die Funktion ZeilenSummeKleiner aufgerufen } 
	 if ZeilenSummeKleiner (Matrix,ZeilenNr) then 
	    writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
	 else 
	    writeln ('Es sind nicht alle Spaltensummen groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.')
      end; 
   until (Eingabe <= 0) or (Eingabe > ZEILENMAX) 
end. { MatrixSummen } 
