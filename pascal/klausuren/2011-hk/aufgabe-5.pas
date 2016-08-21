Program Aufgabe5(input, output);
{ schreibe eine rekursive funktion, die alle Werte in den Knoten eines Baumes zusammen
  addiert und das Ergebnis als INteger zurückgibt }

type
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
	       Wert : Integer;
	       links,rechts : tRefBinBaum
	     end;

var
  baum :  tRefBinBaum;

function addNodes(inTree : tRefBinBaum) : integer;
begin
  if (inTree <> nil) then
    begin
      addNodes := inTree^.wert + addNodes(inTree^.links) + addNodes(inTree^.rechts);
    end
    else
    begin
      addNodes := 0;
    end;
end;

begin
  { init tree, sum is 198 }
  new(baum);
  new(baum^.links);
  new(baum^.rechts);
  baum^.wert := 77;
  baum^.links^.wert := 88;
  baum^.rechts^.wert := 33; 
  new(baum^.rechts^.rechts);
  new(baum^.rechts^.links);
  new(baum^.links^.rechts);
  new(baum^.links^.links);
  baum^.rechts^.rechts := nil;
  baum^.rechts^.links := nil;
  baum^.links^.rechts := nil;
  baum^.links^.links := nil;
  writeln('the sum of the nodes is:');
  writeln(addNodes(baum));
  
end. 
