{ The output has a unique relationship to the input, once it is realised
  the implementation is all the more interesting! }

program WasPassiert(input, output);
  var
  a, b, c: Integer;

begin
  b := 0;
  c := 1;
  readln(a);
  while a > 0 do
  begin
    b := b+c*(a mod 2);
    a := a div 2;
    c := c*10;
  end;
  writeln(b)
end.
