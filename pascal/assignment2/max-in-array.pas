program MaxInArray;

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

end.
