{ Procedure - imperative side effects }

{ inVar - is like the local constant of a procedure, all function parameters are 'inVars' }
{ var outVar - is never read, only used to return a value, that's why it should always be a var-parameter }
{ var ioVar - intialized as it is being called, and used to change the the value in the procedure body }
program ProdcureExample;

  var sumCatcher : integer;
      inc	 : integer;

procedure Add ({in} inX : integer; {in} inY : integer; {out} var outSum : integer);
{ Add x and y together and store the result in sum. }
begin
   outSum := inX + inY;
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

{ reference parameter, an example using a procedure, in Pascal this is
  also called a var-parameter. On invoking the procedure, the formal parameter
  "toBeIncremented" doesn't receive the value of the variable passed to it
  IncrementByReference(iMeanThisVariable);
  but rather the reference to that variable - or to be perfectly accurate: 
  its address.
  The address is like the global unique identifier of a variable, whoever gets hold
  of it will change the actuall variable that it belongs to. That's why this procedure
  will change the value of a variable that was passed to it rather than its local 
  variable "toBeIncremented".
  In C, C++ the syntax for this is not: var <identifier> but &<identifier> that is
  the ampersand is directly prepended to the formal parameter. In CL passing a 'place'
  around is not possible, that is, "places are not first-class-objects". We can get at
  the concept through passing lambda closures about that have the value in its 
  environment. IIRC the lack of this is firstly because it is error prone and bad
  style to begin with.
Efficiency:
  Whenever a procedure is called, or a function, with in parameters, new memory needs to
  be allocated for the formal parameters to store the copies of them. var-parameters,
  however, don't need to allocate new memory as we're dealing with the reference passed
  directly.
  However, this may be memory efficient but side-effects are a can of worms on their
  own, when it comes to debugging, readability etc. Knuth comes to mind: "Premature 
  optimization is the root of all evil."
  }
procedure IncrementByReference(var ioToBeIncremented : integer );
begin
   ioToBeIncremented := ioToBeIncremented + 1;
end; {IncrementByReference}

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
