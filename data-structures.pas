program dataStructures;

   type
      tNumberName  = (zero, one, two, three, four, five, six, seven, eight, nine, ten);
      tMatrixIndex = 0 .. 3;

   var
      { array[<index type>] of <component type> }
      names :  array[integer] of string; 
      { a multidimensional array's index type must be an ordinal type! }
      identityMatrix : array[tMatrixIndex, tMatrixIndex] of integer;
      numbers : array[integer] of tNumberName;
      i : integer;

begin 
   names[0] := 'minkowski';
   writeln(names[0]);

   { init the "numbers" array: }
   for i := 0 to 10 do
      numbers[i] := tNumberName(i);

   { count down }
   for i := 10 downto 0 do
      writeln(numbers[i]);


   { multidimensional arrays: }
   writeln('reading from multidimensional array -----:');
   identityMatrix[0][0] := 1;
   writeln(identityMatrix[0][0]);
end.
