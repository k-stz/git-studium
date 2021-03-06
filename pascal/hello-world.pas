{$R+ <- this enables range checking, this can be also enabled by passing an option to the
        command line compiler: fpc -Cr.
        the next option, sadly, doesn't have a commandline switch: }
{$B+ <- this enables complete boolean evaluation, see the test below using isEvaluated
        it won't be called if this $B+ is missing} 
(* Author: k-stz *)

{Style guide:
   must have:
     - Identifiers _must_ be written in CamelCase (think Java),
     - CONSTANT identifiers _must_ be written in uppercase
     - tType identifiers must start with a 't' (tWeek, tWeekend)
     - begin
         between Begin and End
         we indent by 2 or
           4 spaces, but 
           consistently 
       end 
     - In if-then-else control structures, the begin/end share the
       same column:
       
       if <predicate> then
       begin
         <consequence>
       end
       else
       begin
         <alternative>
       end;
     
     - program indent (input, output);
         const
         UPPERCASE = 'SAME COLUMN AS const!';
         // same for type and var declaration/definition blocks

       begin
       end. /* indent */ <- seems like we write the name of procedure/ function at the end
     
     - comments: in the program headline you must write down what the program does (not
                 how it does it). Usually you _must_ comment the input and output data. 
                 TODO: what about procedures and functions?
}

{ Pascal ist eine typisierte Programmiersprache, da jede Variable,
  vor der Benutzung, einem eindeutigen Datentyp zugeordnet werden
  muss. }

{Program: <program heading> + <block> + . }

program HiProgram; {<- this is the whole "program heading". What follows, all
		       the way to the 'End.' at the very end is the <block> }

{ The point of this program is its implementation, a collection of concepts and idea
  of the programming language Pascal }

  var
  x : integer;

procedure IsOdd (input : integer);
begin
   write(input);
   if (odd(input)) then
     writeln(' is odd') {<- careful, no semicolon here!}
   else
     writeln(' is even');
end { IsOdd };


procedure Test1;
{declaration part:   <constant definition part>
                   + <type definition part>
                   + <variable declaration part> }

{ It seems between Begin and End variable definition is forbidden }

  const PI2 = sqr(pi); {constants should be written in _uppercase_! (style guide)}


  { type definition part, comes aptly before the variable one,
    as those will be used for variables! }

  (* these also have an inner order such that we can compare them
     and yield ORD(<tWeek var>) from them *)
  type tWeek = (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);

  { dt. Ausschnittstyp, en. /subrange type/ }
  tWeekend = Saturday .. Sunday;


{ "variable declaration part" }
  var
  age,
  money : integer; 	{age and money both get the type integer here} 
  day : tWeek;							       
  weekend : tWeekend;

{/declaration part }

{statement part: 'Begin'-label + <statement part> + 'End'-label}
begin
   { writeln('pi2:'); }
   { Writeln(pi2); }
   { Writeln('How old are you'); }
   { readln(age); }
   { writeln('That''s funny, I''m also', age); }
   { writeln('years old! And I have twice as much money:'); }
   {  money := age * 2;  {<- assignment statement } }
   { writeln(money); }
   { writeln( day ); }
   writeln('own type definitions tests: ');
   writeln(tWeek(ord(succ (day)))); (* like with standard types, the type identifier is also a function! *)

   weekend := tWeekend(5); {!! careful, we can now only use tWeekend(5) and tWeekend(6) !!}
   writeln(weekend);  
   weekend := Sunday;	   {we can use the enumerator elements explicitly though!}
   writeln(weekend);
end { Test1 };
{/statement part }

function isEvaluated () : boolean;
begin
   writeln('isEvaluated invoked!');
   isEvaluated := true;
end; { isEvaluated}

begin
   writeln('maxinteger:'); {<- 'strings'}
   writeln(succ(3) - pred(1));
   writeln(exp(ln(10))); {==> 1.0}
   writeln('Char:');
   writeln(succ('a'));	 {SUCC and PRED are also defined for CHARs}
   {ORD returns the ordinals for the char, CHAR returns char denoted by the ordinal}
   writeln(char(ord('t')));
   {Boolean: }
   writeln('Boolean:');
   writeln(true and false or not false ); {1 ∧ 0 ∨ ¬0}
   writeln('1=1 and true != false:',(1 = 1) and true <> false);
   writeln('1 <= 12:',1 <= 12,1 <> 1);

   x := 10;
   writeln(x);
   begin (* not a new name space or lexical scope *)
      x := 22;
      writeln(x);
   end;
   (* x is still 22 here *)

   Test1;
   IsOdd(10);

   writeln('Complete Boolean Evaluation test:');
   if (true or isEvaluated()) then
      writeln('done');
   
end { HiProgram }. 

