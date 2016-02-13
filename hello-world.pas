(* Author: k-stz *)

{ Pascal ist eine typisierte Programmiersprache, da jede Variable,
  vor der Benutzung, einem eindeutigen Datentyp zugeordnet werden
  muss. }

Program Hi_Program;

Procedure Test1;
{declaration part:}

{ It seems between Begin and End variable definition is forbidden }
const PI2 = sqr(pi); {constants should be written in _uppercase_! (style guide)}

{ "variable declaration part" }
var
   age,
   money : integer; 	{age and money both get the type integer here}

{/declaration part }
Begin
  {statement part}
   writeln('pi2:');
   Writeln(pi2);
   Writeln('How old are you');
   readln(age);
   writeln('That''s funny, I''m also');
   writeln(age);
   writeln('years old!');
  {/statement part }
End;



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
   Writeln('1=1 and true != false:');
   Writeln((1 = 1) and true <> false);
   Writeln('1 <= 12:');
   Writeln(1 <= 12);
   Writeln(1 <> 1);

   Test1;
end.

