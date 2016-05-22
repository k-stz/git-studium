Program TesteBlattMax (input, ouput);

   type
   tNatZahl = 1..maxint;
   tRefBinBaum = ^tBinBaum;
   tBinBaum = record
		 Wert:tNatZahl;
		 links:tRefBinBaum;
		 rechts:tRefBinBaum
	      end;

   var
   Wurzel : tRefBinBaum;
   blaetterSindMax : Boolean;


  
function BlattMax ( inRefWurzel : tRefBinBaum; pfadMax : tNatZahl) : Boolean;
   { prüft ob alle Blätter des Baumes die Maxima der Pfade zu ihnen sind }
begin
   { Prüfen ob Blatt erreicht }
   if ((inRefWurzel^.links = nil) and
       (inRefWurzel^.rechts = nil)) then
   begin
       if (inRefWurzel^.Wert >= pfadMax) then
   	 BlattMax := true
      else
   	 BlattMax := false;
   end
   else	{ kein Blatt erreicht}
   begin
       if (inRefWurzel^.Wert > pfadMax) then
   	 pfadMax := inRefWurzel^.Wert;

      { rekursiv Baum runterlaufen, wir müssen beachten das
        manche knoten nur links, nur rechts oder auf beiden Seiten
        Knoten haben }
      if (inRefWurzel^.links = nil) then
	 BlattMax := BlattMax (inRefWurzel^.rechts, pfadMax)
      else
	 if (inRefWurzel^.rechts = nil) then
	    BlattMax := BlattMax (inRefWurzel^.links, pfadMax)
	 else
	 begin
	    BlattMax := BlattMax (inRefWurzel^.links, pfadMax) and
	                BlattMax (inRefWurzel^.rechts, pfadMax);
	 end;
   end;
end;

procedure BaumAufbauen (var outWurzel : tRefBinBaum) ;
   var 
   index,
   Zahl : integer;
   elter, neuerKnoten : tRefBinBaum;    
     
  function KnotenVonIndex (baum : tRefBinBaum; index : integer) : tRefBinBaum;
     var
     elter : tRefBinBaum;
  begin
     if (index = 1) then
	KnotenVonIndex := baum
     else
     begin
	elter := KnotenVonIndex(baum, index div 2);
	if ( (index mod 2 ) = 0 ) then
	   KnotenVonIndex := elter^.links
	else
	   KnotenVonIndex := elter^.rechts
     end;
  end;

begin
   read (index);

   new (outWurzel);
   read (Zahl);
   outWurzel^.Wert := Zahl;

   read (index);
   while (index <> 0) do
   begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
       
      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  

      if ( (index mod 2 ) = 0 ) then
	 elter^.links := neuerKnoten
      else
	 elter^.rechts := neuerKnoten;
           
      read (index);      
   end;    
end; { BaumAufbauen }



begin
   writeln('Bitte Baum in level-order eingeben Eingabeformat: Immer erst der Index eines Knotens, dann dessen Wert:');
   BaumAufbauen (Wurzel);
  
   blaetterSindMax := BlattMax(Wurzel, 1);
  
   if blaetterSindMax then
      writeln ('Alle Blaetter sind groesser als alle Knoten auf den jeweiligen Pfaden zu ihnen.')
   else
      writeln ('Mind. ein Blatt ist nicht groesser als alle Knoten auf seinem Pfad.');

end. { TesteBBKnotenzahl }
