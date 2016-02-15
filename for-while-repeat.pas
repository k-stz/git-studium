(* Author: k-stz *)

{ Shows of the FOR WHILE and REPEAT loop syntax }

program Loops;

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


begin
   
   writeln('for:');
   for i := 0 to 2 do
      writeln(i);

   writeln('fact(10):');
   fact(8);
   
   

end.
