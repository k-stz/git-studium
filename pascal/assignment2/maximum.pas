Program Maximum (input, output);
{ Dieses Program nimmt eine Eingabefolge von integer-Zahlen auf und gibt das
Maximum dieser aus. Die Eingabefolge muss mit einer '0' terminiert werden.
Eine leere Eingabefolge wird mit 'Leere Eingabefolge!' beantwortet. }

   var
   inputNumber,
   theMaximum : integer;
   emptyInput : boolean;

begin
   { init }
   emptyInput := true;
   readln(inputNumber);
   theMaximum := inputNumber;

   while inputNumber <> 0 do
   begin
      emptyInput := false;
      { die eigentliche Maximum Abfrage: }
      if inputNumber > theMaximum then
	theMaximum := inputNumber;

      readln(inputNumber);
   end;
  
   if emptyInput = true then
      writeln('Leere Eingabefolge!')
   else
   begin
      writeln('Maximum: ', theMaximum);
   end;
 
end. { Maximum }
