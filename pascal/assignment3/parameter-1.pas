{ Von welcher Art (Werte übergabe oder Call by value) müssen _alle_ Parameter von
 globalProc und localProc jeweils sein damit die Rückgabe
 1 -3 4 
 ausgegeben wird.}

program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
  ten Programmierstil und dient nur zum Ueben der Parameterueber-
  gabearten. }

  var 
  a,
  b,
  c : integer;

procedure globalProc (var d : integer ; var e : integer; var f : integer);
{ procedure globalProc (d : integer ; e : integer; f : integer); }

    var 
    a : integer; 

   procedure lokalProc (  var g : integer; var h : integer; var i : integer);
   { procedure lokalProc (  g : integer;  h : integer;  i : integer); }
      var 
      b : integer;

    begin
      g := h + i;
      b := c; { now b is shadowed so 'i' doesn't change it's value here
                that's why 'c' has still the value of the globalProc assignment d := e - f, so 4 }
      {this a, though call by value, points only to the same data that the shadowing a from globalProc
       points to! Hence a = g}
      a := 2 * b; {2*4}
      i := a + b; {8+4}
    end; { lokalProc }

  begin
    a := 4;  {this one doesn't change f, because 'a' is local in this procedure - it 'shadows' it}
    b := 5;  {careful, this assignment changes the value 'e' points to! b = e} 
    c := 6;
    d := e - f; {5 - 1}
    lokalProc (a, d, e);
    { f stays 1, due to the shadowing a in localProc,
      d = h and though not shadowed, they weren't assigned to in localProc so they stay the same.
    e, finally, is being assigned just now. In effect the _parameter types of localProc are inconsequential_
    to the values printed.}
     e := f - d; {1 - 4}
  end; { globalProc }

begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }

