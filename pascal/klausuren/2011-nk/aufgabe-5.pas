Program Aufgabe5(input, output);
{ Rekursive Funktion ist zu schreiben die entscheided ob ein Integer-Wert in einem Baum
vom Typ tRefBinBaum enthalten ist. Diese Funktion soll einen Boolean welt zurückgeben}

type
  tRefBinBaum= ^tBinBaum;
  tBinBaum= record
	      wert : Integer;
	      links, rechts : tRefBinBaum
	    end;
var
  baum : tRefBinBaum;

function enthalten (inWert : integer; inBaum : tRefBinBaum) : boolean;
{ Returns true if inWert is contained in the inBaum tree }
begin
  { base case - the empty tree }
  if (inBaum = nil) then
  begin
    enthalten := false;
  end
  else
  begin
    if (inBaum^.wert = inWert) then
    begin
      enthalten := true;
    end
    else
    begin
      enthalten := enthalten(inWert, inBaum^.links) or enthalten (inWert, inBaum^.rechts);
    end;
  end;
end;

begin
  { build tree }
  new(baum);
  baum^.wert := 0;
  new(baum^.links);
  new(baum^.rechts);
  baum^.links^.wert := 1;
  baum^.rechts^.wert := 2;
  { find element }
  writeln(enthalten(0, baum));
  
end.
