Program Aufgabe4(input, output);

type
  tRefDVElement = ^tDVElement;
  tDVElement = record
		 Wert : integer;
		 next, prev : tRefDVElement
	       end;

var
  list : tRefDVElement;

procedure printList (inList : tRefDVElement);
begin
  while (inList <> nil) do
  begin
    write(inList^.wert);
    write(' next:');
    if (inList^.next <> nil) then
    begin
      write(inList^.next^.wert);
    end
    else
    begin
      write('nil');
    end;
    write(' prev:');
    if (inList^.prev <> nil) then
    begin
      write(inList^.prev^.wert);
    end
    else
    begin
      write('nil');
    end;
    writeln();			 {newline}
    inList := inList^.next;
  end;
end;
			    
procedure DVEListenElementEntfernen( inElement : integer ; var ioPointer : tRefDVElement);
{ entferne 'element' aus der doppelt verketteten Liste, Prozedur erwartet als eingabe
  das erste element der verketteten Liste! }
var
  first	:  tRefDVElement;
begin
  first := ioPointer;
  { element finden }
  while (ioPointer <> nil) do
    begin
      if (ioPointer^.wert = inElement) then
      begin
	{ da nun element entfernt wird, mache folge element zum neuen "first" element }
	if (first = ioPointer) then
	  begin
	    first := ioPointer^.next;
	  end;
	  { entferne inElement }
	  { nachfolger zeigt auf vorgänger }
	  if (ioPointer^.next <> nil) then
	    { sodass wir next^ dereferenzieren können }
	    begin
	      ioPointer^.next^.prev := ioPointer^.prev;
	    end;
	  { vorgänger zeigt auf nachfolger }
	  if (ioPointer^.prev <> nil) then
	    { analog.  }
	    begin
	      ioPointer^.prev^.next := ioPointer^.next;
	    end;
	end;
      ioPointer := ioPointer^.next;
    end;
  { Zuletzt sorgen wir dafür das auf das erste element gezeigt wird }
  ioPointer := first;
end;

begin
  { build list }
  { first }
  new(list);
  list^.wert := 1;
  new(list^.next);
  new(list^.prev);
  list^.prev := nil;
  { 2nd }
  list^.next^.wert := 2;
  new(list^.next^.prev);
  new(list^.next^.next);
  list^.next^.prev := list;
  { 3rd }
  list^.next^.next^.wert := 3;
  new(list^.next^.next^.next);
  new(list^.next^.next^.prev);
  list^.next^.next^.prev := list^.next;
  list^.next^.next^.next := nil; {end of list}

  { print list }
  printList(list);
  { remove element }
  writeln('removing an element');
  DVEListenElementEntfernen(2, list);
  { print again, hopefully without the element }
  printList(list);
  
end.
