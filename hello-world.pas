(* Author: k-stz *)

{ Pascal ist eine typisierte Programmiersprache, da jede Variable,
  vor der Benutzung, einem eindeutigen Datentyp zugeordnet werden
  muss. }

{Program: <program heading> + <block> + . }


Program Hi_Program; {<- this is the whole "program heading". What follows, all
		    the way to the 'End.' at the very end is the <block>, minus
		    the dot '.' (the dot in 'End.')}

var
   x : integer;

procedure IsOdd (input : integer);
Begin
   write(input);
   if (odd(input)) then
      writeln(' is odd') {<- careful, no semicolon here!}
   else
      writeln(' is even');
End;


Procedure Test1;
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
Begin
   { writeln('pi2:'); }
   { Writeln(pi2); }
   { Writeln('How old are you'); }
   { readln(age); }
   { writeln('That''s funny, I''m also', age); }
   { writeln('years old! And I have twice as much money:'); }
   {  money := age * 2;  {<- assignement statement } }
   { writeln(money); }
   { writeln( day ); }
   writeln('own type definitions tests: ');
   writeln(tWeek(ord(succ (day)))); (* like with standard types, the type identifier is also a function! *)

   weekend := tWeekend(5); {!! careful, we can now only use tWeekend(5) and tWeekend(6) !!}
   writeln(weekend);  
   weekend := Sunday;	   {we can use the enumerator elements explicitly though!}
   writeln(weekend);
End;
{/statement part }


Begin
   Writeln('maxinteger:'); {<- 'strings'}
   Writeln(succ(3) - pred(1));
   Writeln(exp(ln(10))); {==> 1.0}
   Writeln('Char:');
   Writeln(succ('a'));	 {SUCC and PRED are also defined for CHARs}
{ORD returns the ordinals for the char, CHAR returns denoted by the ordinat}
   Writeln(char(ord('t')));
   {Boolean: }
   Writeln('Boolean:');
   Writeln(true and false or not false ); {1 ∧ 0 ∨ ¬0}
   Writeln('1=1 and true != false:',(1 = 1) and true <> false);
   Writeln('1 <= 12:',1 <= 12,1 <> 1);

   x := 10;
   writeln(x);
   Begin (* not a new namespace or lexical scope *)
      x := 22;
      writeln(x);
   End;
   (* x is still 22 here *)

   Test1;
   IsOdd(10);
End. 

