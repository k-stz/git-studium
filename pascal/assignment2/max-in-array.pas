program MaxInArray;
{ shows several statements that use the function MAX and we shall
  decedide which could get the index out of bounds in the FELD array }

   const
   GRENZE = 10;
   type      
   tIndex = 1..GRENZE;
   tFeld = array [tIndex] of integer;
   var
   Feld : tFeld;
   w,
   w1,
   w2 : integer;


function max (
               ParFeld: tFeld;
               von, bis: tIndex): integer;
    { bestimmt das Maximum im Teilfeld von ParFeld[von] 
      bis ParFeld[bis] }
    var
      Wert : integer;
      i : tIndex;
    begin
      Wert := ParFeld[von];
      for i := von + 1 to bis do
        if ParFeld[i] > Wert then
          Wert := ParFeld[i];
      max := Wert
    end; { max }   

begin

   Feld[1] := 1; Feld[2] := 2; Feld[3] := 3; Feld[4] := 4; Feld[5] := 5;
   Feld[6] := 6; Feld[7] := 7; Feld[8] := 88; Feld[9] := 9; Feld[10] := 10;
   { A }
   w := max (Feld, Feld[1], Feld[GRENZE]);
   writeln(w);
   { B }
   w := max (Feld, (GRENZE-1) div 2,
            (GRENZE-1) div 2);
   writeln(w);
   { C }
   if max (Feld, 1, (GRENZE-1) div 2) >
      max (Feld, (GRENZE+1) div 2, GRENZE)
      then
      w := max (Feld, 1, (GRENZE-1) div 2)
   else
      w := max (Feld, (GRENZE+1) div 2, GRENZE);
   writeln(w);
   { D - out of bounds}
   w := max (Feld, 1, GRENZE);
   if w <= GRENZE then { would fail if w <= 0}
      write (max (Feld, w, w));
   { E - out of bounds }
   w1 := max (Feld, 1, GRENZE);
   w2 := max (Feld, 4, GRENZE-1);
   if (0 < w2) and (w1 <= GRENZE) then
   begin { e.g. when w assumes a negative value }
      w := max (Feld, 2, GRENZE);
      w := max (Feld, 1, w)
   end;

end. { MaxInArray }
