Program FeldMaxTest (input,output);

  const
  UNTEN = 0; { Array-Untergrenze }
  OBEN = 10; { Array-Obergrenze }

  type
  tIndex = UNTEN..OBEN;
  tFeld = array[tIndex] of integer;

  var
  Feld : tFeld;


function FeldMaxA (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten = inOben then
    FeldMaxA := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxA (inFeld,inUnten,Mitte);
    MaxR := FeldMaxA (inFeld,Mitte+1,inOben);
    if MaxL > MaxR then
      FeldMaxA := MaxL
    else
      FeldMaxA := MaxR
  end
end; { FeldMaxA }

     

	

function FeldMaxB (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem
    Feld mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten = inOben then
    FeldMaxB := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxB (inFeld,inUnten,Mitte);
    MaxR := FeldMaxB (inFeld,Mitte,inOben); {recursion doesn't terminate}
    if MaxL > MaxR then
      FeldMaxB := MaxL
    else
      FeldMaxB := MaxR
  end
end; { FeldMaxB }

function FeldMaxC (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld  
    mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten > inOben then
    FeldMaxC := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxC (inFeld,inUnten,Mitte); {infinite recursion if inUnten = inOben}
    MaxR := FeldMaxC (inFeld,Mitte+1,inOben); {oversteps array here! if inUnten=inOben}
    if MaxL > MaxR then
      FeldMaxC := MaxL
    else
      FeldMaxC := MaxR
  end
end; { FeldMaxC }

     

	

function FeldMaxD (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;

begin
  if inUnten > inOben then
    FeldMaxD := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxD (inFeld,inUnten,Mitte); {infinite recursion, if inUnten=inOben}
    MaxR := FeldMaxD (inFeld,Mitte,inOben);
    if MaxL > MaxR then
      FeldMaxD := MaxL
    else
      FeldMaxD := MaxR
  end
end; { FeldMaxD }

function FeldMaxE (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt iterativ das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

  var
  i : tIndex;
  HilfMax : integer; { Hilfsvariable }

begin
  HilfMax := 0;	     { init wert 0, aber kann negative Zahlen enthalten!}
  for i := inUnten to inOben do
    if inFeld[i] > HilfMax then
      HilfMax := inFeld[i];
  FeldMaxE := HilfMax
end; { FeldMaxE }

begin
   Feld[0] :=   0; Feld[5] := 6;
   Feld[1] :=   1; Feld[6] := 12;
   Feld[2] :=  77; Feld[7] := -13;
   Feld[3] :=   9; Feld[8] := 34;
   Feld[4] := -12; Feld[9] := 99;


   writeln(FeldMaxA(Feld, 3, 8));
   { writeln(FeldMaxB(Feld, 3, 8)); } {endlos schleife, leider kommt kein
				       "call stack exhausted" sondern einfach
				      nur "segmentation fault" error. wew}
   { writeln(FeldMaxC(Feld, 0, 0)); same as B also oversteps array bounds! }
   { writeln(FeldMaxD(Feld, 0, 0)); same as C, but no overstepping }
   writeln(FeldMaxE(Feld, 0, 9)); { nice, straightforward, implementation
				  UPDATE: wrong, as HilfMax assumes 0 as init value
				  and the array may contain negative numbers}
end.
