program dataStructures;

   type
      tNumberName  = (zero, one, two, three, four, five, six, seven, eight, nine, ten);
      tMatrixIndex = 0 .. 3;
      {dt. "Verbundtyp"  }
      tStudent =  record 
		     name : string;
		     age  : integer;
		  end;		 {tStudent}
			 

   var
      { array[<index type>] of <component type> }
      Names :  array[integer] of string; 
      { a multidimensional array's index type must be an ordinal type! }
      IdentityMatrix : array[tMatrixIndex, tMatrixIndex] of integer;
      Numbers : array[integer] of tNumberName;
      i : integer;
      { record }
      BillyBob : tStudent;



begin 
   Names[0] := 'minkowski';
   writeln(names[0]);

   { init the "numbers" array: }
   for i := 0 to 10 do
      Numbers[i] := tNumberName(i);

   { count down }
   for i := 10 downto 0 do
      writeln(Numbers[i]);


   { multidimensional arrays: }
   writeln('reading from multidimensional array -----:');
   IdentityMatrix[0][0] := 1;
   writeln(identityMatrix[0][0]);

   writeln('record -----:');
   { as always, dot notation is used to access the slots }
   BillyBob.name := 'Birry Bobu';
   BillyBob.age := 5;
   writeln('What''s your name little fella?',
	   ' Name''s ', BillyBob.name, ' and I am ',
	   BillyBob.age, ' years old!');
end.
