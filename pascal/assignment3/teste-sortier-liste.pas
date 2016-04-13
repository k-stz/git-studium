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
  Sortiert : integer;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }
     var
     { Start und Ende der sortierten Liste, diese werden
       sich zur Laufzeit auseinander ziehen.}
     RefStart,
     RefEnde,
     { wird ein interpolierten Zeiger zwischen RefStart und RefEnde
       halten.. }
     interZeiger,
     { zum entfernen des vordersten, unsortierten, Elements beim
       einfuegen in den sortierten Teil. }
     RefVorgaenger : tRefListe;
     { ..zum iterieren durch die sortierte Liste sodass wir ein
       neues Element einfügen können.  }
     i : integer;
     Eingefuegt : boolean;
     
  begin
     writeln('SortiereListe---------------');
     { base case - die Leere Liste }
     if ioRefListe <> nil then
     begin
	{ init }
	RefStart := ioRefListe;
	interZeiger := ioRefListe;
	RefVorgaenger := ioRefListe;
	RefEnde := ioRefListe^.next;
	Sortiert := 1;
	{ the main algorithm }
	while RefEnde <> nil do
	begin
	   writeln(RefEnde^.info);

	   i := 1;
	   Eingefuegt := false;
	   while (i <= Sortiert) and (not Eingefuegt) do
	   begin
	      writeln('i:', i);
	      writeln(RefEnde^.info);
	      if (interZeiger^.info >= RefEnde^.info) then
	      begin
		 { RefEnde entfernen }
		 writeln('interZeiger >= RefEnde', ' ', interZeiger^.info, ' ', RefEnde^.info);
		 writeln(RefVorgaenger^.info);
		 
	      end;
	      i := i + 1;
	   end;
	   
	   RefEnde := RefEnde^.next;
	end;


	writeln('RefEnde = nil!');
     end
     else
	writeln('ioRefListe is nil');

     writeln('/SortiereListe--------------');
  end;

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
  { ListeEinlesen(RefListe); }
  { test data! Remove once implemented }
  Anhaengen(RefListe, 1); 
  Anhaengen(RefListe, 44); Anhaengen(RefListe, 3); Anhaengen(RefListe, 0);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end. { TesteSortiereListe }

