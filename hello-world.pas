(* Author: k-stz *)

{ Pascal ist eine typisierte Programmiersprache, da jede Variable,
  vor der Benutzung, einem eindeutigen Datentyp zugeordnet werden
  muss. en  }

Program Hi_Program;

Procedure Test1;
{yep, this is comment syntax}
Begin
   writeln('test called, son.');
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

   { Test1;  }
end.

