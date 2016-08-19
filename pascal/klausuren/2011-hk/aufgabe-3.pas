Program Aufgabe3(input, output);
{ wir berechnen die stadardabweichung der element eines feldes vom typ tFeld }

const
  FELDGROESSE=5;
type
  tIndex=1..FELDGROESSE;
  tFeld=array[tIndex] of real;

var
  feld	     : tFeld;
  m :  real;

function mittelwert(inFeld : tFeld) : real;
var
  sum : real;
  i   : integer; {iter variable}
begin
  { init }
  sum := 0;
  for i := 1 to FELDGROESSE do
    begin
      sum := sum + inFeld[i];
    end;
  mittelwert := sum / FELDGROESSE;
end;

function standardabweichung(inFeld : tFeld; inMittelwert : real) : real;
var
  s   : real; {standardbweichung}
  i   : integer; {iter}
  sum :  real;
begin
  sum := 0;
  for i := 1 to FELDGROESSE do
    begin
      sum := sum + (inFeld[i] - inMittelwert) * (inFeld[i] - inMittelwert);
    end;
  s := sqrt(sum / FELDGROESSE);
  standardabweichung := s;
end;

begin
  { init }
  feld[1] := 1;
  feld[2] := 2;
  feld[3] := 3;
  feld[4] := 4;
  feld[5] := 5;
  m := mittelwert(feld);
  writeln(standardabweichung(feld, m));

end.
