
program TransposeMatrix;
{ Shows different implementation for matrix transposing and shows which work. }

const
   GROESSE = 5;
type
   tMatrix = array [1..GROESSE,1..GROESSE] of integer;

var
   A : tMatrix;
   tauschPuffer,
   i,
   j : integer;

procedure resetMatrix (var ioA : tMatrix);
{ writes test data to Matrix }
begin
   { init data }
   ioA[1,1] := 15; ioA[1,2] := 08; ioA[1,3] := 01; ioA[1,4] := 24; ioA[1,5] := 17;
   ioA[2,1] := 16; ioA[2,2] := 14; ioA[2,3] := 07; ioA[2,4] := 05; ioA[2,5] := 23;
   ioA[3,1] := 22; ioA[3,2] := 20; ioA[3,3] := 13; ioA[3,4] := 06; ioA[3,5] := 04;
   ioA[4,1] := 03; ioA[4,2] := 21; ioA[4,3] := 19; ioA[4,4] := 12; ioA[4,5] := 10;
   ioA[5,1] := 09; ioA[5,2] := 02; ioA[5,3] := 25; ioA[5,4] := 18; ioA[5,5] := 11;
end; { resetMatrix }

procedure isTransposed (inM :  tMatrix);
{ Print answering whether matrix is transposed or not. Only tests against
  test data written in resetMatrix.  }
begin
   write('transposed: ');
   writeln((inM[1,1] = 15) and (inM[1,2] = 16) and (inM[1,3] = 22) and (inM[1,4] = 03) and (inM[1,5] = 09) and
           (inM[2,1] = 08) and (inM[2,2] = 14) and (inM[2,3] = 20) and (inM[2,4] = 21) and (inM[2,5] = 02) and
	   (inM[3,1] = 01) and (inM[3,2] = 07) and (inM[3,3] = 13) and (inM[3,4] = 19) and (inM[3,5] = 25) and
	   (inM[4,1] = 24) and (inM[4,2] = 05) and (inM[4,3] = 06) and (inM[4,4] = 12) and (inM[4,5] = 18) and
	   (inM[5,1] = 17) and (inM[5,2] = 23) and (inM[5,3] = 04) and (inM[5,4] = 10) and (inM[5,5] = 11));
end; { isTransposed }

procedure PrintMatrix (inMatrix	: tMatrix);
{ Print input Matrix readably on the screen. }
   var
      i,
      j :  integer;

begin
   for i := 1 to GROESSE do
   begin
      for j := 1 to GROESSE do
      begin
	 write(inMatrix[i,j]:2, ' ');
      end;
      writeln();
   end;
end; { PrintMatrix }

begin
   resetMatrix(A);
   writeln('Original test Matrix:');
   PrintMatrix(A);

   { A }
   begin
      for i := 1 to GROESSE-1 do
   	 for j := i+1 to GROESSE do
   	 begin
   	    tauschPuffer := A[i,j];
   	    A[i,j] := A[j,i];
   	    A[j,i] := tauschPuffer
   	 end
   end;
   writeln();
   writeln('A:');
   isTransposed(A);
   PrintMatrix(A);
   resetMatrix(A);

   { B }
   begin
      for i := 1 to GROESSE do
   	 for j := 1 to i do
   	 begin
   	    tauschPuffer := A[i,j];
   	    A[i,j] := A[j,i];
   	    A[j,i] := tauschPuffer
   	 end
   end;
   writeln();
   writeln('B:');
   isTransposed(A);
   PrintMatrix(A);
   resetMatrix(A);

   { C }
   begin
      for i := 1 to GROESSE do
	 for j := 1 to GROESSE do
	 begin
	    tauschPuffer := A[i,j];
	    A[i,j] := A[j,i];
	    A[j,i] := tauschPuffer
	 end
   end;
   writeln();
   writeln('C:');
   isTransposed(A);
   PrintMatrix(A);
   resetMatrix(A);

   { D }
   begin
      for i := 1 to GROESSE do
   	 for j := 1 to GROESSE-i do
   	 begin
   	    tauschPuffer := A[i,j];
   	    A[i,j] := A[j,i];
   	    A[j,i] := tauschPuffer
   	 end
   end;
   writeln();
   writeln('D:');
   isTransposed(A);
   PrintMatrix(A);
   resetMatrix(A);

   { E }
   begin
      for i := 1 to GROESSE-1 do
   	 for j := i+1 to GROESSE do
   	 begin
   	    tauschPuffer := A[i,j];
   	    A[j,i] := A[i,j];
   	    A[j,i] := tauschPuffer
   	 end
   end;
   writeln();
   writeln('E:');
   isTransposed(A);
   PrintMatrix(A);
   resetMatrix(A);

end. { TransposeMatrix }
