Program Aufgabe3(input,output);
{ blah blah macht das was aufgabe vorgibt }

const
  FELDGROESSE = 5;

type
  tIndex = 1..FELDGROESSE;
  tFeld	 = array[tIndex] of integer;

var
  A, B :  tFeld;

function equalArrays(inA : tFeld; inB : tFeld) : boolean;
{ gibt boolean true aus wenn alle element inA auch inB enhalten sind }
var
  i, j		 : tIndex;
  innerContained : boolean;
  outerContained :  boolean;
begin
  innerContained := false;
  for i := 1 to FELDGROESSE do
  begin
    for j := 1 to FELDGROESSE do
    begin
    innerContained := false;
    outerContained := false;
      if (inA[i] = inB[j]) then
	begin
	  innerContained := true;
	  Break;
	  writeln('inner break');
	end;
    end; { inner loop}
    if (false = innerContained) then
    begin
      writeln('outer break');
      Break;
    end
    else
    begin
      outerContained := true;
    end;
  end; { outer loop}
  if outerContained then
  begin
    equalArrays := true;
  end
  else
  begin
    equalArrays := false;
  end;
end;

begin
  { init A & B }
  A[1] := 1;
  A[2] := 5;
  A[3] := 3;
  A[4] := 4;
  A[5] := 5;
  B[1] := 1;
  B[2] := 5;
  B[3] := 3;
  B[4] := 5;
  B[5] := 6;
  writeln('A:');
  writeln(A[5]);

  writeln('A equal B?');
  writeln(equalArrays(A, B));
end.
