{ Procedure - imperative side effects }

program ProdcureExample;

  var sumCatcher : integer;
      inc	 : integer;

procedure Add ({in} x : integer; {in} y : integer; {out} var sum : integer);
{ Add x and y together and store the result in sum. }
begin
   sum := x + y;
end;

{ functions must return values. 'Increment', the function name, must be assigned a
  value  }
function ConstantOne() : integer;
begin
   ConstantOne := 1;
end; { ConstantOne}

procedure Increment();
{ increments the variable 'inc' }
begin
   inc := inc + 1;
end; { Increment }

{ referenc parameter, an example using a procedure: }
procedure IncrementByReference(var toBeIncremented : integer );
begin
   toBeIncremented := toBeIncremented + 1;
end;

begin
   writeln('Side-effects example:');
   writeln('sumCatcher before calling side-effect procedure:  ', sumCatcher);
   Add(1,9, sumCatcher);
   writeln('sumCatcher after calling Add(1, 9, sumCatcher):   ', sumCatcher); 

   writeln('procedure INC: ');
   inc := 0;
   writeln(inc);
   Increment;
   writeln(inc);
   Increment();
   writeln(inc);

   writeln('function ConstantOne:');
   writeln(ConstantOne());

   inc := 0;
   writeln('Call by reference: ', '        inc = ', inc);
   write('IncrementByReference(inc); ', 'inc = ');
   IncrementByReference(inc);
   writeln(inc);
end. { ProdcureExample }					  
