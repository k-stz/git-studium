Program Aufgabe2(input, output);
{ liest eine natürliche zahl n ein und gibt auf der ausgabe
ein dreieck aus 'X' mit kanten bestehend aus n 'x' }

var
  n,
  i, j : integer; { iterationsvariablen}

begin
  writeln('geben sie n ein:');
  n := 5;	  { solution should use READLN()}
  for i := 1 to n do
  begin
    for j := 1 to i do
    begin
      write('X'); {append X to each other}
    end;
    writeln();	  {newline}
  end;
end.
