

program Recursion (input, output);
{ Some examples of recursion }

function Fac(inN : integer) : integer;
{ Computes the factorial of inN. }
begin
   if inN = 0 then
      { this is the terminating base-case }
      Fac := 1
   else
      Fac := inN * Fac(inN - 1)
end;  { Fac }

begin
   writeln('Oh, remember: Pascal''s Integer can''t handle big numbers. ',
	   'Fac(7) is the limit, lol');
   writeln(Fac(1));

end.  { Recursion }
