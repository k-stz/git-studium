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
end;


begin
   writeln('Dear computer Sir, what is 10 - 2?');
   writeln(Add(10, -2));
end.
