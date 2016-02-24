{ Procedure - imperative side effects }

program ProdcureExample;

  var sumCatcher : integer;
      inc	 : integer;

procedure Add ({in} x : integer; {in} y : integer; {out} sum : integer);
{ Add x and y together and store the result in sum. }
begin
   sum := x + y; { TODO: that's not how it works, &syntax seems to compile though}
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

begin
   writeln('Side-effects example:');
   writeln(sumCatcher);
   Add(1,9, sumCatcher);
   { writeln(sumCatcher); }

   writeln('procedure INC: ');
   inc := 0;
   writeln(inc);
   Increment;
   writeln(inc);
   Increment();
   writeln(inc);

   writeln('function ConstantOne:');
   writeln(ConstantOne());
end. { ProdcureExample }					  
