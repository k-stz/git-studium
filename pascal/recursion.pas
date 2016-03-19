

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

function FacIter (inN :  integer) : integer;
{ Compute factorial with a function generating an interative process. }

   { Yes, this function can be only seen within FacIter, not in the body
   of the "Recursion" program.  }
   function Iter (inN : integer; inProduct : integer) : integer;
   { Auxiliary function hiding the state variable "inProduct" from the API of
     FacIter }
   begin
      if (inN > 0) then
	 Iter := Iter (inN-1, inProduct * inN)
      else
	 Iter := inProduct;
   end;	{ Iter }

begin
   FacIter := Iter(inN, 1);
end;  { FacIter }

begin
   writeln('Oh, remember: Pascal''s Integer can''t handle big numbers. ',
	   'Fac(7) is the limit, lol');
   writeln(Fac(7));

   writeln(FacIter(7));
end.  { Recursion }
