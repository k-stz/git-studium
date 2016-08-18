program Test;

  type
    tAge      = 0 .. 200;
    tGender   = (male, female);
    tHuman    = record
		  name	 : string;
		  age	 : tAge;
		  gender : tGender;
		end; { tHuman }
    tRefListe = ^tListe;
    tListe    =  record
		   info	: integer;
		   next	:  tRefListe;
		 end;
  var
    Dude  : tHuman; 
    Liste : ^tListe;

  const
    UPPERCASE = 'constant value';

begin
  Dude.name := 'Processus Vitelius';
  Dude.gender := male;
  writeln(Dude.name);
  writeln(UPPERCASE);
  new(Liste);
  Liste^.info := 22;
  writeln(Liste^.info);
  { next list element }
  new(Liste^.next);
  Liste^.next^.info := 33;
  writeln(Liste^.next^.info);

  { Liste^.info = 22; }

end. {Test}
