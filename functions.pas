{ On functions }

program FunctionShow (input, output);

{ after the constant, type definition and variable declaration part comes the, }
{ function declaration part: }

{ function heading; block }

             {type : identifier, .. }     { result type}
function Add (x	: integer; y : integer) : integer;       {<-  function heading}
{ a comment below the function heading, like this one, should explain the 
  function. Just like in CL!
"Adds two numbers, x and y." }

{ the function can also contain the definition and declaration parts of a program,
because it contains "a block". Declarations in this scope are called: _dt._ "lokal".
Ferner sprechen wir hier vom /Gültigkeitsbereich/ der vereinbarten Objekte. }

begin
   { hm, if you leave the block empty, it returns the number -19672, some address? }
   { oh.. oh wow, this is how we return a value: }
   Add := x + y;
   { yep, the function name is used as a container for the return value! Weird. }
   { Well it can make for neat documentation, as in: the sqrt of 4 is 2, that is,
     Sqrt := 2; }
   { CAREFUL: The function name return-value-container- may _never be read_!!
     Though it seems to work, it may be due to the compiler implementation. }
end;


function Rec (x	: integer) : integer;
{ example of a recursive function 
  ! style guide requires to, usually, say something about the formal parameters used !
  x is used as for the rule to terminate the building of the deferred recursion chain}

begin
   if (x >= 0) then 
   begin { remember, this 'begin' here has to be in the same column as its IF (style guide)}
      writeln('recursed.');
      writeln(Rec (x-1));
   end
   else
      writeln('done with the cursing');

   writeln('uncurse.');
   Rec := x;
end;

begin
   writeln('Dear computer Sir, what is 10 - 2?');
   writeln(Add(10, -2));
   writeln('Recursion test: ', Rec(3));
end.
