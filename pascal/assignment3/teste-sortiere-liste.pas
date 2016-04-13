program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe    : tRefListe;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }
     var
     tmp, { Hilfsvariable zum umhängen}
     iterZeiger, { zum iterieren durch die Liste}
     Zeiger : tRefListe; { das letzte sortierte Element }
     Eingefuegt : boolean;

     { Im folgenden heißt "Element" immer das erste Element aus dem unsortieren Listen Teil. }
     begin
	{ base case - die Leere Liste }
	if (ioRefListe <> nil) then
	begin
	   { init }
	   Zeiger := ioRefListe;
	   new(tmp);
	   while (Zeiger^.next <> nil) do
	   begin
	      { kleinstes Element? -> hänge an den Anfang der Liste}
	      if(ioRefListe^.info >= Zeiger^.next^.info) then
	      begin
		 { Verweis auf Folgeelement wird zwischengespeichert }
		 tmp := Zeiger^.next^.next;
		 { Element wird an Anfang der Liste gehangen }
		 Zeiger^.next^.next := ioRefListe;
		 { Element wird zum neuen Anfang der Liste }
		 ioRefListe := Zeiger^.next;
		 { Letztes sortiertes Element zeigt nun auf den Nachfolger des Elements bevor es
		 umgehangenen wurde, d.h. das nächste unsortierte Element. }
		 Zeiger^.next := tmp;
	      end
	      else { nicht kleinstes Element}
	      begin
		 { Element ist das größte? -> hänge ans ende der sortierten Liste}
		 if (Zeiger^.info <= Zeiger^.next^.info) then
		 begin
		    { easy, Element einfach Vorne belassen und es zum neuen vordersten Zeiger machen. }
		    Zeiger := Zeiger^.next;
		 end
	         else
		 begin
		    { Element ist weder das kleinste noch das größte, jetzt suchen wir nach einer Stelle,
		    in der sortierten Liste, um es einzuhängen. }
		    Eingefuegt := false;
		    iterZeiger := ioRefListe;
		    while (not Eingefuegt) do
		    begin
		       if (iterZeiger^.next^.info >= Zeiger^.next^.info) then
		       begin
			  tmp := Zeiger^.next^.next; {Folgeelement zwischenspeichern}
			  { Element wird umgehangen }
			  Zeiger^.next^.next := iterZeiger^.next; {sortierte liste  *klick* vorne}
			  iterZeiger^.next := Zeiger^.next; {sortierte liste *klick* hinten}
			  
			  { letztes sortiertes Element zeigt nun auf das nächste unsortierte, das 
			    wir vorher in tmp zwischengespeichert haben. }
			  Zeiger^.next := tmp;
			  Eingefuegt := true;
		       end;
		       iterZeiger := iterZeiger^.next;
		    end;  {while (not Eingefuegt) }
		 end;
	      end;
	   end; { while (Zeiger^.next <> nil) }
	end; { base case - die leere Liste}
     end; { SortiereListe }

procedure Anhaengen(var ioListe : tRefListe;
                        inZahl : tNatZahl);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end;
end;

procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch Leerzeile abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
  writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
  Liste := nil;
  readln(Zeile);
  val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
  while Code=0 do
  begin
    Anhaengen(Liste, Zahl);
    readln(Zeile);
    val(Zeile, Zahl, Code);
  end; { while }
  outListe := Liste;
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  Zeiger := inListe;
  while Zeiger <> nil do
  begin
    writeln(Zeiger^.info);
    Zeiger := Zeiger^.next;
  end; { while }
end; { GibListeAus }

begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end. { TesteSortiereListe }

