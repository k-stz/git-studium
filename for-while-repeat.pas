(* Author: k-stz *)

program Loops;
{ Shows off the FOR, WHILE and REPEAT loop syntax }
  var
  i :  integer;

procedure fact (number : integer );
   { careful, overflows quickly!
     maxint is only 32767! }
   var
   i, accu : integer;

begin
   accu := 1; 	{ initialisation }
   for i := 1 to number do
   begin
      writeln(accu);
      accu :=  accu * i;
   end;
   writeln(accu);
   
end;


procedure whilePrompt ();
  var
  askAgain : boolean;
     input :  char;
begin
   askAgain := true; { init }

   while askAgain do
   begin
      writeln('type q, to quit');     
      readln(input); { ugh, you have to create a new variable so it implicitly receives
                       a value, cause READLN doesn't return a value!!!}
      if ('q' = input) then
	 askAgain := false;
   end;
end;

procedure repeatGreet ();
  var
     name	: string;
     cheerTimes	:  integer;

begin
   name := 'Blaise P.';
   cheerTimes := 3;
   { repeat is like Java do-while statement, that is, it runs at least once }
   repeat
      writeln('sup, name''s ', name);
      cheerTimes := cheerTimes - 1;
   until cheerTimes <= 0;
end;

begin
   
   writeln('for:--------');
   for i := 0 to 2 do
      writeln(i);

   writeln('fact(10):');
   fact(8);

   writeln('while:------');
   whilePrompt();

   writeln('repeat:------');
   repeatGreet();   
end. {Loops}
